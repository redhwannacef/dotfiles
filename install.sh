#!/usr/bin/env bash

set -euo pipefail

REPO_URL="https://github.com/redhwannacef/dotfiles.git"
INSTALL_DIR="${INSTALL_DIR:-$HOME/.local/share/redhwans-dotfiles}"

echo "Installing Redhwan's dotfiles..."
echo -e "Target directory: $INSTALL_DIR\n"

# Check if git is installed
if ! command -v git &>/dev/null; then
  echo -e "\033[0;31mError:\033[0m git is not installed. Please install git first."
  exit 1
fi

# Check if the directory already exists
if [ -e "$INSTALL_DIR" ]; then
  echo -e "\033[0;31mError:\033[0m Installation directory already exists: $INSTALL_DIR"
  echo "Please remove it first or set a INSTALL_DIR env var to a different location."
  exit 1
fi

# Create parent directory if needed
mkdir -p "$(dirname "$INSTALL_DIR")"

# Clone the repository
echo "Cloning repository from $REPO_URL..."
git clone --quiet "$REPO_URL" "$INSTALL_DIR"
echo -e "Repository cloned successfully!\n"

# Run the setup script
echo -e "Running setup script...\n"

cd "$INSTALL_DIR"
bash setup.sh --skip-banner
