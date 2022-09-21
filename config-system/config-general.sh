#!/usr/bin/env bash

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
echo
echo -e "${GREEN}####################################################${NO_COLOR}"
echo -e "${GREEN}############  CONFIG GENERAL SYSTEM!!!  ############${NO_COLOR}"
echo -e "${GREEN}####################################################${NO_COLOR}"
function help {
  echo -e "${PURPLE}
  Insert valid argument

    1 - i3
    2 - i3status
    3 - alacritty
    4 - lf
    5 - theme-rofi
    6 - net-speed
    7 - vim
    8 - bash
    9 - zsh
    10 - dockercompose
    11 - touchpad
    12 - all
    14 - exit
    ${NO_COLOR}"
    start-script
}

config-i3(){
    echo -e "${GREEN}Starting config i3${NO_COLOR}"
    echo "creating folders $HOME/.config/i3/"
    mkdir -p $HOME/.config/i3
    echo "copying i3 config file to $HOME/.config/i3/config directory"
    cp -f ./files-config/i3-config $HOME/.config/i3/config
    echo
    echo -e "${GREEN}###  DONE!!!  ###${NO_COLOR}"
    echo
}

config-i3status(){
    echo -e "${GREEN}Starting config i3status${NO_COLOR}"
    echo "copying .i3status.conf file to $HOME/ directory"
    cp -f ./files-config/i3status.conf $HOME/.i3status.conf
    echo
    echo -e "${GREEN}###  DONE!!!  ###${NO_COLOR}"
    echo
}

config-alacritty(){
    echo -e "${GREEN}Starting config Alacritty${NO_COLOR}"
    echo "creating folders $HOME/.config/alacritty/"
    mkdir -p $HOME/.config/alacritty
    echo "copying alacritty.yml file to $HOME/.config/alacritty/ directory"
    cp -f ./files-config/alacritty.yml $HOME/.config/alacritty/alacritty.yml
    echo
    echo -e "${GREEN}###  DONE!!!  ###${NO_COLOR}"
    echo
}

config-lf(){
    echo -e "${GREEN}Starting config LF${NO_COLOR}"
    echo "creating folders $HOME/.config/lf/"
    mkdir -p $HOME/.config/lf
    echo "copying lfrc file to $HOME/.config/lf/ directory"
    cp -f ./files-config/lfrc $HOME/.config/lf/lfrc
    echo
    echo -e "${GREEN}###  DONE!!!  ###${NO_COLOR}"
    echo
}

config-theme-rofi(){
    echo -e "${GREEN}Starting config theme rofi${NO_COLOR}"
    echo "creating folders $HOME/.config/rofi/"
    mkdir -p $HOME/.config/rofi
    echo "copying theme-rofi-flavio.rasi file to /usr/share/rofi/themes/ directory"
    sudo cp -f ./files-config/theme-rofi.rasi /usr/share/rofi/themes/theme-rofi-flavio.rasi
    echo "copying config.rasi file to $HOME/.config/rofi/ directory"
    cp -f ./files-config/config-rofi.rasi $HOME/.config/rofi/config.rasi
    echo
    echo -e "${GREEN}###  DONE!!!  ###${NO_COLOR}"
    echo
}

config-net-speed(){
    echo -e "${GREEN}Starting config net-speed.sh${NO_COLOR}"
    echo "copying .net-speed.sh file to $HOME/ directory"
    cp ./files-config/net-speed.sh $HOME/.net-speed.sh
    echo
    echo -e "${GREEN}###  DONE!!!  ###${NO_COLOR}"
    echo
}

config-vimrc(){
    echo -e "${GREEN}Starting config vim${NO_COLOR}"
    echo "copying .vimrc file to $HOME/ directory"
    cp ./files-config/vimrc $HOME/.vimrc
    echo
    echo -e "${GREEN}###  DONE!!!  ###${NO_COLOR}"
    echo
}

config-bashrc(){
    echo -e "${GREEN}Starting config bash${NO_COLOR}"
    echo "copying .bashrc file to $HOME/ directory"
    cp ./files-config/bashrc $HOME/.bashrc
    echo
    echo -e "${GREEN}###  DONE!!!  ###${NO_COLOR}"
    echo
}

