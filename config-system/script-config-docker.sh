#!/usr/bin/env bash

VERMELHO='\e[1;91m'
VERDE='\e[1;92m'
SEM_COR='\e[0m'

Y="y"
echo
echo -e "${VERDE}##########################${SEM_COR}"
echo -e "${VERDE}###  CONFIG DOCKER!!!  ###${SEM_COR}"
echo -e "${VERDE}##########################${SEM_COR}"
echo
function help {
  echo "
  Insert valid argument

    1 - docker -> Start initial config docker
    2 - docker-restart -> Run script after initial config and reboot system
    "
    start-script
}

config-docker(){
    echo -e "${VERDE}Starting config docker${SEM_COR}"
    sudo groupadd docker # cria um grupo chamado docker
    sudo usermod -aG docker $USER # adiciona seu usuário a este novo grupo
    echo -e "${VERDE}Reboot system and exec command (newgrp docker)${SEM_COR}" && sleep 3
    echo
    echo -e "${VERDE}###  DONE!!!  ###${SEM_COR}"
    echo
}

#Run script after initial config and reboot system
config-docker-after-reboot(){
    echo -e "${VERDE}Configuring docker after restart${SEM_COR}"
    echo
    echo -e "${VERDE}sudo systemctl status docker - check status no systemd${SEM_COR}"
    echo -e "${VERDE}sudo systemctl start docker.service -> start docker daemon systemd${SEM_COR}"
    echo -e "${VERDE}sudo systemctl enable docker -> start docker boot daemon systemd${SEM_COR}" && sleep 3
    echo
    echo
    echo -e "${VERDE}###  DONE!!!  ###${SEM_COR}"
    newgrp docker # ativa as alterações realizadas nos grupos
    echo
}

function main {
  [ -z "$1" ] || [ "$1" == "help" ] || [ "$1" == "3" ] && help       && exit
  [ "$1" == "docker" ] || [ "$1" == "1" ] && config-docker && exit
  [ "$1" == "docker-restart" ] || [ "$1" == "2" ] && config-docker-after-reboot && exit


  echo "wrong argument: $1"
}

start-script(){
  echo -e "${VERDE}start script config(y/N)${SEM_COR}"
  read VERIFICATION

  [ -z "$VERIFICATION" ] || [ ${VERIFICATION} != $Y ] && echo -e "${VERMELHO}script finished${SEM_COR}" && exit
  [ ${VERIFICATION} == $Y ] && echo -e "${VERDE}script docker starting${SEM_COR}"

  echo "

    1 - docker
    2 - docker-restart -> Run script after initial config and reboot system
    3 - help

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
