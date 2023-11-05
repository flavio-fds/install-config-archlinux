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

  # 'cantarell-fonts'
  # 'coreutils'
  # 'cryptsetup'
  # 'device-mapper'
  # 'diffutils'
  # 'e2fsprogs'
  # 'ffmpeg'
  # 'filesystem'
  # 'flac'
  # 'gcc-libs'
  # 'glibc'
  # 'gstreamer'
  # 'iproute2'
  # 'iputils'
  # 'licenses'
  # 'mobile-broadband-provider-info'
  # 'pciutils'
  # 'perl'
  # 'procps-ng'
  # 'psmisc'
  # 'shadow'
  # 'sysfsutils'
  # 'systemd'
  # 'systemd-sysvcompat'
  # 'util-linux'
  # 'wpa_supplicant'
  # 'xf86-input-libinput'
  # 'xz'
  # 'autoconf'
  # 'automake'
  # 'avahi'
  # 'bison'
  # 'debugedit'
  # 'efibootmgr'
  # 'fakeroot'
  # 'file'
  # 'findutils'
  # 'flex'
  # 'gawk'
  # 'gcc'
  # 'gettext'
  # 'grep'
  # 'groff'
  # 'gst-plugin-pipewire'
  # 'gzip'
  # 'intel-media-driver'
  # 'intel-ucode'
  # 'iwd'
  # 'libpulse'
  # 'libtool'
  # 'libva-intel-driver'
  # 'lightdm'
  # 'lightdm-gtk-greeter'
  # 'linux-firmware'
  # 'linux-lts'
  # 'm4'
  # 'pacman'
  # 'patch'
  # 'pkgconf'
  # 'sed'
  # 'smartmontools'
  # 'sudo'
  # 'texinfo'
  # 'wireplumber'
  # 'zram-generator'

  # SYSTEM --------------------------------------------------------------
  
  'xorg-xprop'
  'xdg-utils'
  'xorg-server'
  'xorg-xinit'
  'xorg-xbacklight'
  'i3-wm'
  'i3blocks'
  'i3lock'
  'i3status'
  'pipewire'
  'pipewire-alsa'
  'pipewire-jack'
  'pipewire-pulse'
  'make'
  'openssh'
  'vulkan-intel'
  'wget'
  'which'
  'wireless_tools'
  'dmenu'
  'bzip2'
  'archlinux-keyring'
  'nss-mdns'
  'pacman-contrib'
  'xcompmgr' # Primitive window transparency (zoom draw scree)
  'intel-gpu-tools'
  'brightnessctl'       # Screen brightness control
  'lm_sensors'          # Sensors hardware
  'lxappearance'        #set theme GTK
  'arc-solid-gtk-theme' #theme GTK
  'tree'
  'arandr'
  'pkgfile'
  'gcolor2'
  'gparted'
  'bluez-utils'
  'blueman'
  'networkmanager'
  'network-manager-applet'
  'networkmanager-openconnect'
  'networkmanager-openvpn'
  'networkmanager-pptp'
  'networkmanager-vpnc'
  'alsa-firmware'
  'alsa-plugins'
  'xf86-input-elographics'
  'xf86-input-evdev'
  'xf86-input-void'
  'xf86-input-libinput'
  'xorg-xhost'
  'xorg-xkill'
  'dhclient'
  'dhcpcd'
  'openresolv'
  'modemmanager'
  'nfs-utils' # Network File System 
  'ntp' #Network Time Protocol Sincronizar relógio do software
  'xfsprogs' # gerenciamento de sistema de arquivos XFS
  'btrfs-progs' # Utilitários do sistema de arquivos Btrfs
  'usbutils' #lsusb
  'mesa-demos'
  'libgpod' #Uma biblioteca compartilhada para acessar o conteúdo de um iPod
  'lxinput' #Programa para configurar teclado e mouse
  'inetutils' # collection of common network programs
  'jfsutils'
  'lib32-flex'
  'lib32-mesa-demos'
  'gufw' # 	Uncomplicated way to manage your Linux firewall - sudo gufw
  'dmidecode' #info hardware
  'exfatprogs'
  'f2fs-tools'

  'gvfs' # sistema de arquivos virtual do GNOME
  'gvfs-afc'
  'gvfs-gphoto2'
  'gvfs-mtp'
  'gvfs-smb'

  'gst-libav' #Plugin GStreamer
  'gst-plugins-bad' #Plugin GStreamer
  'gst-plugins-base' #Plugin GStreamer
  'gst-plugins-good' #Plugin GStreamer
  'gst-plugins-ugly' #Plugin GStreamer

