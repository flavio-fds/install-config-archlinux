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
    3 - help
    4 - exit
    5 - ssh-agent -> persistent ssh-agent (password asked once per boot)
    ${NO_COLOR}"
  start-script
}

# ssh-agent persistente: pede a senha da chave uma vez e mantém até desligar o PC
config-ssh-agent() {
  echo -e "${GREEN}Config persistent ssh-agent (systemd user socket)${NO_COLOR}"

  # 1. ~/.ssh/config: guarda a chave no agente no primeiro uso
  mkdir -p "$HOME/.ssh" && chmod 700 "$HOME/.ssh"
  if ! grep -q "^Host github.com" "$HOME/.ssh/config" 2>/dev/null; then
    printf 'Host github.com\n    User git\n    IdentityFile ~/.ssh/id_rsa\n    AddKeysToAgent yes\n' >>"$HOME/.ssh/config"
    echo "added github.com block to $HOME/.ssh/config"
  else
    echo "github.com block already in $HOME/.ssh/config"
  fi
  chmod 600 "$HOME/.ssh/config"

  # 2. agente do systemd, ativado sob demanda pelo socket
  systemctl --user enable --now ssh-agent.socket

  # 3. todos os shells usam esse agente
  if ! grep -q "SSH_AUTH_SOCK" "$HOME/.zshenv" 2>/dev/null; then
    printf '\n# Usa o ssh-agent persistente do systemd (socket ativado sob demanda).\nexport SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"\n' >>"$HOME/.zshenv"
    echo "added SSH_AUTH_SOCK to $HOME/.zshenv"
  fi
  export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"
  echo
}

config-github() {
  echo -e "${GREEN}Starting config github${NO_COLOR}"

  git config --global core.editor "vim -w"

  echo -e "${RED}Type user name Example: Joaquin Pereira${NO_COLOR}"
  read usernamegit
  git config --global user.name "$usernamegit"

  echo -e "${RED}Type email github${NO_COLOR}"
  read emailgit
  git config --global user.email "$emailgit"

  git config --list

  echo -e "${GREEN}Generated a config file ~/.gitconfig${NO_COLOR}"

  echo -e "${GREEN}Config Key Ssh${NO_COLOR}"
  echo
  echo -e "${RED}Confirm location e add password${NO_COLOR}"
  echo
  ssh-keygen -t rsa -b 4096 -C "$emailgit"

  config-ssh-agent

  echo -e "${GREEN}Add Chave ssh-agent${NO_COLOR}"
  ssh-add ~/.ssh/id_rsa # add key private SSH to the ssh-agent
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
  [ "$1" = "ssh-agent" ] || [ "$1" = "5" ] && config-ssh-agent && exit

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
    5 - ssh-agent

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
