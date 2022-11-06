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
echo -e "${GREEN}####################################${NO_COLOR}"
echo -e "${GREEN}###  CHECK SOFTWARE PACMAN!!!  ###${NO_COLOR}"
echo -e "${GREEN}####################################${NO_COLOR}"
echo
PKGS=(


)


check-existence-packages() {
  echo "CHECK PACKAGES"
  for PKG in "${PKGS[@]}"; do
    if pacman -Ss "$PKG" &>/dev/null; then
      echo -e "${GREEN}Package [$PKG] found${NO_COLOR}"
    else
      echo -e "${RED}Package [$PKG] not found${NO_COLOR}"
    fi
  done
}

check-packages-instaled() {
  echo "INSTALL PACKAGES"
  for PKG in "${PKGS[@]}"; do
    if pacman -Q "$PKG" &>/dev/null; then
      echo -e "${GREEN}Package [$PKG] already installed${NO_COLOR}"
    else
      echo -e "${RED}Package [$PKG] not installed${NO_COLOR}"
    fi
  done
}


function menu {
  echo -e "${BLUE}

    1 - check-packages
    2 - check-packages-instaled
    3 - exit

  Insert option:${NO_COLOR}"

  read option
  if [[ "$option" = "check-existence-packages" ]] || [[ "$option" = "1" ]]; then
    check-existence-packages
    exit
  fi
  if [[ "$option" = "check-packages-instaled" ]] || [[ "$option" = "2" ]]; then
    check-packages-instaled
    exit
  fi
  [ "$option" = "exit" ] || [ "$option" = "3" ] && exit
  echo -e "${RED}wrong argument: $1 ${NO_COLOR}"
  menu
}

menu

echo -e "${GREEN}#################${NO_COLOR}"
echo -e "${GREEN}###  DONE!!!  ###${NO_COLOR}"
echo -e "${GREEN}#################${NO_COLOR}"
