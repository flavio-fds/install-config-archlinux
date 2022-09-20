#!/usr/bin/env bash

VERMELHO='\e[1;91m'
VERDE='\e[1;92m'
SEM_COR='\e[0m'

Y="y"
echo
echo -e "${VERDE}####################################################${SEM_COR}"
echo -e "${VERDE}############  CONFIG GENERAL SYSTEM!!!  ############${SEM_COR}"
echo -e "${VERDE}####################################################${SEM_COR}"
echo -e "${VERMELHO}i3, Alacritty, lf, Rofi, vim, bash, zsh, docker, touchpad${SEM_COR}"
function help {
  echo "
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
    "
    start-script
}

config-i3(){
    echo -e "${VERDE}Starting config i3${SEM_COR}"
    echo "creating folders $HOME/.config/i3/"
    mkdir -p $HOME/.config/i3
    echo "copying i3 config file to $HOME/.config/i3/config directory"
    cp -f ./files-config/i3-config $HOME/.config/i3/config
    echo
    echo -e "${VERDE}###  DONE!!!  ###${SEM_COR}"
    echo
}

config-i3status(){
    echo -e "${VERDE}Starting config i3status${SEM_COR}"
    echo "copying .i3status.conf file to $HOME/ directory"
    cp -f ./files-config/i3status.conf $HOME/.i3status.conf
    echo
    echo -e "${VERDE}###  DONE!!!  ###${SEM_COR}"
    echo
}

config-alacritty(){
    echo -e "${VERDE}Starting config Alacritty${SEM_COR}"
    echo "creating folders $HOME/.config/alacritty/"
    mkdir -p $HOME/.config/alacritty
    echo "copying alacritty.yml file to $HOME/.config/alacritty/ directory"
    cp -f ./files-config/alacritty.yml $HOME/.config/alacritty/alacritty.yml
    echo
    echo -e "${VERDE}###  DONE!!!  ###${SEM_COR}"
    echo
}

config-lf(){
    echo -e "${VERDE}Starting config LF${SEM_COR}"
    echo "creating folders $HOME/.config/lf/"
    mkdir -p $HOME/.config/lf
    echo "copying lfrc file to $HOME/.config/lf/ directory"
    cp -f ./files-config/lfrc $HOME/.config/lf/lfrc
    echo
    echo -e "${VERDE}###  DONE!!!  ###${SEM_COR}"
    echo
}

config-theme-rofi(){
    echo -e "${VERDE}Starting config theme rofi${SEM_COR}"
    echo "creating folders $HOME/.config/rofi/"
    mkdir -p $HOME/.config/rofi
    echo "copying theme-rofi-flavio.rasi file to /usr/share/rofi/themes/ directory"
    sudo cp -f ./files-config/theme-rofi.rasi /usr/share/rofi/themes/theme-rofi-flavio.rasi
    echo "copying config.rasi file to $HOME/.config/rofi/ directory"
    cp -f ./files-config/config-rofi.rasi $HOME/.config/rofi/config.rasi
    echo
    echo -e "${VERDE}###  DONE!!!  ###${SEM_COR}"
    echo
}

config-net-speed(){
    echo -e "${VERDE}Starting config net-speed.sh${SEM_COR}"
    echo "copying .net-speed.sh file to $HOME/ directory"
    cp ./files-config/net-speed.sh $HOME/.net-speed.sh
    echo
    echo -e "${VERDE}###  DONE!!!  ###${SEM_COR}"
    echo
}

config-vimrc(){
    echo -e "${VERDE}Starting config vim${SEM_COR}"
    echo "copying .vimrc file to $HOME/ directory"
    cp ./files-config/vimrc $HOME/.vimrc
    echo
    echo -e "${VERDE}###  DONE!!!  ###${SEM_COR}"
    echo
}

config-bashrc(){
    echo -e "${VERDE}Starting config bash${SEM_COR}"
    echo "copying .bashrc file to $HOME/ directory"
    cp ./files-config/bashrc $HOME/.bashrc
    echo
    echo -e "${VERDE}###  DONE!!!  ###${SEM_COR}"
    echo
}

config-zshrc(){
    echo -e "${VERDE}Starting config zshrc${SEM_COR}"
    echo "copying .zshrc file to $HOME/ directory"
    cp ./files-config/zshrc $HOME/.zshrc
    echo
    echo -e "${VERDE}###  DONE!!!  ###${SEM_COR}"
    echo
}

config-dockercompose(){
    echo -e "${VERDE}Starting config docker-compose${SEM_COR}"
    sudo curl -L "https://github.com/docker/compose/releases/download/v2.5.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose # download and install docker-compose
    sudo chmod +x /usr/local/bin/docker-compose # permission exec 
    echo
    echo -e "${VERDE}###  DONE!!!  ###${SEM_COR}"
    echo
}

config-touchpad(){
    echo -e "${VERDE}Starting config touchpad${SEM_COR}"
    echo -e "${VERDE}Dependency libinput${SEM_COR}"
    echo -e "${VERDE}Dependency xf86-input-libinput${SEM_COR}"
    echo -e "${VERDE}Reboot system${SEM_COR}" && sleep 3
    sudo cp -f ./files-config/40-libinput.conf /etc/X11/xorg.conf.d/40-libinput.conf
    echo
    echo -e "${VERDE}###  DONE!!!  ###${SEM_COR}"
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
  [ -z "$1" ] || [ "$1" == "help" ] || [ "$1" == "13" ] && help       && exit
  [ "$1" == "i3" ] || [ "$1" == "1" ] && config-i3 && exit
  [ "$1" == "i3status" ] || [ "$1" == "2" ] && config-i3status && exit
  [ "$1" == "alacritty" ] || [ "$1" == "3" ] && config-alacritty && exit
  [ "$1" == "lf" ] || [ "$1" == "4" ] && config-lf && exit
  [ "$1" == "theme-rofi" ] || [ "$1" == "5" ] && config-theme-rofi && exit
  [ "$1" == "net-speed" ] || [ "$1" == "6" ] && config-net-speed && exit
  [ "$1" == "vim" ] || [ "$1" == "7" ] && config-vimrc && exit
  [ "$1" == "bash" ] || [ "$1" == "8" ] && config-bashrc && exit
  [ "$1" == "zsh" ] || [ "$1" == "9" ] && config-zshrc && exit
  [ "$1" == "dockercompose" ] || [ "$1" == "10" ] && config-dockercompose && exit
  [ "$1" == "touchpad" ] || [ "$1" == "11" ] && config-touchpad && exit
  [ "$1" == "all" ] || [ "$1" == "12" ] && all && exit
  [ "$1" == "exit" ] || [ "$1" == "14" ] && exit


  echo "wrong argument: $1"
}

start-script(){
  echo -e "${VERDE}start script config(y/N)${SEM_COR}"
  read VERIFICATION

  [ -z "$VERIFICATION" ] || [ ${VERIFICATION} != $Y ] && echo -e "${VERMELHO}script finished${SEM_COR}" && exit
  [ ${VERIFICATION} == $Y ] && echo -e "${VERDE}script general starting${SEM_COR}"

  echo "

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

  Insert option:"
    read option
    main $option
}

function check-folder {
    if [[ $(basename $PWD) != "config-system" ]]; then
        echo -e "${VERMELHO}Run the script inside your folder${SEM_COR}"
        exit
    fi
}

check-folder

start-script
