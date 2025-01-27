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
  # SYSTEM BASE --------------------------------------------------------------
'base'
'base-devel'
'linux-firmware'
'linux-lts'


  # SYSTEM --------------------------------------------------------------
'efibootmgr'
'htop'
'intel-media-driver'
'intel-ucode'
'iwd'
'libpulse'
'libva-intel-driver'
'lightdm'
'lightdm-gtk-greeter'
'network-manager-applet'
'networkmanager'
'pipewire'
'pipewire-alsa'
'pipewire-jack'
'pipewire-pulse'
'smartmontools'
'vulkan-intel'
'wget'
'wireless_tools'
'wireplumber'
'xdg-utils'
'xorg-xinit'
'xss-lock'
'xterm'
'zram-generator'
'xorg-xprop'
'xorg-server'
'xorg-xbacklight'
'inetutils' # collection of common network programs
'xfsprogs' # gerenciamento de sistema de arquivos XFS
'btrfs-progs' # Utilitários do sistema de arquivos Btrfs
'usbutils' #lsusb
'mesa-demos'
'intel-gpu-tools'
'brightnessctl'       # Screen brightness control
'lm_sensors'          # Sensors hardware
'numlockx'    # Turns on numlock in X11
'less'
'man-db'
'ntfs-3g'    # Open source implementation of NTFS file system
'dosfstools'
'os-prober'
'mtools'
'xorg-xhost'
'xorg-xkill'
'nfs-utils' # Network File System 
'cronie' # agendador de tarefas terminal
'tar'
'bzip2'
'unrar'                   # RAR compression program
'unzip'                   # Zip compression program
'zip'                     # Zip compression program

  # WINDOW MANAGER
'i3-wm'
'i3blocks'
'i3lock'
'i3status'

  # TERMINAL UTILITIES --------------------------------------------------
'make'
'which'
'curl'

'alacritty'
'arandr'
'dmenu'
'git'
'nano'
'vim'

  # WEB TOOLS -----------------------------------------------------------
'firefox'         # Web browser

'lxappearance'        #set theme GTK

  # MEDIA ---------------------------------------------------------------

'tree'
'pkgfile'

'gparted'

'f2fs-tools'

'translate-shell'
'gnome-keyring'
'bc' # Precision calculator language
'calc' # Precision calculator language
'feh' # Terminal-based image viewer/manipulator
  # GENERAL UTILITIES ---------------------------------------------------

  # DEVELOPMENT ---------------------------------------------------------
'scrot'   # Screen capture.
'rofi'    # Application launcher
'thunar'  # Filesystem browser
'mysql-workbench'
'httpie'
'docker'
'docker-compose'
'clang'
'php'
'go'
'go-tools'
'yarn'
'ruby'
'python'

'java-runtime-common' #Gerencia Java "pacman -Ss openjdk java" "sudo pacman -S [nome do pacote]" "archlinux-java status"
'jre17-openjdk'


'transmission-gtk' # Download torrent

  # COMMUNICATIONS ------------------------------------------------------

  # MEDIA ---------------------------------------------------------------
'alsa-utils'  # Command line utilities for the ALSA project
'pavucontrol' # Volume control tool
'vlc'         # Video player
'obs-studio'  # Record your screen

  # GRAPHICS AND DESIGN -------------------------------------------------

'gimp'        # GNU Image Manipulation Program
'inkscape'    # Vector image creation app

'ttf-ubuntu-font-family'
'noto-fonts-emoji'

'arc-solid-gtk-theme' #theme GTK

  # PRODUCTIVITY --------------------------------------------------------

'libreoffice-still' # Libre office with extra features
'evince'            # PDF viewer
'viewnior'

  
  # BLUETOOTH --------------------------------------------------------

'bluez'
'bluez-utils'
'blueman'
  #start app bluetooth systemctl start bluetooth.service

'zsh'                     # ZSH shell - add-on(zsh-autosuggestions, zsh-syntax-highlighting,  spaceship-prompt(AUR))
'zsh-autosuggestions'     # zsh add-on
'zsh-syntax-highlighting' # zsh add-on

#'sof-firmware' #Caso o som n'ao funcione 
#'alsa-ucm-conf' #Caso o som n'ao funcione 

#'piper' # GTK application to configure gaming mouse 

  #UNNECESSARY --------------------------------------------------------