#  'xdg-user-dirs' #	Manage user directories like ~/Desktop and ~/Music
#  'xautolock' 
#  'wireless-regdb' # https://wiki.archlinux.org/title/Network_configuration/Wireless#Respecting_the_regulatory_domain
#  'memtest86+' #Ferramenta de diagnóstico de memória avançada versão BIOS legada
#  'syslog-ng' # Gerenciamento de logs
#  'logrotate' # Gerenciamento de logs
#  'dnsmasq'


  # TERMINAL UTILITIES --------------------------------------------------
  'xterm'
  'translate-shell'
  'make'
  'man-db'
  'gnome-keyring'           # System password storage
  'alacritty'               # Terminal emulator
  'bc'                      # Precision calculator language
  'calc'                    # Precision calculator language
  'curl'                    # Remote content retrieval
  'feh'                     # Terminal-based image viewer/manipulator
  'htop'                    # Process viewer
  'neofetch'                # Shows system info when you launch terminal
  'numlockx'                # Turns on numlock in X11
  'unrar'                   # RAR compression program
  'unzip'                   # Zip compression program
  'zip'                     # Zip compression program
  'tar'
  'wget'                    # Remote content retrieval
  'zsh'                     # ZSH shell - add-on(zsh-autosuggestions, zsh-syntax-highlighting,  spaceship-prompt(AUR))
  'zsh-autosuggestions'     # zsh add-on
  'zsh-syntax-highlighting' # zsh add-on
  'playerctl'               # Utility controls media players
  'lolcat'                  # Font terminal color
  'less'
  'speedtest-cli' # Internet speed via terminal
  'cronie' # agendador de tarefas terminal
  'hexchat'
  'rsync'                 # Remote file sync utility

  # DISK UTILITIES ------------------------------------------------------

  'ntfs-3g'    # Open source implementation of NTFS file system
  'dosfstools' #
  'os-prober'  #
  'mtools'     #

  # GENERAL UTILITIES ---------------------------------------------------

  'scrot'   # Screen capture.
  'rofi'    # Application launcher
  'thunar'  # Filesystem browser
  'ffmpegthumbnailer' #Programa externo para gerar imagens em miniatura thunar 'complemento tumbler'
  'tumbler' #complemento ffmpegthumbnailer 
  'catfish' # Filesystem search

  # DEVELOPMENT ---------------------------------------------------------

  'mysql-workbench'
  'httpie'
  'docker'
  'git'    # Version control system
  'clang'  # C Lang compiler
  'gcc'    # C/C++ compiler
  'glibc'  # C libraries
  'php'    # Web application scripting language
  'go'     # Scripting language
  'go-tools'
  'python' # Scripting language
  'yarn'   # Dependency management (Hyper needs this)
  'ruby'

  # WEB TOOLS -----------------------------------------------------------

  'chromium'         # Web browser
  'firefox'          # Web browser
  'transmission-gtk' # Download torrent

  # COMMUNICATIONS ------------------------------------------------------

  # MEDIA ---------------------------------------------------------------

  'alsa-utils'  # Command line utilities for the ALSA project
  'pavucontrol' # Volume control tool
  'vlc'         # Video player
  'obs-studio'  # Record your screen
  'lollypop'    # Music player

  # GRAPHICS AND DESIGN -------------------------------------------------

  'gimp'        # GNU Image Manipulation Program
  'inkscape'    # Vector image creation app
  'imagemagick' # Command line image manipulation tool
  'pngcrush'    # Tools for optimizing PNG images
  'noto-fonts-emoji'
  'ttf-ubuntu-font-family'
  'ttf-dejavu'
  'ttf-droid'
  'ttf-inconsolata'
  'ttf-indic-otf'
  'ttf-liberation'
  'viewnior'

  # PRODUCTIVITY --------------------------------------------------------

  'libreoffice-still' # Libre office with extra features
  'nano'              # Nano simple text editor
  'evince'            # PDF viewer
  
  # BLUETOOTH --------------------------------------------------------
  'bluez'
  'bluez-utils'
  'blueman'
  #start app bluetooth systemctl start bluetooth.service
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
