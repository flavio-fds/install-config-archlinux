#!/usr/bin/env zsh

#chmod +x auric.sh

BLACK='\033[0;90m'
RED='\033[0;91m'
GREEN='\033[0;92m' 
YELLOW='\033[0;93m'   
BLUE='\033[0;94m'      
PURPLE='\033[0;95m'   
CYAN='\033[0;96m'     
WHITE='\033[0;97m'  
NO_COLOR='\e[0m'

Y="y"
REPOSITORY_URL="https://github.com/flavio-fds/install-config-archlinux.git"
DIR_CONFIG="/root/install-config-archlinux/install-archlinux/configs"

echo
echo
echo -e "${GREEN}#########################################################${NO_COLOR}"
echo -e "${GREEN}#########################################################${NO_COLOR}"
echo -e "${GREEN}##                     1 - Set keyboar                 ##${NO_COLOR}"
echo -e "${GREEN}##                    2 - connect wifi                 ##${NO_COLOR}"
echo -e "${GREEN}##                 3 - Install package                 ##${NO_COLOR}"
echo -e "${GREEN}##      4 - clone repository file config archinstall   ##${NO_COLOR}"
echo -e "${GREEN}##          5 - install with scrip Archinstall         ##${NO_COLOR}"
echo -e "${GREEN}#########################################################${NO_COLOR}"
echo -e "${GREEN}#########################################################${NO_COLOR}"
echo
echo

start-script(){
  echo -e "${GREEN}start script(y/N)${NO_COLOR}"
  read VERIFICATION
  [ -z "$VERIFICATION" ] || [ $VERIFICATION != $Y ] && echo -e "${RED}script finished${NO_COLOR}" && exit
  [ $VERIFICATION = $Y ] && echo -e "${GREEN}script starting${NO_COLOR}"
}

set-layout-keyboard(){
  echo
  echo -e "${GREEN}Set keyboard!!!${NO_COLOR}"
  loadkeys br-abnt2
  echo
}

connect-wifi(){
  echo
  echo -e "${GREEN}Connect wifi!!!${NO_COLOR}"
  echo

  echo -e "${GREEN}Check connection...${NO_COLOR}"
  if ping -c 1 8.8.8.8 -q &> /dev/null; then
    echo -e "${GREEN}[INFO] - Internet connection working normally.${NO_COLOR}"
    echo
    return 1
  fi
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
echo
echo -e "${GREEN}[INFO] - Connecting wifi...${NO_COLOR}" && sleep 2
echo
iwctl device list
echo -e "${GREEN}[INFO] -^^^Insert name device ^^^.${NO_COLOR}"
read NAME_DEVICE

iwctl station $NAME_DEVICE scan
iwctl station $NAME_DEVICE get-networks

echo -e "${GREEN}[INFO] -^^^Insert network name ^^^.${NO_COLOR}"
read NETWORK_NAME


iwctl station $NAME_DEVICE connect $NETWORK_NAME 
echo
echo -e "${GREEN}Check connection...${NO_COLOR}" && sleep 3

if ! ping -c 1 8.8.8.8 -q &> /dev/null; then
  echo -e "${RED}[ERROR] - Your computer does not have an Internet connection. Check the script with device and network name.${NO_COLOR}"
  exit 1
else
  echo -e "${GREEN}[INFO] - Internet connection working normally.${NO_COLOR}"
  return 1
fi
}

install-packages(){
  echo
  echo -e "${GREEN}Install-packages!!!${NO_COLOR}"
  echo
  if pacman -Q git && pacman -Q vim; then
    echo -e "${GREEN}packages already installed${NO_COLOR}"
    return 1
  fi

  echo -e "${GREEN}[INFO] - Installing Git and VIM.${NO_COLOR}"
  pacman -Sy git vim

  sleep 1

  if ! pacman -Q git; then
    echo -e "${RED}error install git${NO_COLOR}"
    exit 1
  fi

  if ! pacman -Q vim; then
    echo -e "${RED}error install vim${NO_COLOR}"
    exit 1
  fi
}

clone-repository(){
  echo
  echo -e "${GREEN}[INFO] - Cloning repository!!!${NO_COLOR}"
  echo
  if [ ! -d "/root/install-config-archlinux" ]; then
    git clone "$REPOSITORY_URL" /root/install-config-archlinux
  else
    echo -e "${GREEN}[INFO] - Repository already cloned!!!${NO_COLOR}"
    return 1
  fi

  if [ ! -d "/root/install-config-archlinux" ]; then
    echo -e "${GREEN}[RED] - Repository clone error!!!${NO_COLOR}"
    exit 1
  else
    echo -e "${GREEN}[INFO] - Cloned repository!!!${NO_COLOR}"
  fi

}

edit-name-password(){
echo
echo -e "${RED}[INFO] - name and password is set to blank.${NO_COLOR}"
echo -e "${GREEN}[INFO] - I would like to edit the archinstall config name and password file(y/N).${NO_COLOR}"
  read VERIFICATION
  echo
  if ! [[ -z "$VERIFICATION" || $VERIFICATION != $Y ]]; then
    echo -e "${GREEN}editing creds.json${NO_COLOR}"
    vim "$DIR_CONFIG/creds.json"
  else
    echo ""
    echo ""
    echo -e "${RED}#####################################${NO_COLOR}"
    echo -e "${RED}###  Remember config User accoun  ###${NO_COLOR}"
    echo -e "${RED}###  Remember config User accoun  ###${NO_COLOR}"
    echo -e "${RED}###  Remember config User accoun  ###${NO_COLOR}"
    echo -e "${RED}#####################################${NO_COLOR}" && sleep 1
  fi
}

start-install-archinstall(){
  echo 
  echo -e "${GREEN}[INFO] - Start script archinstall.${NO_COLOR}"
  echo 
  echo -e "${RED}#####################################${NO_COLOR}"
  echo -e "${RED}###  Remember config disklayout  ####${NO_COLOR}"
  echo -e "${RED}###  Remember Set Root password  ####${NO_COLOR}"
  echo -e "${RED}###  Remember config User accoun ####${NO_COLOR}"
  echo -e "${RED}#####################################${NO_COLOR}" && sleep 1
  echo
  echo "Type command in terminal to launch archinstall script"
  echo "archinstall --config $DIR_CONFIG/config.json --creds $DIR_CONFIG/creds.json --disk-layout $DIR_CONFIG/disk_layout.json "
  #archinstall --config "$DIR_CONFIG/config.json" --creds "$DIR_CONFIG/creds.json"

}

start-script
set-layout-keyboard
connect-wifi
install-packages
clone-repository
edit-name-password
start-install-archinstall
