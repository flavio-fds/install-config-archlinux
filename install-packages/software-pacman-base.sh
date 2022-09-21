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
echo -e "${GREEN}####################################${NO_COLOR}"
echo -e "${GREEN}###  INSTALL SOFTWARE PACMAN!!!  ###${NO_COLOR}"
echo -e "${GREEN}####################################${NO_COLOR}"
echo
PKGS=(
    # SYSTEM --------------------------------------------------------------
    'alacritty'
    'archlinux-keyring 20220831-1'
    'autoconf'
    'base'
    'automake'
    'binutils'
    'bison'
    'brightnessctl'
    'calc'
    'dmenu'
    'efibootmgr'
    'fakeroot'
    'file'
    'findutils'
    'chromium'
    'firefox'
    'flex'
    'gawk'
    'gcc'
    'gettext'
    'git'
    'gnome-keyring'
    'grep'
    'groff'
    'gst-plugin-pipewire'
    'gvim'
    'gzip'
    'htop'
    'httpie'
    'i3-wm'
    'i3blocks'
    'i3lock'
    'i3status'
    'intel-gpu-tools'
    'intel-media-driver'
    'intel-ucode'
    'iwd'
    'libpulse'
    'libtool'
    'libva-intel-driver'
    'lightdm'
    'lightdm-gtk-greeter'
    'linux 5.19.9.arch1-1'
    'linux-firmware 20220815.8413c63-1'
    'm4'
    'make'
    'man-db'
    'nano'
    'network-manager-applet'
    'networkmanager'
    'ntfs-3g'
    'numlockx'
    'pacman'
    'patch'
    'pavucontrol'
    'pipewire'
    'pipewire-alsa'
    'pipewire-jack'
    'pipewire-pulse'
    'pkgconf'
    'postman-bin'
    'sed'
    'smartmontools'
    'sudo'
    'texinfo'
    'thunar'
    'translate-shell'
    'transmission-gtk'
    'ttf-ubuntu-font-family'
    'unrar'
    'unzip'
    'vlc'
    'vulkan-intel'
    'wget'
    'which'
    'wireless_tools'
    'wireplumber'
    'xcompmgr'
    'xdg-utils'
    'xorg-server'
    'xorg-xinit'
    'xterm'
    'zip'
    'zram-generator'
    'zsh'
    'autoconf-archive 1:2022.09.03-1'
    'go'
    'gtest'
    'js78'
    'libcmis'
    'python-cachecontrol'
    'python-certifi'
    'python-distlib'
    'python-distro'
    'python-pep517'
    'python-platformdirs'
    'python-resolvelib'
    'python-tenacity'
    'python-webencodings'
    'xorg-bdftopcf'
    'xorg-font-util'
    'xorg-mkfontscale'
    'yar'
)

#PKGS_WITH_CONFIRM=(
#)

update-packages(){
    echo -e "${GREEN}Update packages(y/N)${NO_COLOR}"
  read VERIFICATION
  if [ ${VERIFICATION} = $Y ]; then
    echo -e "${GREEN}Updating packages!!!${NO_COLOR}"
    sudo pacman -Syu
  fi
}

check-packages(){
  echo "CHECK PACKAGES"
  for PKG in "${PKGS[@]}"; do
    if pacman -Ss "$PKG" &> /dev/null; then
       echo -e "${GREEN}Package [$PKG] OK${NO_COLOR}"
    else
       echo -e "${RED}Package [$PKG] not found${NO_COLOR}"
       exit 1
    fi
 done
}

install-packages(){
  echo "INSTALL PACKAGES"
for PKG in "${PKGS[@]}"; do
    if ! pacman -Q "$PKG" &> /dev/null; then
       echo -e "${GREEN}Installing: ${PKG}${NO_COLOR}"
       sudo pacman -S "$PKG" --noconfirm --needed
    else
       echo -e "${RED}Package [$PKG] already installed${NO_COLOR}"
    fi
done
}

install-packages-WITH-CONFIRM(){
echo -e "${GREEN}INSTALL PACKAGES${NO_COLOR}"
echo ""
echo -e "${RED}for the linux kernel, choose virtualbox-host-modules-arch${NO_COLOR}"
echo -e "${RED}for any other kernel (including linux-lts), choose virtualbox-host-dkms${NO_COLOR}"
echo ""
for PKG in "${PKGS_WITH_CONFIRM[@]}"; do
    if ! pacman -Q "$PKG" &> /dev/null; then
      echo -e "${GREEN}Installing: ${PKG}${NO_COLOR}"
      sudo pacman -S "$PKG" --needed
    else
      echo -e "${RED}Package [$PKG] already installed${NO_COLOR}"
    fi
done
}

function check-folder {
    if [[ $(basename $PWD) != "install-packages" ]]; then
        echo -e "${RED}Run the script inside your folder${NO_COLOR}"
        exit
    fi
}

function menu {
echo -e "${BLUE}

    1 - install-package ^^^
    2 - exit

  Insert option:${NO_COLOR}"
  
  read option
  if [[ "$option" = "install-package" ]] || [[ "$option" = "1" ]]; then
    check-packages
    update-packages
    install-packages
    # install-packages-WITH-CONFIRM
    exit
  fi
  [ "$option" = "exit" ] || [ "$option" = "2" ] && exit
  menu
}

start-script(){
  check-folder
  for PKG in "${PKGS[@]}"; do
       echo -e "${GREEN}${PKG}${NO_COLOR}"
  done
  for PKG in "${PKGS_WITH_CONFIRM[@]}"; do
      echo -e "${GREEN}${PKG}${NO_COLOR}"
  done

  menu
}


start-script

echo -e "${GREEN}#################${NO_COLOR}"
echo -e "${GREEN}###  DONE!!!  ###${NO_COLOR}"
echo -e "${GREEN}#################${NO_COLOR}"

