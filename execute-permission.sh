#!/usr/bin/env bash

VERMELHO='\e[1;91m'
VERDE='\e[1;92m'
SEM_COR='\e[0m'

echo
echo -e "${VERDE}##############################################${SEM_COR}"
echo -e "${VERDE}###  INSTALLING AND CONFIG ALL SCRIPTS!!!  ###${SEM_COR}"
echo -e "${VERDE}##############################################${SEM_COR}"
echo

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

function msg-done {
    echo
    echo -e "${VERDE}##################${SEM_COR}"
    echo -e "${VERDE}###  Done!!!!  ###${SEM_COR}"
    echo -e "${VERDE}##################${SEM_COR}"
    echo
}

function check-folder {
    if [[ (basename $(pwd)) != "install-config-archlinux" ]]; then
    echo -e "${VERMELHO}Run the script inside your folder${SEM_COR}"
    exit
}

check-folder
execute-permission
msg-done