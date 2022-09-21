#!/usr/bin/env bash

VERMELHO='\e[1;91m'
VERDE='\e[1;92m'
SEM_COR='\e[0m'

Y="y"
echo
echo -e "${VERDE}##########################${SEM_COR}"
echo -e "${VERDE}###  CONFIG NVM!!!  ###${SEM_COR}"
echo -e "${VERDE}##########################${SEM_COR}"
echo
function help {
  echo "
  Insert valid argument

    1 - node -> install script nvm
    2 - node-restart -> check install nvm and install node 16
    4 - exit
    "
    start-script
}

config-node(){
    echo -e "${VERDE}Starting config nvm and node${SEM_COR}"
    echo -e "${VERDE}https://github.com/nvm-sh/nvm${SEM_COR}"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | zsh
    echo -e "${VERDE}Run node-restart after reboot${SEM_COR}" && sleep 3
    echo
    echo -e "${VERDE}###  DONE!!!  ###${SEM_COR}"
    echo
}

function node-restart {
    echo -e "${VERDE}Starting check install nvm and install node 16${SEM_COR}"

    echo -e "${VERDE}exec command (nvm install 16)${SEM_COR}"
    echo -e "${VERDE}exec command (node -v)${SEM_COR}"
    echo -e "${VERDE}exec command (nvm list)${SEM_COR}"
    
    echo
    echo -e "${VERMELHO}After exec command another terminal OK ${SEM_COR}"
    read ok
    echo $ok
    echo
    echo -e "${VERDE}###  DONE!!!  ###${SEM_COR}"
    echo
}

function main {
  [ -z "$1" ] || [ "$1" == "help" ] || [ "$1" == "3" ] && help       && exit
  [ "$1" == "node" ] || [ "$1" == "1" ] && config-node && exit
  [ "$1" == "node-restart" ] || [ "$1" == "2" ] && node-restart && exit
  [ "$1" == "exit" ] || [ "$1" == "4" ] && exit


  echo "wrong argument: $1"
}

start-script(){
  echo -e "${VERDE}start script NVM config(y/N)${SEM_COR}"
  read VERIFICATION

  [ -z "$VERIFICATION" ] || [ ${VERIFICATION} != $Y ] && echo -e "${VERMELHO}script finished${SEM_COR}" && exit
  [ ${VERIFICATION} == $Y ] && echo -e "${VERDE}script NVM config starting${SEM_COR}"

  echo "
  Insert option

    1 - node -> Install script nvm
    2 - node-restart -> Run script after initial config and reboot system
    3 - help
    4 - exit

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
