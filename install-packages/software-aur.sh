#!/usr/bin/env bash

VERMELHO='\e[1;91m'
VERDE='\e[1;92m'
SEM_COR='\e[0m'

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

       help      shows help
       install   installs a package
       update    update a package
       remove    removes installed package via pacman
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
  [ -z "$1" ] || [ "$1" == "help" ] && help       && exit
  [ "$1" == "install" ]             && script-aur "install" && check-package-installed && msg-done && exit
  [ "$1" == "update" ]              && script-aur "update" && msg-done && exit
  [ "$1" == "remove" ]              && script-aur "remove" && msg-done && exit

  echo "wrong argument: $1"
}

start-script(){
  echo -e "${VERDE}start script config(y/N)${SEM_COR}"
  read VERIFICATION
  if [ ${VERIFICATION} = $Y ]; then
    echo -e "${VERDE}script starting${SEM_COR}"
    chmod +x script-aur.sh
  else
    echo -e "${VERDE}script finished${SEM_COR}"
    exit 1
  fi

  echo "

    install
    update
    remove
    help

  Insert option:"
    read option
    main $option
}

start-script
