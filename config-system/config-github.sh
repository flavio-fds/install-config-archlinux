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
echo -e "${GREEN}######################################${NO_COLOR}"
echo -e "${GREEN}###  CONFIG GITHUB AND KEY SSH!!!  ###${NO_COLOR}"
echo -e "${GREEN}######################################${NO_COLOR}"
echo

function help {
  echo -e "${PURPLE}
  Insert valid argument

    1 - github-config
    2 - copy-key-github -> copy key for Add Chave ssh-agent github site
    4 - exit
    ${NO_COLOR}"
  start-script
}

config-github() {
  echo -e "${GREEN}Starting config github${NO_COLOR}"

  git config --global core.editor "vim -w"

  echo -e "${RED}Type user name Example: Joaquin Pereira${NO_COLOR}"
  read usernamegit
  git config --global user.name $usernamegit

  echo -e "${RED}Type email github${NO_COLOR}"
  read emailgit
  git config --global user.email $emailgit

  git config --list

  echo -e "${GREEN}Generated a config file ~/.gitconfig${NO_COLOR}"

  echo -e "${GREEN}Config Key Ssh${NO_COLOR}"
  echo
  echo -e "${RED}Confirm location e add password${NO_COLOR}"
  echo
  ssh-keygen -t rsa -b 4096 -C $emailgit

  echo -e "${GREEN}Add Chave ssh-agent${NO_COLOR}"

  eval "$(ssh-agent -s)" # start ssh-agent in background
  ssh-add ~/.ssh/id_rsa  # add key private SSH to the ssh-agent
  echo -e "${GREEN}Run config-github - copy-key-github after reboot${NO_COLOR}" && sleep 3
  echo
  echo -e "${GREEN}###  DONE!!!  ###${NO_COLOR}"
  echo
}

function print-key {
  echo -e "${GREEN}Add Chave ssh-agent${NO_COLOR}"

  echo "No canto superior direito do GitHub , clique na sua foto de perfil e clique em Settings ;

    Na barra lateral esquerda, clique em SSH and GPG keys ;

    Clique em New SSH key ou Add SSH key ;

    No campo Título , adicione um descrição para a nova chave;

    Cole sua chave dentro do campo Key ;

    Clique em Add SSH key"

  echo

  cat $HOME/.ssh/id_rsa.pub # Show key public

  echo
  echo -e "${RED}https://github.com/settings/ssh/new${NO_COLOR}"
  echo
  echo -e "${RED}After adding key type OK ${NO_COLOR}"
  read ok
  echo $ok
  echo
  echo -e "${GREEN}###  DONE!!!  ###${NO_COLOR}"
  echo
}

function main {
  [ -z "$1" ] || [ "$1" = "help" ] || [ "$1" = "3" ] && help && exit
  [ "$1" = "github-config" ] || [ "$1" = "1" ] && config-github && exit
  [ "$1" = "copy-key-github" ] || [ "$1" = "2" ] && print-key && exit
  [ "$1" = "exit" ] || [ "$1" = "4" ] && exit

  echo -e "${RED}wrong argument: $1 ${NO_COLOR}"
  start-script
}

start-script() {
  # echo -e "${GREEN}start script NVM config(y/N)${NO_COLOR}"
  # read VERIFICATION

  # [ -z "$VERIFICATION" ] || [ ${VERIFICATION} != $Y ] && echo -e "${RED}script finished${NO_COLOR}" && exit
  # [ ${VERIFICATION} = $Y ] && echo -e "${GREEN}script NVM config starting${NO_COLOR}"

  echo -e "${BLUE}
  Insert option

    1 - github-config
    2 - copy-key-github
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
