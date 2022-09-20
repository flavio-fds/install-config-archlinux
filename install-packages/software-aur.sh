#!/usr/bin/env bash

VERMELHO='\e[1;91m'
VERDE='\e[1;92m'
SEM_COR='\e[0m'

Y="y"

echo
echo -e "${VERDE}####################################${SEM_COR}"
echo -e "${VERDE}###  INSTALLING AUR SOFTWARE!!!  ###${SEM_COR}"
echo -e "${VERDE}####################################${SEM_COR}"
echo

PKGS=(

    # SYSTEM UTILITIES ----------------------------------------------------
    #'hardinfo'              # Hardware info app
    #'flashplugin'           # Flash
    'simple-mtpfs'   #Media Transfer Protocol (MTP) can be used to transfer media files to and from many mobile phones

    # TERMINAL UTILITIES --------------------------------------------------

    'spaceship-prompt'          # zsh add-on
    'lf'            # Terminal file manager
    
    # DEVELOPMENT ---------------------------------------------------------
    
    'visual-studio-code-bin'    # Kickass text editor

    # MEDIA ---------------------------------------------------------------

    #'spotify'                   # Music player

    # COMMUNICATIONS ------------------------------------------------------

    'zoom'  # Zoom
    'slack-desktop' # Slack

    # THEMES --------------------------------------------------------------

    'nerd-fonts-complete'       #Fonts Nerd
)

function help {
  echo "
  Insert valid argument

       4 - help      shows help
       1 - install   installs a package
       2 - update    update a package
       3 - remove    removes installed package via pacman
       5 - exit
    "
    start-script
}

function script-aur {
    for PKG in "${PKGS[@]}"; do
        ./script-aur.sh $1 $PKG
    done
}

function check-package-installed {
    for PKG in "${PKGS[@]}"; do
        if pacman -Q "$PKG" &> /dev/null; then
        echo -e "${VERDE}Package [$PKG] already installed${SEM_COR}"
        else
        echo -e "${VERMELHO}Error Install Package ${PKG}${SEM_COR}"
        fi
    done
}

function msg-done {
    echo
    echo -e "${VERDE}##################${SEM_COR}"
    echo -e "${VERDE}###  Done!!!!  ###${SEM_COR}"
    echo -e "${VERDE}##################${SEM_COR}"
    echo
}

function main {
  [ -z "$1" ] || [ "$1" == "help" ] || [ "$1" == "4" ] && help       && exit
  [ "$1" == "install" ] || [ "$1" == "1" ] && script-aur "install" && check-package-installed && msg-done && exit
  [ "$1" == "update" ] || [ "$1" == "2" ] && script-aur "update" && msg-done && exit
  [ "$1" == "remove" ] || [ "$1" == "3" ] && script-aur "remove" && msg-done && exit
  [ "$1" == "exit" ] || [ "$1" == "5" ] && exit

  echo "wrong argument: $1"
}

start-script(){
  echo -e "${VERDE}start script install packages AUR(y/N)${SEM_COR}"
  read VERIFICATION
  [ -z "$VERIFICATION" ] || [ ${VERIFICATION} != $Y ] && echo -e "${VERMELHO}script finished${SEM_COR}" && exit
  [ ${VERIFICATION} == $Y ] && echo -e "${VERDE}script starting${SEM_COR}" && chmod +x script-aur.sh

  echo "

    1 - install
    2 - update
    3 - remove
    4 - help
    5 - exit

  Insert option:"
    read option
    main $option
}

function check-folder {
    if [[ $(basename $PWD) != "install-packages" ]]; then
        echo -e "${VERMELHO}Run the script inside your folder${SEM_COR}"
        exit
    fi
}

check-folder

start-script
