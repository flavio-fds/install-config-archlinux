#!/usr/bin/env bash

echo
echo "INSTALLING AUR SOFTWARE"
echo

cd "${HOME}"

PKGS=(

    # SYSTEM UTILITIES ----------------------------------------------------

    # TERMINAL UTILITIES --------------------------------------------------

    # UTILITIES -----------------------------------------------------------

    # DEVELOPMENT ---------------------------------------------------------
    
    'visual-studio-code-bin'    # Kickass text editor

    # MEDIA ---------------------------------------------------------------

    'spotify'                   # Music player

    # 'aftershotpro3'             # Photo editor

    # POST PRODUCTION -----------------------------------------------------

    # COMMUNICATIONS ------------------------------------------------------

    'zoom'  # Zoom
    'slack' # Slack

    # THEMES --------------------------------------------------------------

)


cd ${HOME}/AUR
chmod +x aur.sh

for PKG in "${PKGS[@]}"; do
    ./aur.sh -i $PKG
done

echo
echo "Done!"
echo