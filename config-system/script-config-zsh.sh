#!/usr/bin/env bash

VERMELHO='\e[1;91m'
VERDE='\e[1;92m'
SEM_COR='\e[0m'

Y="y"
echo
echo -e "${VERDE}##############################${SEM_COR}"
echo -e "${VERDE}###  CONFIG ZSH PLUGIN!!!  ###${SEM_COR}"
echo -e "${VERDE}##############################${SEM_COR}"
echo
config-zsh-plugin(){
  echo -e "${VERDE}Starting config github${SEM_COR}"

  PKGS=(
      'spaceship-prompt'
      'zsh-autosuggestions'
      'zsh-syntax-highlighting'
  )

  for PKG in "${PKGS[@]}"; do
      if pacman -Q "$PKG" &> /dev/null; then
        echo -e "${VERDE}Package [$PKG] installed${SEM_COR}"
      else
        echo -e "${VERMELHO}Package [$PKG] not installed${SEM_COR}"
      fi
  done

  for PKG in "${PKGS[@]}"; do
    if ! pacman -Q "$PKG" &> /dev/null; then
      echo -e "${VERDE}Install Package not installed ^^^^${SEM_COR}"
      exit
    fi
  done

    echo
    echo -e "${VERDE}list shell install${SEM_COR}"
    chsh -l
    echo
    echo -e "${VERDE}set zsh shell default${SEM_COR}"
    chsh -s /bin/zsh $USER
    echo
    echo -e "${VERDE}Plugins spaceship-prompt, zsh-autosuggestions, zsh-syntax-highlighting${SEM_COR}"
    echo
    echo
    echo -e "${VERDE}References${SEM_COR}"
    echo
    echo -e "${VERDE}https://spaceship-prompt.sh/
    https://github.com/spaceship-prompt/spaceship-prompt
    https://github.com/zsh-users/zsh-autosuggestions
    https://github.com/zsh-users/zsh-syntax-highlighting${SEM_COR}"
    echo
    echo
    echo -e "${VERDE}Edit Lines${SEM_COR}"
    echo
    echo -e "}#: \${ZSH_HIGHLIGHT_STYLES[suffix-alias]:=fg=green,underline}
    : \${ZSH_HIGHLIGHT_STYLES[suffix-alias]:=fg=green}
    #: \${ZSH_HIGHLIGHT_STYLES[precommand]:=fg=green,underline}
    : \${ZSH_HIGHLIGHT_STYLES[precommand]:=fg=green}
    #: \${ZSH_HIGHLIGHT_STYLES[path]:=underline}"
    echo
    code /usr/share/zsh/plugins/zsh-syntax-highlighting/highlighters/main/main-highlighter.zsh
    echo
    echo -e "${VERDE}###  DONE!!!  ###${SEM_COR}"
    echo
}

start-script(){
  echo -e "${VERDE}start script zsh plugin config(y/N)${SEM_COR}"
  read VERIFICATION

  [ -z "$VERIFICATION" ] || [ ${VERIFICATION} != $Y ] && echo -e "${VERMELHO}script finished${SEM_COR}" && exit
  [ ${VERIFICATION} == $Y ] && echo -e "${VERDE}starting archinstall${SEM_COR}" && config-zsh-plugin
}

function check-folder {
    if [[ $(basename $PWD) != "config-system" ]]; then
        echo -e "${VERMELHO}Run the script inside your folder${SEM_COR}"
        exit
    fi
}

check-folder

start-script
