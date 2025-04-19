#!/bin/bash

# ANSI color codes
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # Reset
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
  local pid=$1
  local delay=0.1
  local spinchars='|/-\'

  while kill -0 "$pid" &>/dev/null; do
    for ((i = 0; i < ${#spinchars}; i++)); do
      echo -ne " ${spinchars:i:1}" "\r"
      sleep "$delay"
    done
  done
}

install_macports() {
  local temp_pkg
  temp_pkg=$(mktemp).pkg
  trap 'rm -f "$temp_pkg"' EXIT

  local latest_version
  latest_version=$(curl --silent "https://raw.githubusercontent.com/macports/macports-base/master/config/RELEASE_URL" | awk -F '/' '{print $NF}' | sed 's/v//')
  local macos_version
  macos_version=$(sw_vers -productVersion | cut -d '.' -f 1)
  local download_url="https://distfiles.macports.org/MacPorts/MacPorts-${latest_version}-${macos_version}-Sequoia.pkg"

  print_bullet_message "Downloading MacPorts..."
  curl --fail --output "$temp_pkg" "$download_url" || {
    print_error_message "Failed to download MacPorts."
    exit 1
  }
  print_valid_message "MacPorts downloaded."

  print_bullet_message "Installing MacPorts..."
  sudo installer -pkg "$temp_pkg" -target / || {
    print_error_message "Failed to install MacPorts."
    exit 1
  }
  rm -f "$temp_pkg"

  print_bullet_message "Adding MacPorts to PATH..."
  export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
  print_valid_message "MacPorts installed successfully."
}

install_ports() {
  while IFS= read -r port; do
    if port installed requested | grep -q "$port"; then
      print_valid_message "$port is already installed"
    else
      print_bullet_message "Installing $port..."
      sudo port install "$port" || {
        print_error_message "Failed to install $port."
        continue
      }
    fi
  done < "$PORTS_FILE"
}

stow_dotfiles() {
  local dotfiles_dir="$HOME/.dotfiles"
  
  if [[ ! -d $dotfiles_dir ]]; then
    print_error_message "Dotfiles directory not found at $dotfiles_dir."
    exit 1
  fi

  print_bullet_message "Stowing dotfiles from $dotfiles_dir..."
  
  for folder in "$dotfiles_dir"/*/; do
    folder_name=$(basename "$folder")
    print_bullet_message "Processing $folder_name..."
    
    if stow -t "$HOME" -d "$dotfiles_dir" "$folder_name"; then
      print_valid_message "$folder_name stowed successfully."
    else
      print_error_message "Failed to stow $folder_name."
    fi
  done

  print_valid_message "All stowable dotfiles processed."
}

main() {
  # Check for Xcode
  if [[ -d /Applications/Xcode.app ]]; then
    print_valid_message "Xcode is installed."
  else
    print_error_message "Xcode is not installed."
    exit 1
  fi

  # Check for Command Line Tools
  local command_line_tools_dir="/Library/Developer/CommandLineTools"
  if [[ -d $command_line_tools_dir ]]; then
    print_valid_message "Xcode Command Line Tools are installed."
  else
    print_error_message "Xcode Command Line Tools are not installed."
    print_bullet_message "Installing Command Line Tools..."
    xcode-select --install &>/dev/null &
    spinner $!
    print_valid_message "Command Line Tools installed."
  fi

  # Check for Antidote
  if [[ -d ~/.antidote ]]; then
    print_valid_message "Antidote is installed."
  else
    print_error_message "Antidote is not installed."
    print_bullet_message "Installing Antidote..."
    git clone --depth=1 https://github.com/mattmc3/antidote.git "${ZDOTDIR:-$HOME}/.antidote" || {
      print_error_message "Failed to install Antidote."
      exit 1
    }
    print_valid_message "Antidote installed."
  fi

  # Check for MacPorts
  if command -v port &>/dev/null; then
    print_valid_message "MacPorts is installed."
  else
    print_error_message "MacPorts is not installed."
    install_macports
  fi

  # Ports file check
  PORTS_FILE="$HOME/.dotfiles/macports/.config/macports/ports.txt"
  if [[ -f $PORTS_FILE ]]; then
    print_valid_message "Ports list found."
    print_bullet_message "Installing ports..."
    install_ports
    print_valid_message "All ports installed."
  else
    print_error_message "Ports list not found."
    exit 1
  fi

  # Stow dotfiles
  stow_dotfiles
}

main "$@"