config-zshrc(){
    echo -e "${GREEN}Starting config zshrc${NO_COLOR}"
    echo "copying .zshrc file to $HOME/ directory"
    cp ./files-config/zshrc $HOME/.zshrc
    echo
    echo -e "${GREEN}###  DONE!!!  ###${NO_COLOR}"
    echo
}

config-dockercompose(){
    echo -e "${GREEN}Starting config docker-compose${NO_COLOR}"
    sudo curl -L "https://github.com/docker/compose/releases/download/v2.5.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose # download and install docker-compose
    sudo chmod +x /usr/local/bin/docker-compose # permission exec 
    echo
    echo -e "${GREEN}###  DONE!!!  ###${NO_COLOR}"
    echo
}

config-touchpad(){
    echo -e "${GREEN}Starting config touchpad${NO_COLOR}"
    echo -e "${GREEN}Dependency libinput${NO_COLOR}"
    echo -e "${GREEN}Dependency xf86-input-libinput${NO_COLOR}"
    echo -e "${GREEN}Reboot system${NO_COLOR}" && sleep 3
    sudo cp -f ./files-config/40-libinput.conf /etc/X11/xorg.conf.d/40-libinput.conf
    echo
    echo -e "${GREEN}###  DONE!!!  ###${NO_COLOR}"
    echo
}

function all {
config-i3
config-i3status
config-alacritty
config-lf
config-theme-rofi
config-net-speed
config-vimrc
config-bashrc
config-zshrc
config-dockercompose
config-touchpad
}

function main {
  [ -z "$1" ] || [ "$1" = "help" ] || [ "$1" = "13" ] && help && exit
  [ "$1" = "i3" ] || [ "$1" = "1" ] && config-i3 && exit
  [ "$1" = "i3status" ] || [ "$1" = "2" ] && config-i3status && exit
  [ "$1" = "alacritty" ] || [ "$1" = "3" ] && config-alacritty && exit
  [ "$1" = "lf" ] || [ "$1" = "4" ] && config-lf && exit
  [ "$1" = "theme-rofi" ] || [ "$1" = "5" ] && config-theme-rofi && exit
  [ "$1" = "net-speed" ] || [ "$1" = "6" ] && config-net-speed && exit
  [ "$1" = "vim" ] || [ "$1" = "7" ] && config-vimrc && exit
  [ "$1" = "bash" ] || [ "$1" = "8" ] && config-bashrc && exit
  [ "$1" = "zsh" ] || [ "$1" = "9" ] && config-zshrc && exit
  [ "$1" = "dockercompose" ] || [ "$1" = "10" ] && config-dockercompose && exit
  [ "$1" = "touchpad" ] || [ "$1" = "11" ] && config-touchpad && exit
  [ "$1" = "all" ] || [ "$1" = "12" ] && all && exit
  [ "$1" = "exit" ] || [ "$1" = "14" ] && exit

  echo -e "${RED}wrong argument: $1 ${NO_COLOR}"
  start-script
}

start-script(){
#   echo -e "${GREEN}start script config(y/N)${NO_COLOR}"
#   read VERIFICATION

#   [ -z "$VERIFICATION" ] || [ ${VERIFICATION} != $Y ] && echo -e "${RED}script finished${NO_COLOR}" && exit
#   [ ${VERIFICATION} = $Y ] && echo -e "${GREEN}script general starting${NO_COLOR}"

  echo -e "${BLUE}
    1 - i3
    2 - i3status
    3 - alacritty
    4 - lf
    5 - theme-rofi
    6 - net-speed
    7 - vim
    8 - bash
    9 - zsh
    10 - dockercompose
    11 - touchpad
    12 - all
    13 - help
    14 - exit

  Insert option:${NO_COLOR}"
    read option
    main $option
}

function check-folder {
    if [[ $(basename $PWD) != "config-system" ]]; then
        echo -e "${RED}Run the script inside your folder${NO_COLOR}"
        exit
    fi
}

check-folder

start-script
