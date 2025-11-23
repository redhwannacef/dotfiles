#!/usr/bin/env bash

packages() {
  echo "fish fzf zoxide rg eza fd lazygit lazydocker"
}

config_dir() {
  echo "fish"
}

setup() {
  fish -c "source ~/.config/fish/config.fish"
}
