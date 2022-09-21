#!/usr/bin/env bash

BLACK='\033[0;90m'
RED='\033[0;91m'
GREEN='\033[0;92m' 
YELLOW='\033[0;93m'   
BLUE='\033[0;94m'      
PURPLE='\033[0;95m'   
CYAN='\033[0;96m'     
WHITE='\033[0;97m'  
NO_COLOR='\e[0m'

Y="y"
echo
echo -e "${GREEN}##########################${NO_COLOR}"
echo -e "${GREEN}###  CONFIG NVM!!!  ###${NO_COLOR}"
echo -e "${GREEN}##########################${NO_COLOR}"
echo
function help {
  echo -e "${PURPLE}
  Insert valid argument

    1 - node -> install script nvm
    2 - node-restart -> check install nvm and install node 16
    4 - exit
    ${NO_COLOR}"
    start-script
}

config-node(){
    echo -e "${GREEN}Starting config nvm and node${NO_COLOR}"
    echo -e "${GREEN}https://github.com/nvm-sh/nvm${NO_COLOR}"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | zsh
    echo -e "${GREEN}Run node-restart after reboot${NO_COLOR}" && sleep 3
    echo
    echo -e "${GREEN}###  DONE!!!  ###${NO_COLOR}"
    echo
}

function node-restart {
    echo -e "${GREEN}Starting check install nvm and install node 16${NO_COLOR}"

    echo -e "${GREEN}exec command (nvm install 16)${NO_COLOR}"
    echo -e "${GREEN}exec command (node -v)${NO_COLOR}"
    echo -e "${GREEN}exec command (nvm list)${NO_COLOR}"
    
    echo
    echo -e "${RED}After exec command another terminal OK ${NO_COLOR}"
    read ok
    echo $ok
    echo
    echo -e "${GREEN}###  DONE!!!  ###${NO_COLOR}"
    echo
}

function main {
  [ -z "$1" ] || [ "$1" = "help" ] || [ "$1" = "3" ] && help       && exit
  [ "$1" = "node" ] || [ "$1" = "1" ] && config-node && exit
  [ "$1" = "node-restart" ] || [ "$1" = "2" ] && node-restart && exit
  [ "$1" = "exit" ] || [ "$1" = "4" ] && exit


  echo -e "${RED}wrong argument: $1 ${NO_COLOR}"
  start-script
}

start-script(){
  # echo -e "${GREEN}start script NVM config(y/N)${NO_COLOR}"
  # read VERIFICATION

  # [ -z "$VERIFICATION" ] || [ ${VERIFICATION} != $Y ] && echo -e "${RED}script finished${NO_COLOR}" && exit
  # [ ${VERIFICATION} = $Y ] && echo -e "${GREEN}script NVM config starting${NO_COLOR}"

  echo -e "${BLUE}
  Insert option

    1 - node -> Install script nvm
    2 - node-restart -> Run script after initial config and reboot system
    3 - help
    4 - exit

  Insert option:${NO_COLOR}"
    read option
    main $option
}

function check-folder {
    if [[ $(basename $PWD) != "config-system" ]]; then
        echo -e "${RED}Run the script inside your folder${NO_COLOR}"
        exit
    fi
}

check-folder

start-script
