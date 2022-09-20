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

#install-packages-WITH-CONFIRM(){
#echo -e "${VERDE}INSTALL PACKAGES${SEM_COR}"
#echo ""
#echo -e "${VERMELHO}for the linux kernel, choose virtualbox-host-modules-arch${SEM_COR}"
#echo -e "${VERMELHO}for any other kernel (including linux-lts), choose virtualbox-host-dkms${SEM_COR}"
#echo ""
#for PKG in "${PKGS_WITH_CONFIRM[@]}"; do
#    if ! pacman -Q "$PKG" &> /dev/null; then
#      echo -e "${VERDE}Installing: ${PKG}${SEM_COR}"
#      sudo pacman -S "$PKG" --needed
#    else
#      echo -e "${VERMELHO}Package [$PKG] already installed${SEM_COR}"
#    fi
#done
#}

start-script
update-packages
check-packages
install-packages
#install-packages-WITH-CONFIRM

echo -e "${VERDE}#################${SEM_COR}"
echo -e "${VERDE}###  DONE!!!  ###${SEM_COR}"
echo -e "${VERDE}#################${SEM_COR}"

