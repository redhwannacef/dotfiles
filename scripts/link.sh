#!/usr/bin/env bash

# Safely link dotfiles from your repository to your home directory

# Link files/directories only if they don't already exist
_link_dotfile() {
  local src="$1"
  local dest="$2"

  if [ -e "$dest" ]; then
    echo "  - Skipping $dest (already exists)"
  else
    ln -s "$src" "$dest"
    echo "  - Linked $dest -> $src"
  fi
}

# Action functions
source_fish_config() {
  echo "    - Sourcing fish config..."
  fish -c "source ~/.config/fish/config.fish"
}

# Run post-link action if defined for this config
_run_post_link_action() {
  local config_name="$1"

  case "$config_name" in
    fish)
      source_fish_config
      ;;
  esac
}

link_dotfiles() {
  local dotfiles_dir="$1"

  echo "Linking dotfiles from $dotfiles_dir to $HOME"

  mkdir -p "$HOME/.config"

  for entry in "$dotfiles_dir/.config"/*; do
    config_name="$(basename "$entry")"
    _link_dotfile "$entry" "$HOME/.config/$config_name"
    _run_post_link_action "$config_name"
  done

  echo -e "Linking complete\n"
}
