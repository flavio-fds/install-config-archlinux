#!/usr/bin/env bash

VERMELHO='\e[1;91m'
VERDE='\e[1;92m'
SEM_COR='\e[0m'

Y="y"

echo -e "${VERDE}##############################${SEM_COR}"
echo -e "${VERDE}###  CONFIG ZSH PLUGIN!!!  ###${SEM_COR}"
echo -e "${VERDE}##############################${SEM_COR}"

config-zsh-plugin(){
    echo -e "${VERDE}Starting config github${SEM_COR}"
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
    echo -e "${VERDE}#: \${ZSH_HIGHLIGHT_STYLES[suffix-alias]:=fg=green,underline}
    : \${ZSH_HIGHLIGHT_STYLES[suffix-alias]:=fg=green}
    #: \${ZSH_HIGHLIGHT_STYLES[precommand]:=fg=green,underline}
    : \${ZSH_HIGHLIGHT_STYLES[precommand]:=fg=green}
    #: \${ZSH_HIGHLIGHT_STYLES[path]:=underline}${SEM_COR}"
    code /usr/share/zsh/plugins/zsh-syntax-highlighting/highlighters/main/main-highlighter.zsh
}

start-script(){
  echo -e "${VERDE}start script zsh plugin config(y/N)${SEM_COR}"
  read VERIFICATION
  if [ ${VERIFICATION} = $Y ]; then
    echo -e "${VERDE}script config zsh plugin starting${SEM_COR}"
    config-zsh-plugin
  else
    echo -e "${VERDE}script finished${SEM_COR}"
    exit 1
  fi
}

start-script