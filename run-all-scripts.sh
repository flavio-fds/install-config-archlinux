#!/usr/bin/env bash

VERMELHO='\e[1;91m'
VERDE='\e[1;92m'
SEM_COR='\e[0m'

Y="y"

function title {
echo
echo -e "${VERDE}##############################################${SEM_COR}"
echo -e "${VERDE}###  INSTALLING AND CONFIG ALL SCRIPTS!!!  ###${SEM_COR}"
echo -e "${VERDE}##############################################${SEM_COR}"
echo
}


function help {
  echo "
  Insert valid argument

        install-pacman -> installs a package with pacman
        install-aur -> installs a package with AUR
        config-docker -> Config Docker
        config-general -> Config i3, i3status, alacritty, lf, theme-rofi, net-speed, vim, bash, zsh, dockercompose, touchpad
        config-github -> Config git and github and create new key SSH
        config-nvm -> Install and config nvm e node
        config-zsh -> Config plugins spaceship-prompt, zsh-autosuggestions, zsh-syntax-highlighting
        all -> Run all scripts
    "
    start-script
}

function execute-permission {
    chmod +x ./install-packages/script-aur.sh
    chmod +x ./install-packages/software-pacman-base.sh
    chmod +x ./install-packages/software-pacman.sh
    chmod +x ./install-packages/software-aur.sh
    chmod +x ./config-system/script-config-docker.sh
    chmod +x ./config-system/script-config-general.sh
    chmod +x ./config-system/script-config-github.sh
    chmod +x ./config-system/script-config-nvm.sh
    chmod +x ./config-system/script-config-zsh.sh
    chmod +x ./install-archlinux/install-archlinux.sh
}

function install-pacman {
    cd install-packages
    ./software-pacman.sh
    cd ..
    $1 && start-script
}
function install-aur {
    cd install-packages
    ./software-aur.sh
    cd ..
    $1 && start-script
}
function config-docker {
    cd config-system
    ./script-config-docker.sh
    cd ..
    $1 && start-script
}
function config-general {
    cd config-system
    ./script-config-general.sh
    cd ..
    $1 && start-script
}
function config-github {
    cd config-system
    ./script-config-github.sh
    cd ..
    $1 && start-script
}
function config-nvm {
    cd config-system
    ./script-config-nvm.sh
    cd ..
    $1 && start-script
}
function config-zsh {
    cd config-system
    ./script-config-zsh.sh
    cd ..
    $1 && start-script
}

function all {
    install-pacman false
    install-aur false
    config-docker false
    config-general false
    config-github false
    config-nvm false
    config-zsh false
    return 0
}

function msg-done {
    echo
    echo -e "${VERDE}##################${SEM_COR}"
    echo -e "${VERDE}###  Done!!!!  ###${SEM_COR}"
    echo -e "${VERDE}##################${SEM_COR}"
    echo
    return 0
}

function main {
  [ -z "$1" ] || [ "$1" == "help" ] && help       && exit
  [ "$1" == "install-pacman" ] && install-pacman true && msg-done && exit
  [ "$1" == "install-aur" ] && install-aur true && msg-done && exit
  [ "$1" == "config-docker" ] && config-docker true && msg-done && exit
  [ "$1" == "config-general" ] && config-general true && msg-done && exit
  [ "$1" == "config-github" ] && config-github true && msg-done && exit
  [ "$1" == "config-nvm" ] && config-nvm true && msg-done && exit
  [ "$1" == "config-zsh" ] && config-zsh  true && msg-done && exit
  [ "$1" == "all" ] && all && msg-done && exit

  echo "wrong argument: $1"
}

start-script(){
  title
  echo -e "${VERDE}start script(y/N)${SEM_COR}"
  read VERIFICATION
  if [ ${VERIFICATION} = $Y ]; then
    echo -e "${VERDE}script starting${SEM_COR}"
    execute-permission
  else
    echo -e "${VERDE}script finished${SEM_COR}"
    exit 1
  fi

  echo "

    install-pacman
    install-aur
    config-docker
    config-general
    config-github
    config-nvm
    config-zsh
    all
    help

  Insert option:"
    read option
    main $option
}

function check-folder {
if [[ $(basename $PWD) != "install-config-archlinux" ]]; then
    echo -e "${VERMELHO}Run the script inside your folder${SEM_COR}"
    exit
fi
}

check-folder
start-script
