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

AUR_URL="https://aur.archlinux.org"
AUR_DIR="$HOME/aur"

function validate_package_not_empty {
  [ -z "$1" ] && echo "you haven't provided a package name!" && exit
}

function validate_package_exists_on_aur {
  output=$(curl "$AUR_URL/cgit/aur.git/plain/PKGBUILD?h=$1" -s)
  [[ $output == *"Invalid branch"* ]] && echo "package $1 does not exist on aur" && exit
}

function validate_package_is_fetched {
  [ ! -d "$AUR_DIR/$1" ] && echo "package is not fetched!" && exit
}

function validate_package_has_pkgbuild {
  [ ! -f "$AUR_DIR/$1/PKGBUILD" ] && echo "PKBUILD was not found in fetched directory" && exit
}

function help {
  echo "
       usage:

       help      shows help
       install   installs a package
       update    update a package
       remove    removes installed package via pacman
       "
}

function fetch {
  validate_package_not_empty $1
  validate_package_exists_on_aur $1
  echo "fetching the package $1"
  rm -rf "$AUR_DIR/$1" || true
  mkdir -p "$AUR_DIR/$1"
  git clone "$AUR_URL/$1.git" "$AUR_DIR/$1"
  validate_package_has_pkgbuild $1
  echo "done"
}

function install {
  if pacman -Q "$1" &>/dev/null; then
    echo -e "${GREEN}Package [$1] already installed${NO_COLOR}"
    exit
  fi
  fetch $1
  validate_package_not_empty $1
  validate_package_is_fetched $1
  echo "installing package $1"
  cd "$AUR_DIR/$1"
  makepkg -si
  cd -
  echo "$1 installed"
  echo "done"
  return 0
}

function update {
  validate_package_not_empty $1
  validate_package_exists_on_aur $1
  validate_package_is_fetched $1
  echo -e "${GREEN}update the package $1${NO_COLOR}"
  cd "$AUR_DIR/$1"
  result=$(git pull)
  echo $result
  if [[ $result = "Already up to date." ]]; then
    exit
  fi
  validate_package_has_pkgbuild $1
  makepkg -si
  echo "done"
  return 0
}

function remove {
  validate_package_not_empty $1
  echo "removing $1"
  sudo pacman -Rns $1 && exit
  echo "cleaning installation files"
  validate_package_is_fetched $1
  rm -rf "$AUR_DIR/$1" || true
  echo "done"
  return 0
}

function main {
  isUpdate=0
  [ -z "$1" ] || [ "$1" = "help" ] && help && exit
  [ "$1" = "install" ] && install $2 && exit
  [ "$1" = "remove" ] && remove $2 && exit
  [ "$1" = "update" ] && update $2 && exit
  echo "wrong argument: $1"
}

function check-folder {
  if [[ $(basename $PWD) != "install-packages" ]]; then
    echo -e "${RED}Run the script inside your folder${NO_COLOR}"
    exit
  fi
}

check-folder

main "$@"
