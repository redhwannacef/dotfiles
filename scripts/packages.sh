#!/usr/bin/env bash

setup_packages() {
  local dotfiles_dir=$1
  local config_dir=$2
  local os=$3

  source "$dotfiles_dir/scripts/helpers/install.${os}.sh"
  source "$dotfiles_dir/scripts/helpers/link.sh"
  source "$dotfiles_dir/scripts/helpers/run_hook.sh"

  echo -e "Configuring packages from $dotfiles_dir\n"

  for entry in "$dotfiles_dir/packages"/*; do
    (
      source "$entry"
      config_name="$(basename "$entry")"
      echo "  Configuring package: $config_name"

      run_hook \
        "    - Installing packages: $(packages)" \
        install_packages "$(packages)"

      run_hook \
        "    - Linking Config: $(packages)" \
        link_config "$dotfiles_dir/.config/$(config_dir)" "$config_dir/$(config_dir)"

      run_hook \
        "    - Running setup for $config_name" \
        setup "$config_dir"

      echo
    )
  done

  echo -e "Configuring packages complete\n"

}
