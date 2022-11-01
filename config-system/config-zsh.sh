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
echo -e "${GREEN}##############################${NO_COLOR}"
echo -e "${GREEN}###  CONFIG ZSH PLUGIN!!!  ###${NO_COLOR}"
echo -e "${GREEN}##############################${NO_COLOR}"
echo
config-zsh-plugin() {
  echo -e "${GREEN}Starting config github${NO_COLOR}"

  PKGS=(
    'spaceship-prompt'
    'zsh-autosuggestions'
    'zsh-syntax-highlighting'
  )

  for PKG in "${PKGS[@]}"; do
    if pacman -Q "$PKG" &>/dev/null; then
      echo -e "${GREEN}Package [$PKG] installed${NO_COLOR}"
    else
      echo -e "${RED}Package [$PKG] not installed${NO_COLOR}"
    fi
  done

  for PKG in "${PKGS[@]}"; do
    if ! pacman -Q "$PKG" &>/dev/null; then
      echo -e "${GREEN}Install Package not installed ^^^^${NO_COLOR}"
      exit
    fi
  done

  echo
  echo -e "${GREEN}list shell install${NO_COLOR}"
  chsh -l
  echo
  echo -e "${GREEN}set zsh shell default${NO_COLOR}"
  chsh -s /bin/zsh $USER
  echo
  echo -e "${GREEN}Plugins spaceship-prompt, zsh-autosuggestions, zsh-syntax-highlighting${NO_COLOR}"
  echo
  echo
  echo -e "${GREEN}References${NO_COLOR}"
  echo
  echo -e "${GREEN}https://spaceship-prompt.sh/
    https://github.com/spaceship-prompt/spaceship-prompt
    https://github.com/zsh-users/zsh-autosuggestions
    https://github.com/zsh-users/zsh-syntax-highlighting${NO_COLOR}"
  echo
  echo
  echo -e "${GREEN}Edit Lines${NO_COLOR}"
  echo
  echo -e "${RED}Open for details edit files ./config-system/files-config/config-zsh-plugin.txt${NO_COLOR}"
  echo
  echo -e "${RED}/usr/share/zsh/plugins/zsh-syntax-highlighting/highlighters/main/main-highlighter.zsh${NO_COLOR}"
  echo
  echo
  sudo vim /usr/share/zsh/plugins/zsh-syntax-highlighting/highlighters/main/main-highlighter.zsh
  echo
  echo -e "${GREEN}###  DONE!!!  ###${NO_COLOR}"
  echo
}

function main {
  [ "$1" = "node" ] || [ "$1" = "1" ] && config-zsh-plugin && exit
  [ "$1" = "exit" ] || [ "$1" = "2" ] && exit

  echo -e "${RED}wrong argument: $1 ${NO_COLOR}"
  start-script
}

start-script() {
  echo -e "${BLUE}
  Insert option

    1 - config-zsh
    2 - exit

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
