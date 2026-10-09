#!/bin/sh
# Alerta de bateria baixa via i3-nagbar.
# Abre um popup ao chegar em 10% e novamente abaixo de 5%.
# Os alertas são rearmados quando o carregador é conectado.

# Primeira bateria encontrada (BAT0, BAT1...); sai se não houver (desktop)
BAT=$(ls -d /sys/class/power_supply/BAT* 2>/dev/null | head -n 1)
[ -z "$BAT" ] && exit 0
WARN=10
CRIT=5
INTERVAL=30
PIDFILE="${XDG_RUNTIME_DIR:-/tmp}/battery-alert.pid"

# Garante uma única instância (i3 pode reexecutar via exec_always)
[ -f "$PIDFILE" ] && kill "$(cat "$PIDFILE")" 2>/dev/null
echo $$ > "$PIDFILE"

warned=0
crited=0
nag_pid=

show_nag() {
    [ -n "$nag_pid" ] && kill "$nag_pid" 2>/dev/null
    i3-nagbar -t "$1" -m "$2" >/dev/null 2>&1 &
    nag_pid=$!
}

# Mesmo cálculo do i3status: carga atual / capacidade de fábrica (design),
# arredondado como integer_battery_capacity.
read_capacity() {
    if [ -r "$BAT/charge_now" ]; then
        now=$(cat "$BAT/charge_now"); full=$(cat "$BAT/charge_full_design")
    else
        now=$(cat "$BAT/energy_now"); full=$(cat "$BAT/energy_full_design")
    fi
    [ -n "$full" ] && [ "$full" -gt 0 ] && echo $(( (now * 100 + full / 2) / full ))
}

while true; do
    cap=$(read_capacity 2>/dev/null)
    status=$(cat "$BAT/status" 2>/dev/null)

    if [ -n "$cap" ]; then
        if [ "$status" = "Discharging" ]; then
            if [ "$cap" -lt "$CRIT" ] && [ "$crited" -eq 0 ]; then
                show_nag error "🪫 Bateria CRÍTICA: ${cap}%! Conecte o carregador agora."
                crited=1
                warned=1
            elif [ "$cap" -le "$WARN" ] && [ "$warned" -eq 0 ]; then
                show_nag warning "🔋 Bateria baixa: ${cap}%. Conecte o carregador."
                warned=1
            fi
        else
            # Carregando: rearma os alertas e fecha o popup
            warned=0
            crited=0
            [ -n "$nag_pid" ] && kill "$nag_pid" 2>/dev/null
            nag_pid=
        fi
    fi

    sleep "$INTERVAL"
done
