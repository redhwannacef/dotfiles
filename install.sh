#!/usr/bin/env bash

set -euo pipefail

REPO_URL="https://github.com/redhwannacef/dotfiles.git"
INSTALL_DIR="${INSTALL_DIR:-$HOME/.local/share/redhwans-dotfiles}"

detect_os() {
  if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "macos"
  elif [[ -f /etc/arch-release ]]; then
    echo "arch"
  else
    echo -e "\033[0;31mError:\033[0m Unsupported operating system"
    exit 1
  fi
}

install_package_manager() {
  local os=$1

  if [[ "$os" == "macos" ]]; then
    echo "  - Checking for Homebrew"
    if ! command -v brew &>/dev/null; then
      echo "    - Homebrew is not installed. Installing..."
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      echo -e "    - Homebrew installed successfully"
    else
      echo -e "    - Homebrew is already installed"
    fi
  elif [[ "$os" == "arch" ]]; then
    echo "  - Refreshing pacman repositories"
    sudo pacman -Syu --noconfirm
  fi
}

install_git() {
  local os=$1

  echo "  - Checking for git"
  if ! command -v git &>/dev/null; then
    echo "    - git is not installed. Installing..."
    if [[ "$os" == "macos" ]]; then
      brew install git
    elif [[ "$os" == "arch" ]]; then
      sudo pacman -S --noconfirm git
    fi
    echo -e "    - git installed successfully"
  else
    echo -e "    - git is already installed"
  fi
}

echo -e "Installing Redhwan's dotfiles to $INSTALL_DIR"

OS=$(detect_os)
install_package_manager "$OS"
install_git "$OS"

# Check if the directory already exists
if [ -e "$INSTALL_DIR" ]; then
  echo -e "\033[0;31mError:\033[0m Installation directory already exists: $INSTALL_DIR"
  echo "Please remove it first or set a INSTALL_DIR env var to a different location"
  exit 1
fi

# Create parent directory if needed
mkdir -p "$(dirname "$INSTALL_DIR")"

echo "  - Cloning repository from $REPO_URL"
git clone --quiet "$REPO_URL" "$INSTALL_DIR"
echo -e "    - Repository cloned successfully"
echo -e "Install Complete. Running setup script... \n"

cd "$INSTALL_DIR"
bash scripts/setup.sh
