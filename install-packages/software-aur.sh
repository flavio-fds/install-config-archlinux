#!/usr/bin/env bash

VERMELHO='\e[1;91m'
VERDE='\e[1;92m'
SEM_COR='\e[0m'

echo
echo "INSTALLING AUR SOFTWARE"
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

chmod +x script-aur.sh

for PKG in "${PKGS[@]}"; do
    ./script-aur.sh $@ $PKG
done

if [ $@ == "install" ]; then
    for PKG in "${PKGS[@]}"; do
        if pacman -Q "$PKG" &> /dev/null; then
        echo -e "${VERDE}Package [$PKG] already installed${SEM_COR}"
        else
        echo -e "${VERMELHO}Error Install Package ${PKG}${SEM_COR}"
        fi
    done
fi


echo
echo "Done!"
echo
