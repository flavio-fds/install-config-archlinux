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
echo -e "${GREEN}###  INSTALLING AUR SOFTWARE!!!  ###${NO_COLOR}"
echo -e "${GREEN}####################################${NO_COLOR}"
echo

PKGS=(
  #  'markdown_previewer'
  #  'lightdm-settings'
  #  'downgrade'
  #  'gtksourceview-pkgbuild'
  #  'wmutils'

  # SYSTEM UTILITIES ----------------------------------------------------
  #'hardinfo'              # Hardware info app
  #'flashplugin'           # Flash
  'simple-mtpfs' #Media Transfer Protocol (MTP) can be used to transfer media files to and from many mobile phones

  # TERMINAL UTILITIES --------------------------------------------------

  'spaceship-prompt' # zsh add-on
  'lf'               # Terminal file manager

  # DEVELOPMENT ---------------------------------------------------------
  #'jdk-lts'
  'visual-studio-code-bin' # Kickass text editor

  # MEDIA ---------------------------------------------------------------

  #'spotify'                   # Music player

  # COMMUNICATIONS ------------------------------------------------------
  'google-chrome'
  'vmware-keymaps'
  'vmware-horizon-client'
  'zoom'          # Zoom
  'slack-desktop' # Slack
  'freedownloadmanager' # Free Download Manager -> is a powerful modern download accelerator and organizer.

  # THEMES --------------------------------------------------------------

  'nerd-fonts-complete' #Fonts Nerd
)

function help {
  echo -e "${PURPLE}
  Insert valid argument

       4 - help      shows help
       1 - install   installs a package
       2 - update    update a package
       3 - remove    removes installed package via pacman
       5 - exit
    ${NO_COLOR}"
  start-script
}

function script-aur {
  for PKG in "${PKGS[@]}"; do
    ./script-aur.sh $1 $PKG
  done
}

function check-package-installed {
  for PKG in "${PKGS[@]}"; do
    if pacman -Q "$PKG" &>/dev/null; then
      echo -e "${GREEN}Package [$PKG] already installed${NO_COLOR}"
    else
      echo -e "${RED}Error Install Package ${PKG}${NO_COLOR}"
    fi
  done
}

function msg-done {
  echo
  echo -e "${GREEN}##################${NO_COLOR}"
  echo -e "${GREEN}###  Done!!!!  ###${NO_COLOR}"
  echo -e "${GREEN}##################${NO_COLOR}"
  echo
}

function main {
  [ -z "$1" ] || [ "$1" = "help" ] || [ "$1" = "4" ] && help && exit
  [ "$1" = "install" ] || [ "$1" = "1" ] && script-aur "install" && check-package-installed && msg-done && exit
  [ "$1" = "update" ] || [ "$1" = "2" ] && script-aur "update" && msg-done && exit
  [ "$1" = "remove" ] || [ "$1" = "3" ] && script-aur "remove" && msg-done && exit
  [ "$1" = "exit" ] || [ "$1" = "5" ] && exit

  echo "wrong argument: $1"
}

start-script() {
  #   echo -e "${GREEN}start script install packages AUR(y/N)${NO_COLOR}"
  #   read VERIFICATION
  #   [ -z "$VERIFICATION" ] || [ ${VERIFICATION} != $Y ] && echo -e "${RED}script finished${NO_COLOR}" && exit
  #   [ ${VERIFICATION} = $Y ] && echo -e "${GREEN}script starting${NO_COLOR}" && chmod +x script-aur.sh

  echo -e "${BLUE}

    1 - install
    2 - update
    3 - remove
    4 - help
    5 - exit

  Insert option:${NO_COLOR}"
  read option
  main $option
}

function check-folder {
  if [[ $(basename $PWD) != "install-packages" ]]; then
    echo -e "${RED}Run the script inside your folder${NO_COLOR}"
    exit
  fi
}

check-folder

start-script
