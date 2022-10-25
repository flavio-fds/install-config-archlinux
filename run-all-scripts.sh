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

function title {
  echo
  echo -e "${GREEN}##############################################${NO_COLOR}"
  echo -e "${GREEN}###  INSTALLING AND CONFIG ALL SCRIPTS!!!  ###${NO_COLOR}"
  echo -e "${GREEN}##############################################${NO_COLOR}"
}

function help {
  echo -e "${PURPLE}
  Insert valid argument

        1 - install-pacman -> installs a package with pacman
        2 - packages-aur -> installs a package with AUR
        3 - config-docker -> Config Docker
        4 - config-general -> Config i3, i3status, alacritty, lf, theme-rofi, net-speed, vim, bash, zsh, dockercompose, touchpad
        5 - config-github -> Config git and github and create new key SSH
        6 - config-nvm -> Install and config nvm e node
        7 - config-zsh -> Config plugins spaceship-prompt, zsh-autosuggestions, zsh-syntax-highlighting
        8 - all -> Run all scripts
            9 - final-config   -> Run script after initial config and reboot system <-
        10 - install-archlinux
        11 - help
        12 - exit
    ${NO_COLOR}"
  start-script
}

function execute-permission {
  chmod +x ./install-packages/script-aur.sh
  chmod +x ./install-packages/software-pacman-base.sh
  chmod +x ./install-packages/software-pacman.sh
  chmod +x ./install-packages/software-aur.sh
  chmod +x ./config-system/config-docker.sh
  chmod +x ./config-system/config-general.sh
  chmod +x ./config-system/config-github.sh
  chmod +x ./config-system/config-nvm.sh
  chmod +x ./config-system/config-zsh.sh
  chmod +x ./install-archlinux/install-archlinux.sh
}

function install-pacman {
  cd install-packages
  ./software-pacman.sh
  cd ..
  $1 && start-script
}
function install-aur {
  cd install-packages
  ./software-aur.sh
  cd ..
  $1 && start-script
}
function config-docker {
  cd config-system
  ./config-docker.sh
  cd ..
  $1 && start-script
}
function config-general {
  cd config-system
  ./config-general.sh
  cd ..
  $1 && start-script
}
function config-github {
  cd config-system
  ./config-github.sh
  cd ..
  $1 && start-script
}
function config-nvm {
  cd config-system
  ./config-nvm.sh
  cd ..
  $1 && start-script
}
function config-zsh {
  cd config-system
  ./config-zsh.sh
  cd ..
  $1 && start-script
}

function install-archlinux {
  cd install-archlinux
  ./install-archlinux.sh
  cd
}

function all {
  install-pacman false
  install-aur false
  config-general false
  config-docker false
  config-github false
  config-zsh false
  config-nvm false
  return 0
}

function final-config {
  config-nvm false
  config-github false
  config-docker false
  return 0
}

function msg-done {
  echo
  echo -e "${GREEN}##################${NO_COLOR}"
  echo -e "${GREEN}###  Done!!!!  ###${NO_COLOR}"
  echo -e "${GREEN}##################${NO_COLOR}"
  echo
  return 0
}

function msg-bye {
  echo
  echo -e "${CYAN}##################${NO_COLOR}"
  echo -e "${CYAN}###   BYE!!!!  ###${NO_COLOR}"
  echo -e "${CYAN}##################${NO_COLOR}"
  echo
  return 0
}

function main {
  [ -z "$1" ] || [ "$1" = "help" ] || [ "$1" = "11" ] && help && exit
  [ "$1" = "install-pacman-packages" ] || [ "$1" = "1" ] && install-pacman true && msg-done && exit
  [ "$1" = "packages-aur" ] || [ "$1" = "2" ] && install-aur true && msg-done && exit
  [ "$1" = "config-docker" ] || [ "$1" = "3" ] && config-docker true && msg-done && exit
  [ "$1" = "config-general" ] || [ "$1" = "4" ] && config-general true && msg-done && exit
  [ "$1" = "config-github" ] || [ "$1" = "5" ] && config-github true && msg-done && exit
  [ "$1" = "config-nvm" ] || [ "$1" = "6" ] && config-nvm true && msg-done && exit
  [ "$1" = "config-zsh" ] || [ "$1" = "7" ] && config-zsh true && msg-done && exit
  [ "$1" = "all" ] || [ "$1" = "8" ] && all && msg-done && exit
  [ "$1" = "final-config" ] || [ "$1" = "9" ] && final-config && msg-done && exit
  [ "$1" = "install-archlinux" ] || [ "$1" = "10" ] && install-archlinux && exit
  [ "$1" = "exit" ] || [ "$1" = "12" ] && msg-bye && exit

  echo -e "${RED}wrong argument: $1 ${NO_COLOR}"
  start-script
}

start-script() {
  title

  echo -e "${BLUE}
    1 - install-pacman-packages
    2 - packages-aur -> install, update, remove
    3 - config-docker
    4 - config-general -> i3, Alacritty, lf, Rofi, vim, bash, zsh, docker, touchpad
    5 - config-github
    6 - config-nvm
    7 - config-zsh
    8 - all ^^^^
    9 - final-config   -> Run script after initial config and reboot system
    10 - install-archlinux   -> Run script only in live install archlinux 
    11 - help
    12 - exit

Insert option:${NO_COLOR}"
  read option
  main $option
}

function check-folder {
  if [[ $(basename $PWD) != "install-config-archlinux" ]]; then
    echo
    echo -e "${RED}##############################################${NO_COLOR}"
    echo -e "${RED}###  Run the script inside your folder!!!  ###${NO_COLOR}"
    echo -e "${RED}##############################################${NO_COLOR}"
    echo
    exit
  fi
}

check-folder
start-script
