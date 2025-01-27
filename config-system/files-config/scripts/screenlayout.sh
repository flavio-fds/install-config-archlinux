#!/usr/bin/env bash

monitores=$(xrandr --listmonitors | awk 'NR>1 {printf "%s ", $4}')

if [[ "$monitores" == *"HDMI-1"* && "$monitores" == *"DP-1-1"* ]]; then
    xrandr --output eDP-1 --off --output HDMI-1 --mode 1920x1080 --pos 1920x0 --rotate normal --output DP-1 --off --output DP-2 --off --output DP-1-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1-2 --off --output DP-1-3 --off
    xrandr --output DP-1-1 --brightness 0.6
    xrandr --output HDMI-1 --brightness 0.6
elif [[ "$monitores" == *"HDMI-1"* ]]; then
    xrandr --output eDP-1 --off --output HDMI-1 --mode 1920x1080 --pos 1920x0 --rotate normal --output DP-1 --off --output DP-2 --off --output DP-1-1 --off --output DP-1-2 --off --output DP-1-3 --off
    xrandr --output DP-1-1 --brightness 0.6
    xrandr --output HDMI-1 --brightness 0.6
elif [[ "$monitores" == *"DP-1-1"* ]]; then
    xrandr --output eDP-1 --off --output HDMI-1 --off --output DP-1 --off --output DP-2 --off --output DP-1-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1-2 --off --output DP-1-3 --off
    xrandr --output DP-1-1 --brightness 0.6
    xrandr --output HDMI-1 --brightness 0.6
fi

exit 1
