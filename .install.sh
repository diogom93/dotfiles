#!/bin/bash

# ANSI color code for green and red
GREEN='\033[0;32m'
RED='\033[0;31m'
# Reset color
NC='\033[0m'
# Unicode icons
CHECKMARK="\xE2\x9C\x94"
CROSS="\xE2\x9C\x98"
BULLET="\xE2\x80\xA3"

print_valid_message() {
  echo -e "${GREEN}${CHECKMARK}${NC} $1"
}

print_error_message() {
  echo -e "${RED}${CROSS}${NC} $1"
}

print_bullet_message() {
  echo -e "${BULLET} $1"
}

spinner() {
  local condition_check="$1"
  local message="$2"
  local delay=0.05
  local spinchars='|/-\'

  # Start the spinner in the background
  while "$condition_check"; do
    for i in $(seq 0 ${#spinchars}); do
      echo -e -n " ${spinchars:$i:1}" "\r"
      sleep $delay
    done
  done
  echo " " # Clear the spinner
}

# Thanks to github.com/dive
install_macports() {
  TEMP_PKG="$(mktemp -t macports).pkg"
  _MACPORTS_LATEST_VERSION="$(curl --silent --url https://raw.githubusercontent.com/macports/macports-base/master/config/RELEASE_URL)"
  MACPORTS_LATEST_VERSION="${_MACPORTS_LATEST_VERSION##*/v}"
  MACOS_VERSION="$(sw_vers -productVersion)"
  MACOS_PRODUCT_VERSION="$(cut -d '.' -f 1 <<< "${MACOS_VERSION}")"
  MACPORTS_DOWNLOAD_URL="https://distfiles.macports.org/MacPorts/MacPorts-${MACPORTS_LATEST_VERSION}-${MACOS_PRODUCT_VERSION}-Sequoia.pkg"
  print_bullet_message "Downloading MacPorts..."
  
  curl --output "${TEMP_PKG}" --remote-name "${MACPORTS_DOWNLOAD_URL}" &> /dev/null

  print_valid_message "MacPorts downloaded"

  sudo installer -pkg "${TEMP_PKG}" -target /

  rm -f "${TEMP_PKG}"
}

install_ports() {
  while read -r port; do
    if port installed requested | grep -q $port; then
      print_valid_message "$port is already installed"
      continue
    fi
    print_bullet_message "Installing $port..."
    sudo port install $port
  done < $PORTS_FILE
}

# Check if Xcode is installed
if [ -d /Applications/Xcode.app ]; then
  print_valid_message "Xcode is installed"
else
  print_error_message "Xcode is not installed"
  exit 1
fi

# Check if Xcode Command Line Tools are installed
COMMAND_LINE_TOOLS_DIR="/Library/Developer/CommandLineTools"
if [ -d $COMMAND_LINE_TOOLS_DIR ]; then
  print_valid_message "Xcode Command Line Tools are installed"
else
  print_error_message "Xcode Command Line Tools are not installed"
  xcode-select --install &> /dev/null
  print_bullet_message "Installing Xcode Command Line Tools..."
  spinner "eval [ ! -d '$COMMAND_LINE_TOOLS_DIR' ]" 
  print_valid_message "Xcode Command Line Tools are installed"
fi

# Check if antidote is installed
if [ -d ~/.antidote ]; then
  print_valid_message "Antidote is installed"
else
  print_error_message "Antidote is not installed"
  print_bullet_message "Installing Antidote..."
  git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote
fi

# Check if MacPorts is installed
if  command -v port &> /dev/null; then
  print_valid_message "MacPorts is installed"
else
  print_error_message "MacPorts is not installed"
  install_macports
fi

# Check if we have a ports list
PORTS_FILE="$HOME/.dotfiles/.config/macports/ports.txt"
if [ -e $PORTS_FILE ]; then
  print_valid_message "Ports list found"
  print_bullet_message "Let's install some ports..."
  install_ports
  print_valid_message "All ports installed"
else
  print_error_message "Ports list not found"
  exit 1
fi

# Stow dotfiles
print_bullet_message "Stowing dotfiles..."
stow -t $HOME -d $HOME/.dotfiles .
print_valid_message "Dotfiles stowed"
