#!/usr/bin/env bash

echo
echo "INSTALLING AUR SOFTWARE"
echo

cd "${HOME}"

PKGS=(

    # SYSTEM UTILITIES ----------------------------------------------------

    'simple-mtpfs'   #Media Transfer Protocol (MTP) can be used to transfer media files to and from many mobile phones

    # TERMINAL UTILITIES --------------------------------------------------

    'spaceship-prompt'          # zsh add-on
    
    # UTILITIES -----------------------------------------------------------
    
    'lf'            # Terminal file manager
    
    # DEVELOPMENT ---------------------------------------------------------
    
    'visual-studio-code-bin'    # Kickass text editor

    # MEDIA ---------------------------------------------------------------

    'spotify'                   # Music player

    # 'aftershotpro3'             # Photo editor

    # POST PRODUCTION -----------------------------------------------------

    # COMMUNICATIONS ------------------------------------------------------

    'zoom'  # Zoom
    'slack-desktop' # Slack

    # THEMES --------------------------------------------------------------
    'nerd-fonts-complete'       #Fonts Nerd
)


cd ${HOME}/AUR
chmod +x aur.sh

for PKG in "${PKGS[@]}"; do
    ./aur.sh -i $PKG
done

echo
echo "Done!"
echo