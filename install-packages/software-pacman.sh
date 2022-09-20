#!/usr/bin/env bash

VERMELHO='\e[1;91m'
VERDE='\e[1;92m'
SEM_COR='\e[0m'
Y="y"

echo -e "${VERDE}#############################${SEM_COR}"
echo -e "${VERDE}###  INSTALL SOFTWARE!!!  ###${SEM_COR}"
echo -e "${VERDE}#############################${SEM_COR}" && sleep 1

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
    'zsh-syntax-highlighting' # zsh add-on
    'playerctl'             # Utility controls media players
    'lolcat'                 # Font terminal color
    'less'
    'speedtest-cli'         # Internet speed via terminal
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

    # COMMUNICATIONS ------------------------------------------------------

    # MEDIA ---------------------------------------------------------------

    'alsa-utils'            # Command line utilities for the ALSA project
    'pavucontrol'           # Volume control tool
    'vlc'                   # Video player
    'obs-studio'                   # Record your screen
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
    'nano'                  # Nano simple text editor
    'evince'                # PDF viewer

    # VIRTUALIZATION ------------------------------------------------------

    'virtualbox'
)

PKGS_WITH_CONFIRM=(

    # VIRTUALIZATION ------------------------------------------------------
  
    'virtualbox-host-modules-arch' # to provide host modules: for the linux kernel, choose virtualbox-host-modules-arch
  
    # PRODUCTIVITY --------------------------------------------------------
  
    'gvim'                  # Gvim simple text editor

)

start-script(){
    echo -e "${VERDE}start script(y/N)${SEM_COR}"
  read VERIFICATION
  if [ ${VERIFICATION} = $Y ]; then
    echo -e "${VERDE}script starting${SEM_COR}"
  else
    echo -e "${VERMELHO}script finished${SEM_COR}"
    exit 1
  fi
}

update-packages(){
    echo -e "${VERDE}Update packages(y/N)${SEM_COR}"
  read VERIFICATION
  if [ ${VERIFICATION} = $Y ]; then
    echo -e "${VERDE}Updating packages!!!${SEM_COR}"
    sudo pacman -Syu
  fi
}

check-packages(){
  echo "CHECK PACKAGES"
  for PKG in "${PKGS[@]}"; do
    if pacman -Ss "$PKG" &> /dev/null; then
       echo -e "${VERDE}Package [$PKG] OK${SEM_COR}"
    else
       echo -e "${VERMELHO}Package [$PKG] not found${SEM_COR}"
       exit 1
    fi
 done
}

install-packages(){
  echo "INSTALL PACKAGES"
for PKG in "${PKGS[@]}"; do
    if ! pacman -Q "$PKG" &> /dev/null; then
       echo -e "${VERDE}Installing: ${PKG}${SEM_COR}"
       sudo pacman -S "$PKG" --noconfirm --needed
    else
       echo -e "${VERMELHO}Package [$PKG] already installed${SEM_COR}"
    fi
done
}

install-packages-WITH-CONFIRM(){
echo -e "${VERDE}INSTALL PACKAGES${SEM_COR}"
echo ""
echo -e "${VERMELHO}for the linux kernel, choose virtualbox-host-modules-arch${SEM_COR}"
echo -e "${VERMELHO}for any other kernel (including linux-lts), choose virtualbox-host-dkms${SEM_COR}"
echo ""
for PKG in "${PKGS_WITH_CONFIRM[@]}"; do
    if ! pacman -Q "$PKG" &> /dev/null; then
      echo -e "${VERDE}Installing: ${PKG}${SEM_COR}"
      sudo pacman -S "$PKG" --needed
    else
      echo -e "${VERMELHO}Package [$PKG] already installed${SEM_COR}"
    fi
done
}

start-script
update-packages
check-packages
install-packages
install-packages-WITH-CONFIRM

echo -e "${VERDE}#################${SEM_COR}"
echo -e "${VERDE}###  DONE!!!  ###${SEM_COR}"
echo -e "${VERDE}#################${SEM_COR}"

