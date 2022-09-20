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

        1 - install-pacman -> installs a package with pacman
        2 - install-aur -> installs a package with AUR
        3 - config-docker -> Config Docker
        4 - config-general -> Config i3, i3status, alacritty, lf, theme-rofi, net-speed, vim, bash, zsh, dockercompose, touchpad
        5 - config-github -> Config git and github and create new key SSH
        6 - config-nvm -> Install and config nvm e node
        7 - config-zsh -> Config plugins spaceship-prompt, zsh-autosuggestions, zsh-syntax-highlighting
        8 - all -> Run all scripts
            9 - final-config   -> Run script after initial config and reboot system <-
        10 - help
        11 - exit
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
  [ -z "$1" ] || [ "$1" == "help" ] || [ "$1" == "10" ] && help       && exit
  [ "$1" == "install-pacman" ] || [ "$1" == "1" ] && install-pacman true && msg-done && exit
  [ "$1" == "install-aur" ] || [ "$1" == "2" ] && install-aur true && msg-done && exit
  [ "$1" == "config-docker" ] || [ "$1" == "3" ] && config-docker true && msg-done && exit
  [ "$1" == "config-general" ] || [ "$1" == "4" ] && config-general true && msg-done && exit
  [ "$1" == "config-github" ] || [ "$1" == "5" ] && config-github true && msg-done && exit
  [ "$1" == "config-nvm" ] || [ "$1" == "6" ] && config-nvm true && msg-done && exit
  [ "$1" == "config-zsh" ] || [ "$1" == "7" ] && config-zsh  true && msg-done && exit
  [ "$1" == "all" ] || [ "$1" == "8" ] && all && msg-done && exit
  [ "$1" == "final-config" ] || [ "$1" == "9" ] && config-nvm true && config-docker true && msg-done && exit
  [ "$1" == "exit" ] || [ "$1" == "11" ] && exit

  echo "wrong argument: $1"
}

start-script(){
  title
  echo -e "${VERDE}start script(y/N)${SEM_COR}"
  read VERIFICATION

  [ -z "$VERIFICATION" ] || [ ${VERIFICATION} != $Y ] && echo -e "${VERMELHO}script finished${SEM_COR}" && exit
  [ ${VERIFICATION} == $Y ] && echo -e "${VERDE}script starting${SEM_COR}" && execute-permission

  echo "

    1 - install-pacman
    2 - install-aur
    3 - config-docker
    4 - config-general
    5 - config-github
    6 - config-nvm
    7 - config-zsh
    8 - all
    9 - final-config   -> Run script after initial config and reboot system <-
    10 - help
    11 - exit

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
