#!/usr/bin/env bash

VERMELHO='\e[1;91m'
VERDE='\e[1;92m'
SEM_COR='\e[0m'

Y="y"

echo -e "${VERDE}##########################${SEM_COR}"
echo -e "${VERDE}###  CONFIG NVM!!!  ###${SEM_COR}"
echo -e "${VERDE}##########################${SEM_COR}"

function help {
  echo "
  Insert valid argument

    node -> install script nvm
    node-restart -> check install nvm and install node 16
    "
    start-script
}

config-node(){
    echo -e "${VERDE}Starting config nvm and node${SEM_COR}"
    echo -e "${VERDE}https://github.com/nvm-sh/nvm${SEM_COR}"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | zsh
    echo -e "${VERDE}Run node-restart after reboot${SEM_COR}" && sleep 3
}

function node-restart {
    echo -e "${VERDE}Starting check install nvm and install node 16${SEM_COR}"
    nvm install 16
    node -v
    nvm list
}

function main {
  [ -z "$1" ] || [ "$1" == "help" ] && help       && exit
  [ "$1" == "node" ]               && config-node && exit
  [ "$1" == "node-restart" ]               && node-restart && exit


  echo "wrong argument: $1"
}

start-script(){
  echo -e "${VERDE}start script NVM config(y/N)${SEM_COR}"
  read VERIFICATION
  if [ ${VERIFICATION} = $Y ]; then
    echo -e "${VERDE}script NVM config starting${SEM_COR}"
  else
    echo -e "${VERDE}script finished${SEM_COR}"
    exit 1
  fi

  echo "
  Insert option

    node -> Install script nvm
    node-restart -> Run script after initial config and reboot system
    help

  Insert option:"
    read option
    main $option
}

start-script