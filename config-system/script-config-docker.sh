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

    docker
    all
    "
    start-script
}

config-docker(){
    echo -e "${VERDE}Starting config docker${SEM_COR}"
    sudo groupadd docker # cria um grupo chamado docker
    sudo usermod -aG docker $USER # adiciona seu usuário a este novo grupo
    echo -e "${VERDE}Reboot system e exec command (newgrp docker)${SEM_COR}" && sleep 3
}

function all {

config-docker
}

function main {
  [ -z "$1" ] || [ "$1" == "help" ] && help       && exit
  [ "$1" == "docker" ]               && config-docker && exit
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

    docker
    all
    "
    read option
    main $option
}

start-script