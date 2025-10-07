#!/usr/bin/env bash

# Safely link dotfiles from your repository to your home directory

# Link files/directories only if they don't already exist
link_dotfile() {
  local src="$1"
  local dest="$2"

  if [ -e "$dest" ]; then
    echo "  - Skipping $dest (already exists)"
  else
    ln -s "$src" "$dest"
    echo "  - Linked $dest -> $src"
  fi
}

link_dotfiles() {
  local dotfiles_dir="$1"

  echo "Linking dotfiles from $dotfiles_dir to $HOME"

  mkdir -p "$HOME/.config"

  for entry in "$dotfiles_dir/.config"/*; do
    link_dotfile "$entry" "$HOME/.config/$(basename "$entry")"
  done

  echo -e "Linking complete\n"
}