#'openssh'
#'xf86-input-libinput'
#'gcc'
#'glibc'
#'gst-plugin-pipewire'
#'archlinux-keyring'
#'nss-mdns'
#'pacman-contrib'
#'xcompmgr' # Primitive window transparency (zoom draw scree)
#'gcolor2'
#'networkmanager-openconnect'
#'networkmanager-openvpn'
#'networkmanager-pptp'
#'networkmanager-vpnc'
#'alsa-firmware'
#'alsa-plugins'
#'xf86-input-elographics'
#'xf86-input-evdev'
#'f86-input-void'
#'dhclient'
#'dhcpcd'
#'openresolv'
#'modemmanager'
#'ntp' #Network Time Protocol Sincronizar relógio do software
#'libgpod' #Uma biblioteca compartilhada para acessar o conteúdo de um iPod
#'lxinput' #Programa para configurar teclado e mouse
#'jfsutils'
#'lib32-flex'
#'lib32-mesa-demos'
#'gufw' # 	Uncomplicated way to manage your Linux firewall - sudo gufw
#'dmidecode' #info hardware
#'exfatprogs'
#'gvfs' # sistema de arquivos virtual do GNOME
#'gvfs-afc'
#'gvfs-gphoto2'
#'gvfs-mtp'
#'gvfs-smb'
#'playerctl'               # Utility controls media players
#'lolcat'                  # Font terminal color
#'hexchat'
#'rsync'
#'ffmpegthumbnailer'
#'tumbler' #complemento ffmpegthumbnailer 
#'catfish'
#'chromium'
#'lollypop'
#'imagemagick'
#'pngcrush'
#'noto-fonts-emoji'
#'ttf-dejavu'
#'ttf-droid'
#'ttf-inconsolata'
#'ttf-indic-otf'
#'xdg-user-dirs' #	Manage user directories like ~/Desktop and ~/Music
#'xautolock' 
#'wireless-regdb' # https://wiki.archlinux.org/title/Network_configuration/Wireless#Respecting_the_regulatory_domain
#'memtest86+' #Ferramenta de diagnóstico de memória avançada versão BIOS legada
#'syslog-ng' # Gerenciamento de logs
#'logrotate' # Gerenciamento de logs
#'dnsmasq'
)

PKGS_WITH_CONFIRM=(

  # VIRTUALIZATION ------------------------------------------------------

  'virtualbox'
  'virtualbox-guest-utils'
  'linux-lts-headers' #Para compilar os módulos do VirtualBox fornecidos pelo virtualbox-host-dkms , também será necessário instalar o(s) pacote(s) de cabeçalho apropriado(s) para o(s) kernel(s) instalado(s) (por exemplo , linux-lts-headers para linux-lts ). [1] Quando o VirtualBox ou o kernel for atualizado, os módulos do kernel serão recompilados automaticamente graças ao gancho DKMS pacman .
  
  # PRODUCTIVITY --------------------------------------------------------
  'vi'
  'gvim' # Gvim simple text editor

)

update-packages() {
  echo
  echo -e "${PURPLE}Update packages(y/N) ###(pacman -Syu)###${NO_COLOR}"
  read VERIFICATION
  if [ ${VERIFICATION} = $Y ]; then
    echo -e "${GREEN}Updating packages!!!${NO_COLOR}"
    sudo pacman -Syu
  fi
}

check-packages() {
  echo "CHECK PACKAGES"
  for PKG in "${PKGS[@]}"; do
    if pacman -Ss "$PKG" &>/dev/null; then
      echo -e "${GREEN}Package [$PKG] OK${NO_COLOR}"
    else
      echo -e "${RED}Package [$PKG] not found${NO_COLOR}"
      exit 1
    fi
  done
}

install-packages() {
  echo "INSTALL PACKAGES"
  for PKG in "${PKGS[@]}"; do
    if ! pacman -Q "$PKG" &>/dev/null; then
      echo -e "${GREEN}Installing: ${PKG}${NO_COLOR}"
      sudo pacman -S "$PKG" --noconfirm --needed
    else
      echo -e "${RED}Package [$PKG] already installed${NO_COLOR}"
    fi
  done
}

install-packages-WITH-CONFIRM() {
  echo -e "${GREEN}INSTALL PACKAGES${NO_COLOR}"
  echo ""
  echo -e "${YELLOW}[INFO] - for the linux kernel, choose virtualbox-host-modules-arch${NO_COLOR}"
  echo -e "${YELLOW}[INFO] - for any other kernel (including linux-lts), choose virtualbox-host-dkms${NO_COLOR}"
  echo ""
  for PKG in "${PKGS_WITH_CONFIRM[@]}"; do
    if ! pacman -Q "$PKG" &>/dev/null; then
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
    # check-packages
    update-packages
    install-packages
    install-packages-WITH-CONFIRM
    exit
  fi
  [ "$option" = "exit" ] || [ "$option" = "2" ] && exit
  echo -e "${RED}wrong argument: $1 ${NO_COLOR}"
  menu
}

start-script() {
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
