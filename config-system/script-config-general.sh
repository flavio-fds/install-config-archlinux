#!/usr/bin/env bash

VERMELHO='\e[1;91m'
VERDE='\e[1;92m'
SEM_COR='\e[0m'

Y="y"

echo -e "${VERDE}##########################${SEM_COR}"
echo -e "${VERDE}###  CONFIG SYSTEM!!!  ###${SEM_COR}"
echo -e "${VERDE}##########################${SEM_COR}"

function help {
  echo "
  Insert valid argument

    i3
    i3status
    alacritty
    lf
    theme-rofi
    net-speed
    vim
    bash
    zsh
    dockercompose
    touchpad
    all
    "
    start-script
}

config-i3(){
    echo -e "${VERDE}Starting config i3${SEM_COR}"
        echo "creating folders $HOME/.config/i3/"
        mkdir -p $HOME/.config/i3
        echo "copying i3 config file to $HOME/.config/i3/config directory"
        cp -f ./files-config/i3-config $HOME/.config/i3/config
}

config-i3status(){
    echo -e "${VERDE}Starting config i3status${SEM_COR}"
        echo "copying .i3status.conf file to $HOME/ directory"
        cp -f ./files-config/i3status.conf $HOME/.i3status.conf
}

config-alacritty(){
    echo -e "${VERDE}Starting config Alacritty${SEM_COR}"
        echo "creating folders $HOME/.config/alacritty/"
        mkdir -p $HOME/.config/alacritty
        echo "copying alacritty.yml file to $HOME/.config/alacritty/ directory"
        cp -f ./files-config/alacritty.yml $HOME/.config/alacritty/alacritty.yml
}

config-lf(){
    echo -e "${VERDE}Starting config LF${SEM_COR}"
        echo "creating folders $HOME/.config/lf/"
        mkdir -p $HOME/.config/lf
        echo "copying lfrc file to $HOME/.config/lf/ directory"
        cp -f ./files-config/lfrc $HOME/.config/lf/lfrc
}

config-theme-rofi(){
    echo -e "${VERDE}Starting config theme rofi${SEM_COR}"
        echo "creating folders $HOME/.config/rofi/"
        mkdir -p $HOME/.config/rofi
        echo "copying theme-rofi-flavio.rasi file to $HOME/.config/rofi/ directory"
        cp -f ./files-config/theme-rofi.rasi $HOME/.config/rofi/theme-rofi-flavio.rasi
        echo "copying config.rasi file to $HOME/.config/rofi/ directory"
        cp -f ./files-config/config-rofi.rasi $HOME/.config/rofi/config.rasi
}

config-net-speed(){
    echo -e "${VERDE}Starting config net-speed.sh${SEM_COR}"
        echo "copying .net-speed.sh file to $HOME/ directory"
        cp ./files-config/net-speed.sh $HOME/.net-speed.sh
}

config-vimrc(){
    echo -e "${VERDE}Starting config vim${SEM_COR}"
        echo "copying .vimrc file to $HOME/ directory"
        cp ./files-config/vimrc $HOME/.vimrc
}

config-bashrc(){
    echo -e "${VERDE}Starting config bash${SEM_COR}"
        echo "copying .bashrc file to $HOME/ directory"
        cp ./files-config/bashrc $HOME/.bashrc
}

config-zshrc(){
    echo -e "${VERDE}Starting config zshrc${SEM_COR}"
    echo "copying .zshrc file to $HOME/ directory"
    cp ./files-config/zshrc $HOME/.zshrc
}

config-dockercompose(){
    echo -e "${VERDE}Starting config docker-compose${SEM_COR}"
    sudo curl -L "https://github.com/docker/compose/releases/download/v2.5.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose # download and install docker-compose
    sudo chmod +x /usr/local/bin/docker-compose # permission exec 
}

config-touchpad(){
    echo -e "${VERDE}Starting config touchpad${SEM_COR}"
    echo -e "${VERDE}Dependency libinput${SEM_COR}"
    echo -e "${VERDE}Dependency xf86-input-libinput${SEM_COR}"
    echo -e "${VERDE}Reboot system${SEM_COR}" && sleep 3
    sudo cp -f ./files-config/40-libinput.conf /etc/X11/xorg.conf.d/40-libinput.conf
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
  [ -z "$1" ] || [ "$1" == "help" ] && help       && exit
  [ "$1" == "i3" ]             && config-i3 && exit
  [ "$1" == "i3status" ]              && config-i3status && exit
  [ "$1" == "alacritty" ]               && config-alacritty && exit
  [ "$1" == "lf" ]               && config-lf && exit
  [ "$1" == "theme-rofi" ]               && config-theme-rofi && exit
  [ "$1" == "net-speed" ]               && config-net-speed && exit
  [ "$1" == "vim" ]               && config-vimrc && exit
  [ "$1" == "bash" ]               && config-bashrc && exit
  [ "$1" == "zsh" ]               && config-zshrc && exit
  [ "$1" == "dockercompose" ]               && config-dockercompose && exit
  [ "$1" == "touchpad" ]               && config-touchpad && exit
  [ "$1" == "all" ]               && all && exit


  echo "wrong argument: $1"
}

start-script(){
  echo -e "${VERDE}start script config(y/N)${SEM_COR}"
  read VERIFICATION
  if [ ${VERIFICATION} = $Y ]; then
    echo -e "${VERDE}script starting${SEM_COR}"
  else
    echo -e "${VERDE}script finished${SEM_COR}"
    exit 1
  fi

  echo "
  Insert option

    i3
    i3status
    alacritty
    lf
    theme-rofi
    net-speed
    vim
    bash
    zsh
    dockercompose
    touchpad
    all
    "
    read option
    main $option
}

start-script