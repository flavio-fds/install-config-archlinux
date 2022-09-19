#!/usr/bin/env bash

VERMELHO='\e[1;91m'
VERDE='\e[1;92m'
SEM_COR='\e[0m'

echo
echo "INSTALLING SOFTWARE"
echo

PKGS=(

    # SYSTEM --------------------------------------------------------------
    'xcompmgr'              # Primitive window transparency (zoom draw scree)
    'intel-gpu-tools'
    'brightnessctl'         # Screen brightness control
    'lm_sensors'            # Sensors hardware

    # TERMINAL UTILITIES --------------------------------------------------

    'translate-shell'
    'make'
    'man-db'
    'gnome-keyring'         # System password storage
    'alacritty'             # Terminal emulator
    'bc'                    # Precision calculator language
    'calc'                  # Precision calculator language
    'curl'                  # Remote content retrieval
    'feh'                   # Terminal-based image viewer/manipulator
    'htop'                  # Process viewer
    'neofetch'              # Shows system info when you launch terminal
    'numlockx'              # Turns on numlock in X11
    'unrar'                 # RAR compression program
    'unzip'                 # Zip compression program
    'zip'                   # Zip compression program
    'wget'                  # Remote content retrieval
    'zsh'                   # ZSH shell - add-on(zsh-autosuggestions, zsh-syntax-highlighting,  spaceship-prompt(AUR))
    'zsh-autosuggestions'   # zsh add-on
    'zsh-syntax-highlighting'# zsh add-on
    'playerctl'             # Utility controls media players
    'lolcat'                 # Font terminal color
    'less'
    'speedtest-cli'         # Internet speed via terminal
    'hardinfo'              # Hardware info app
    #'rsync'                 # Remote file sync utility

    # DISK UTILITIES ------------------------------------------------------

    'ntfs-3g'               # Open source implementation of NTFS file system
    'dosfstools'            # 
    'os-prober'             # 
    'mtools'                #

    # GENERAL UTILITIES ---------------------------------------------------

    'scrot'                 # Screen capture.
    'rofi'                  # Application launcher
    'thunar'                  # Filesystem browser
    'catfish'               # Filesystem search

    # DEVELOPMENT ---------------------------------------------------------
    
    'mysql-workbench'
    'httpie'
    'docker'
    'git'                   # Version control system
    'clang'                 # C Lang compiler
    'gcc'                   # C/C++ compiler
    'glibc'                 # C libraries
    'php'                   # Web application scripting language
    'go'                    # Scripting language
    'python'                # Scripting language
    'yarn'                  # Dependency management (Hyper needs this)

    # WEB TOOLS -----------------------------------------------------------

    'chromium'              # Web browser
    'firefox'               # Web browser
    'transmission-gtk'      # Download torrent
    'flashplugin'           # Flash

    # COMMUNICATIONS ------------------------------------------------------

    # MEDIA ---------------------------------------------------------------

    'alsa-utils'            # Command line utilities for the ALSA project
    'pavucontrol'           # Volume control tool
    'vlc'                   # Video player
    'obs'                   # Record your screen
    'lollypop'              # Music player

    # GRAPHICS AND DESIGN -------------------------------------------------

    'gimp'                  # GNU Image Manipulation Program
    'inkscape'              # Vector image creation app
    'imagemagick'           # Command line image manipulation tool
    'pngcrush'              # Tools for optimizing PNG images
    'noto-fonts-emoji'
    'ttf-ubuntu-font-family'

    # PRODUCTIVITY --------------------------------------------------------

    'libreoffice-still'     # Libre office with extra features
    'gvim'                  # Gvim simple text editor
    'nano'                  # Nano simple text editor
    'evince'                # PDF viewer

    # VIRTUALIZATION ------------------------------------------------------

    'virtualbox'
    'virtualbox-host-modules-arch'
)

for PKG in "${PKGS[@]}"; do
    echo "CHECK NAME PACKAGE: ${PKG}"
    if sudo pacman -Q "$PKG"; then
       echo -e "${VERDE}Package [$PKG] OK${SEM_COR}"
    else
       echo -e "${VERMELHO}Package [$PKG] not found${SEM_COR}"
       exit 1
    fi
done

#for PKG in "${PKGS[@]}"; do
#    echo "INSTALLING: ${PKG}"
#    sudo pacman -S "$PKG" --noconfirm --needed
#done

echo
echo "Done!"
echo
