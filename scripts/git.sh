#!/usr/bin/env bash

# Configure git user settings

setup_git_user() {
  local git_config_dir="$HOME/.config/git"
  local user_config_file="$git_config_dir/user-config"

  echo "Setting up Git user configuration"

  read -p "  - Enter your Git name (optional): " git_name
  read -p "  - Enter your Git email (optional): " git_email

  if [ -z "$git_name" ] && [ -z "$git_email" ]; then
    echo "  - Skipping git user configuration"
    return 0
  fi

  echo "[user]" >"$user_config_file"

  if [ -n "$git_name" ]; then
    echo "	name = $git_name" >>"$user_config_file"
  fi

  if [ -n "$git_email" ]; then
    echo "	email = $git_email" >>"$user_config_file"
  fi

  echo -e "Git setup complete\n"
}
