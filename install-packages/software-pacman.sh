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
  'bzip2'
  'cantarell-fonts'
  'coreutils'
  'cryptsetup'
  'device-mapper'
  'diffutils'
  'e2fsprogs'
  'ffmpeg'
  'filesystem'
  'flac'
  'gcc-libs'
  'glibc'
  'gstreamer'
  'iproute2'
  'iputils'
  'licenses'
  'mobile-broadband-provider-info'
  'openssh'
  'pciutils'
  'perl'
  'procps-ng'
  'psmisc'
  'shadow'
  'sysfsutils'
  'systemd'
  'systemd-sysvcompat'
  'util-linux'
  'wpa_supplicant'
  'xf86-input-libinput'
  'xorg-xprop'
  'xz'
  'archlinux-keyring'
  'autoconf'
  'automake'
  'avahi'
  'bison'
  'debugedit'
  'dmenu'
  'efibootmgr'
  'fakeroot'
  'file'
  'findutils'
  'firefox'
  'flex'
  'gawk'
  'gcc'
  'gettext'
  'grep'
  'groff'
  'gst-plugin-pipewire'
  'gzip'
  'htop'
  'i3-wm'
  'i3blocks'
  'i3lock'
  'i3status'
  'intel-media-driver'
  'intel-ucode'
  'iwd'
  'libpulse'
  'libtool'
  'libva-intel-driver'
  'lightdm'
  'lightdm-gtk-greeter'
  'linux-firmware'
  'linux-lts'
  'm4'
  'make'
  'nano'
  'network-manager-applet'
  'networkmanager'
  'pacman'
  'patch'
  'pipewire'
  'pipewire-alsa'
  'pipewire-jack'
  'pipewire-pulse'
  'pkgconf'
  'sed'
  'smartmontools'
  'sudo'
  'texinfo'
  'vim'
  'vulkan-intel'
  'wget'
  'which'
  'wireless_tools'
  'wireplumber'
  'xdg-utils'
  'xorg-server'
  'xorg-xinit'
  'xorg-xbacklight'
  'xterm'
  'zram-generator'

  # SYSTEM --------------------------------------------------------------
  'xcompmgr' # Primitive window transparency (zoom draw scree)
  'intel-gpu-tools'
  'brightnessctl'       # Screen brightness control
  'lm_sensors'          # Sensors hardware
  'lxappearance'        #set theme GTK
  'arc-solid-gtk-theme' #theme GTK
  'tree'
  'arandr'
  'pkgfile'

  # TERMINAL UTILITIES --------------------------------------------------

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
  #'rsync'                 # Remote file sync utility

  # DISK UTILITIES ------------------------------------------------------

  'ntfs-3g'    # Open source implementation of NTFS file system
  'dosfstools' #
  'os-prober'  #
  'mtools'     #

  # GENERAL UTILITIES ---------------------------------------------------

  'scrot'   # Screen capture.
  'rofi'    # Application launcher
  'thunar'  # Filesystem browser
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

  # PRODUCTIVITY --------------------------------------------------------

  'libreoffice-still' # Libre office with extra features
  'nano'              # Nano simple text editor
  'evince'            # PDF viewer

  # OTHER

  'accountsservice'
  'acpi'
  'acpid'
  'alsa-firmware'
  'alsa-plugins'
  'blueman'
  'bluez-utils'
  'cpupower'
  'cronie'
  'deluge'
  'dfc'
  'dhclient'
  'dhcpcd'
  'dmidecode'
  'dnsmasq'
  'ecryptfs-utils'
  'exfatprogs'
  'f2fs-tools'
  'ffmpegthumbnailer'
  'gcolor2'
  'gparted'
  'gst-libav'
  'gst-plugins-bad'
  'gst-plugins-base'
  'gst-plugins-good'
  'gst-plugins-ugly'
  'gufw'
  'gvfs-afc'
  'gvfs-gphoto2'
  'gvfs-mtp'
  'gvfs-smb'
  'haveged'
  'hexchat'
  'inetutils'
  'jfsutils'
  'lib32-flex'
  'lib32-mesa-demos'
  'libdvdcss'
  'libgpod'
  'lightdm-slick-greeter'
  'logrotate'
  'lxinput'
  'man-pages'
  'memtest86+'
  'mesa-demos'
  'mlocate'
  'moc'
  'modemmanager'
  'ncdu'
  'netctl'
  'networkmanager-openconnect'
  'networkmanager-openvpn'
  'networkmanager-pptp'
  'networkmanager-vpnc'
  'nfs-utils'
  'nss-mdns'
  'ntp'
  'open-vm-tools'
  'openresolv'
  'p7zip'
  'patchutils'
  'perl-file-mimeinfo'
  'polkit-gnome'
  'powertop'
  'upower'
  'qemu-guest-agent'
  'reiserfsprogs'
  'rsync'
  's-nail'
  'sof-firmware'
  'subversion'
  'syslog-ng'
  'terminus-font'
  'usbutils'
  'viewnior'
  'volumeicon'
  'w3m'
  'wireless-regdb'
  'xautolock'
  'xdg-user-dirs'
  'xdotool'
  'xf86-input-elographics'
  'xf86-input-evdev'
  'xf86-input-vmmouse'
  'xf86-input-void'
  'xorg-twm'
  'xorg-xhost'
  'xorg-xkill'
  'ruby'
  'btrfs-progs'
  'dmraid'
  'gtkmm3'
  'gvfs'
  'lvm2'
  'mdadm'
  'poppler-data'
  'xf86-video-vmware'
  'xfsprogs'
)

PKGS_WITH_CONFIRM=(

  # VIRTUALIZATION ------------------------------------------------------

  'virtualbox'
  'virtualbox-guest-utils'
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
