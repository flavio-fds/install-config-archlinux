#!/usr/bin/env bash

VERMELHO='\e[1;91m'
VERDE='\e[1;92m'
SEM_COR='\e[0m'

echo
echo -e "${VERDE}##############################################${SEM_COR}"
echo -e "${VERDE}###  INSTALLING AND CONFIG ALL SCRIPTS!!!  ###${SEM_COR}"
echo -e "${VERDE}##############################################${SEM_COR}"
echo


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
    chmod +x ./install-packages/software-pacman.sh
    cd ..
}
function install-aur {
    cd install-packages
    chmod +x ./install-packages/software-aur.sh
    cd ..
}
function config-docker {
    cd config-system
    chmod +x ./config-system/script-config-docker.sh
    cd ..
}
function config-general {
    cdconfig-system
    chmod +x ./config-system/script-config-general.sh
    cd ..
}
function config-github {
    cd config-system
    chmod +x ./config-system/script-config-github.sh
    cd ..
}
function config-nvm {
    cd config-system
    chmod +x ./config-system/script-config-nvm.sh
    cd ..
}
function config-zsh {
    cd config-system
    chmod +x ./config-system/script-config-zsh.sh
    cd ..
}
function all {
    cd install-packages
    chmod +x ./install-packages/software-pacman.sh
    cd ..

    cd install-packages
    chmod +x ./install-packages/software-aur.sh
    cd ..

    cdconfig-system
    chmod +x ./config-system/script-config-general.sh
    cd ..

    cd config-system
    chmod +x ./config-system/script-config-docker.sh
    cd ..

    cd config-system
    chmod +x ./config-system/script-config-github.sh
    cd ..

    cd config-system
    chmod +x ./config-system/script-config-zsh.sh
    cd ..

    cd config-system
    chmod +x ./config-system/script-config-nvm.sh
    cd ..
}

function msg-done {
    echo
    echo -e "${VERDE}##################${SEM_COR}"
    echo -e "${VERDE}###  Done!!!!  ###${SEM_COR}"
    echo -e "${VERDE}##################${SEM_COR}"
    echo
}

function main {
  [ -z "$1" ] || [ "$1" == "help" ] && help       && exit
  [ "$1" == "install-pacman" ] && ./install-packages/software-pacman.sh && msg-done && exit
  [ "$1" == "install-aur" ] && ./install-packages/software-aur.sh && msg-done && exit
  [ "$1" == "config-docker" ] && ./config-system/script-config-docker.sh && msg-done && exit
  [ "$1" == "config-general" ] && ./config-system/script-config-general.sh && msg-done && exit
  [ "$1" == "config-github" ] && ./config-system/script-config-github.sh && msg-done && exit
  [ "$1" == "config-nvm" ] && ./config-system/script-config-nvm.sh  && msg-done && exit
  [ "$1" == "config-zsh" ] && script-aur&& msg-done && exit
  [ "$1" == "all" ] && all && msg-done && exit

  echo "wrong argument: $1"
}

start-script(){
  echo -e "${VERDE}start script config(y/N)${SEM_COR}"
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
    if [[ (basename $(pwd)) != "install-config-archlinux" ]]; then
    echo -e "${VERMELHO}Run the script inside your folder${SEM_COR}"
    exit
}

check-folder
start-script
