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
echo -e "${GREEN}###  CONFIG DOCKER!!!  ###${NO_COLOR}"
echo -e "${GREEN}##########################${NO_COLOR}"
function help {
  echo -e "${PURPLE}
  Insert valid argument

    1 - docker -> Start initial config docker
    2 - docker-restart -> Run script after initial config and reboot system
    ${NO_COLOR}"
  start-script
}

config-docker() {
  echo -e "${GREEN}Starting config docker${NO_COLOR}"
  sudo groupadd docker          # cria um grupo chamado docker
  sudo usermod -aG docker $USER # adiciona seu usuário a este novo grupo
  echo -e "${GREEN}Reboot system and exec command (newgrp docker)${NO_COLOR}" && sleep 3
  echo
  echo -e "${GREEN}###  DONE!!!  ###${NO_COLOR}"
  echo
}

#Run script after initial config and reboot system
config-docker-after-reboot() {
  echo -e "${GREEN}Start configuring docker after restart${NO_COLOR}"
  echo
  echo -e "${GREEN}sudo systemctl status docker - check status no systemd${NO_COLOR}"
  echo -e "${GREEN}sudo systemctl start docker.service -> start docker daemon systemd${NO_COLOR}"
  echo -e "${GREEN}sudo systemctl enable docker -> start docker boot daemon systemd${NO_COLOR}" && sleep 3
  echo
  echo
  echo -e "${GREEN}###  DONE!!!  ###${NO_COLOR}"
  newgrp docker # ativa as alterações realizadas nos grupos
  echo
}

function main {
  [ -z "$1" ] || [ "$1" = "help" ] || [ "$1" = "3" ] && help && exit
  [ "$1" = "docker" ] || [ "$1" = "1" ] && config-docker && exit
  [ "$1" = "docker-restart" ] || [ "$1" = "2" ] && config-docker-after-reboot && exit
  [ "$1" = "exit" ] || [ "$1" = "4" ] && exit

  echo "wrong argument: $1"
  start-script
}

start-script() {
  # echo -e "${GREEN}start script config(y/N)${NO_COLOR}"
  # read VERIFICATION

  # [ -z "$VERIFICATION" ] || [ ${VERIFICATION} != $Y ] && echo -e "${RED}script finished${NO_COLOR}" && exit
  # [ ${VERIFICATION} = $Y ] && echo -e "${GREEN}script docker starting${NO_COLOR}"

  echo -e "${BLUE}
    1 - docker
    2 - docker-restart -> Run script after initial config and reboot system
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
