#!/usr/bin/env bash

VERMELHO='\e[1;91m'
VERDE='\e[1;92m'
SEM_COR='\e[0m'

Y="y"
echo
echo -e "${VERDE}######################################${SEM_COR}"
echo -e "${VERDE}###  CONFIG GITHUB AND KEY SSH!!!  ###${SEM_COR}"
echo -e "${VERDE}######################################${SEM_COR}"
echo
config-github(){
    echo -e "${VERDE}Starting config github${SEM_COR}"

    git config --global core.editor "vim -w"

    echo -e "${VERMELHO}Type user name Example: Joaquin Pereira${SEM_COR}"
    read usernamegit
    git config --global user.name $usernamegit

    echo -e "${VERMELHO}Type email github${SEM_COR}"
    read emailgit
    git config --global user.email $emailgit  

    git config --list

    echo -e "${VERDE}Generated a config file ~/.gitconfig${SEM_COR}"

    echo -e "${VERDE}Config Key Ssh${SEM_COR}"
    echo
    echo -e "${VERMELHO}Confirm location e add password${SEM_COR}"
    echo
    ssh-keygen -t rsa -b 4096 -C $emailgit

    echo -e "${VERDE}Add Chave ssh-agent${SEM_COR}"

    eval "$(ssh-agent -s)" # start ssh-agent in background 
    ssh-add ~/.ssh/id_rsa # add key private SSH to the ssh-agent
    echo "No canto superior direito do GitHub , clique na sua foto de perfil e clique em Settings ;

    Na barra lateral esquerda, clique em SSH and GPG keys ;

    Clique em New SSH key ou Add SSH key ;

    No campo Título , adicione um descrição para a nova chave;

    Cole sua chave dentro do campo Key ;

    Clique em Add SSH key"

    echo

    cat $HOME/.ssh/id_rsa.pub # Show key public

    echo
    echo -e "${VERMELHO}https://github.com/settings/ssh/new${SEM_COR}"
    echo
    echo -e "${VERMELHO}After adding key type OK ${SEM_COR}"
    read ok
    echo $ok
    echo
    echo -e "${VERDE}###  DONE!!!  ###${SEM_COR}"
    echo
}

start-script(){
  echo -e "${VERDE}start script config github(y/N)${SEM_COR}"
  read VERIFICATION

  [ -z "$VERIFICATION" ] || [ ${VERIFICATION} != $Y ] && echo -e "${VERMELHO}script finished${SEM_COR}" && exit
  [ ${VERIFICATION} == $Y ] && echo -e "${VERDE}script github and SSH config starting${SEM_COR}" && config-github

}

function check-folder {
    if [[ $(basename $PWD) != "config-system" ]]; then
        echo -e "${VERMELHO}Run the script inside your folder${SEM_COR}"
        exit
    fi
}

check-folder

start-script
