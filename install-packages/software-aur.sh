#!/usr/bin/env bash

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

    'spotify'                   # Music player

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

echo
echo "Done!"
echo