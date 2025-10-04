#!/usr/bin/env bash

# Safely link dotfiles from your repository to your home directory

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Linking dotfiles from $DOTFILES_DIR to $HOME"

# Link files/directories only if they don't already exist
link_dotfile() {
  local src="$1"
  local dest="$2"

  if [ -e "$dest" ]; then
    echo "Skipping $dest (already exists)"
  else
    ln -s "$src" "$dest"
    echo "Linked $dest -> $src"
  fi
}

mkdir -p "$HOME/.config"

for entry in "$DOTFILES_DIR/.config"/*; do
  link_dotfile "$entry" "$HOME/.config/$(basename "$entry")"
done

echo "Linking complete"
