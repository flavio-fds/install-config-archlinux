#!/usr/bin/env zsh

echo install with scrip https://github.com/archlinux/archinstall

NAME_DEVICE="wlan0"
NETWORK_NAME="CLARO_2G7DDB3D"
REPOSITORY_URL="git@github.com:flavio-fds/install-config-archlinux.git"
DIR_CONFIG="/root/install-config-archlinux/install-archlinux/configs"

connect-wifi(){
###Connect wifi###

#iwctl
#	[iwd]# device list (placas de rede Wi-Fi)
#	[iwd]# station "name" scan (Inciar busca de rede)
#	[iwd]# station "name" get-networks (mostrar redes encontradas)
#	[iwd]# station "name" connect "network name" (Conectar na rede Escolhida)
#	[iwd]# "password" (senha)
#	[iwd]# exit (Fechar software)

#iwctl device list
#iwctl station <name_device> scan
#iwctl station <name> connect <network name>
echo Connect wifi

iwctl station $NAME_DEVICE connect $NETWORK_NAME 
}

check-connectiont(){
echo Check connection
if ! ping -c 1 8.8.8.8 -q &> /dev/null; then
  echo -e "${VERMELHO}[ERROR] - Seu computador não tem conexão com a Internet. Verifique o script com nome do device e da rede.${SEM_COR}"
  exit 1
else
  echo -e "${VERDE}[INFO] - Conexão com a Internet funcionando normalmente.${SEM_COR}"
fi
}

clone-repository(){
echo Install Git 
pacman -S git 
git clone "$REPOSITORY_URL"
}

start-install-archinstall(){
archinstall --config "$DIR_CONFIG/config.json" --disk-layout "$DIR_CONFIG/layout.json" --creds "$DIR_CONFIG/creds.json"
}

connect-wifi
check-connectiont
clone-repository
start-install-archinstall

