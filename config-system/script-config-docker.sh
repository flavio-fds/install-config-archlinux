#!/usr/bin/env bash

VERMELHO='\e[1;91m'
VERDE='\e[1;92m'
SEM_COR='\e[0m'

Y="y"

echo -e "${VERDE}##########################${SEM_COR}"
echo -e "${VERDE}###  CONFIG DOCKER!!!  ###${SEM_COR}"
echo -e "${VERDE}##########################${SEM_COR}"

function help {
  echo "
  Insert valid argument

    docker -> Start initial config docker
    docker-restart -> Run script after initial config and reboot system
    "
    start-script
}

config-docker(){
    echo -e "${VERDE}Starting config docker${SEM_COR}"
    sudo groupadd docker # cria um grupo chamado docker
    sudo usermod -aG docker $USER # adiciona seu usuário a este novo grupo
    echo -e "${VERDE}Reboot system and exec command (newgrp docker)${SEM_COR}" && sleep 3
}

#Run script after initial config and reboot system
config-docker-after-reboot(){
    echo -e "${VERDE}Configuring docker after restart${SEM_COR}"
    sudo newgrp docker # 
    echo
    echo -e "${VERDE}sudo systemctl status docker - check status no systemd${SEM_COR}"
    echo -e "${VERDE}sudo systemctl start docker.service -> start docker daemon systemd${SEM_COR}"
    echo -e "${VERDE}sudo systemctl enable docker -> start docker boot daemon systemd${SEM_COR}" && sleep 3
    echo
}

function main {
  [ -z "$1" ] || [ "$1" == "help" ] && help       && exit
  [ "$1" == "docker" ]               && config-docker && exit
  [ "$1" == "docker-restart" ]               && config-docker-after-reboot && exit


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

    docker
    docker-restart -> Run script after initial config and reboot system
    help

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
