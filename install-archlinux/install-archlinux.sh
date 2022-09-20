#!/usr/bin/env zsh

#chmod +x auric.sh

VERMELHO='\e[1;91m'
VERDE='\e[1;92m'
SEM_COR='\e[0m'

Y="y"
REPOSITORY_URL="https://github.com/flavio-fds/install-config-archlinux.git"
DIR_CONFIG="/root/install-config-archlinux/install-archlinux/configs"

echo ""
echo ""
echo -e "${VERMELHO}#######################################################################${SEM_COR}"
echo -e "${VERMELHO}#######################################################################${SEM_COR}"
echo -e "${VERDE}##                         1 - connect wifi                          ##${SEM_COR}"
echo -e "${VERDE}##                       2 - check-connectiont                       ##${SEM_COR}"
echo -e "${VERDE}##     3 - clone repository file config arch install      $DIR_CONFIG##${SEM_COR}"
echo -e "${VERDE}##  4 - install with scrip https://github.com/archlinux/archinstall  ##${SEM_COR}"
echo -e "${VERMELHO}#######################################################################${SEM_COR}"
echo -e "${VERMELHO}#######################################################################${SEM_COR}"

start-script(){
  echo -e "${VERDE}start script(y/N)${SEM_COR}"
  read VERIFICATION
  [ -z "$VERIFICATION" ] || [ ${VERIFICATION} != $Y ] && echo -e "${VERMELHO}script finished${SEM_COR}" && exit
  [ ${VERIFICATION} == $Y ] && echo -e "${VERDE}script starting${SEM_COR}"
}

set-layout-keyboard(){
loadkeys br-abnt2
}

check-connectiont(){
echo -e "${VERDE}Check connection...${SEM_COR}"
if ! ping -c 1 8.8.8.8 -q &> /dev/null; then
  echo -e "${VERMELHO}[ERROR] - Your computer does not have an Internet connection. Check the script with device and network name.${SEM_COR}"
  exit 1
else
  echo -e "${VERDE}[INFO] - Internet connection working normally.${SEM_COR}" && sleep 2
fi
}

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

echo -e "${VERDE}Check connection...${SEM_COR}"
if ping -c 1 8.8.8.8 -q &> /dev/null; then
  echo -e "${VERDE}[INFO] - Internet connection working normally.${SEM_COR}" && sleep 2
  return 1
else
  echo -e "${VERDE}[INFO] - Your computer does not have an Internet connection.${SEM_COR}"
fi

echo -e "${VERDE}[INFO] - Connect wifi.${SEM_COR}" && sleep 2

iwctl device list
echo -e "${VERDE}[INFO] -^^^Insert name device ^^^.${SEM_COR}"
read NAME_DEVICE

iwctl station $NAME_DEVICE scan
iwctl station $NAME_DEVICE get-networks

echo -e "${VERDE}[INFO] -^^^Insert network name ^^^.${SEM_COR}"
read NETWORK_NAME


iwctl station $NAME_DEVICE connect $NETWORK_NAME 

check-connection
}

install-packages(){
  if pacman -Q git && pacman -Q vim; then
  echo -e "${VERDE}packages already installed${SEM_COR}" && sleep 1
  return 1
fi

echo -e "${VERDE}[INFO] - Install Git and VIM.${SEM_COR}" && sleep 3
pacman -Sy git vim

if ! pacman -Q git; then
  echo -e "${VERMELHO}error install git${SEM_COR}"
  exit 1
fi

if ! pacman -Q vim; then
  echo -e "${VERMELHO}error install vim${SEM_COR}"
  exit 1
fi
}

clone-repository(){
echo -e "${VERDE}[INFO] - Cloning repository!!!${SEM_COR}"

if [ ! -d "/root/install-config-archlinux" ]; then
  git clone "$REPOSITORY_URL" /root/install-config-archlinux
else
  echo -e "${VERDE}[INFO] - Repository already cloned!!!${SEM_COR}"
  return 1
fi

if [ ! -d "/root/install-config-archlinux" ]; then
  echo -e "${VERDE}[VERMELHO] - Repository clone error!!!${SEM_COR}"
  exit 1
else
  echo -e "${VERDE}[INFO] - Cloned repository!!!${SEM_COR}"
fi

}

edit-name-password(){
echo -e "${VERMELHO}[INFO] - name and password is set to blank.${SEM_COR}"
echo -e "${VERDE}[INFO] - I would like to edit the archinstall config name and password file(y/N).${SEM_COR}"
  read VERIFICATION
  echo
  if [ ${VERIFICATION} = $Y ]; then
    echo -e "${VERDE}editing creds.json${SEM_COR}"
    vim "$DIR_CONFIG/creds.json"
  else
    echo ""
    echo ""
    echo -e "${VERMELHO}#####################################${SEM_COR}"
    echo -e "${VERMELHO}###  Remember config User accoun  ###${SEM_COR}"
    echo -e "${VERMELHO}###  Remember config User accoun  ###${SEM_COR}"
    echo -e "${VERMELHO}###  Remember config User accoun  ###${SEM_COR}"
    echo -e "${VERMELHO}#####################################${SEM_COR}" && sleep 5
  fi
}

start-install-archinstall(){
  echo -e "${VERDE}[INFO] - start script archinstall(y/N).${SEM_COR}"
  read VERIFICATION

  [ -z "$VERIFICATION" ] || [ ${VERIFICATION} != $Y ] && echo -e "${VERMELHO}script finished${SEM_COR}" && exit
  [ ${VERIFICATION} == $Y ] && echo -e "${VERDE}starting archinstall${SEM_COR}" && sleep 2

  echo "archinstall --config "$DIR_CONFIG/config.json" --disk-layout "$DIR_CONFIG/disk_layout.json" --creds "$DIR_CONFIG/creds.json""
  ##archinstall --config "$DIR_CONFIG/config.json" --disk-layout "$DIR_CONFIG/disk_layout.json" --creds "$DIR_CONFIG/creds.json"
  echo ""
  echo ""
  echo -e "${VERMELHO}####################################${SEM_COR}"
  echo -e "${VERMELHO}###  Remember config disklayout  ###${SEM_COR}"
  echo -e "${VERMELHO}###  Remember config disklayout  ###${SEM_COR}"
  echo -e "${VERMELHO}###  Remember config disklayout  ###${SEM_COR}"
  echo -e "${VERMELHO}####################################${SEM_COR}" && sleep 3
  
  archinstall --config "$DIR_CONFIG/config.json" --creds "$DIR_CONFIG/creds.json"

}

start-script
set-layout-keyboard
connect-wifi
install-packages
clone-repository
edit-name-password
start-install-archinstall
