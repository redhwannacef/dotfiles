#!/usr/bin/env bash

packages() {
  echo "git"
}

config_dir() {
  echo "git"
}

setup() {
  local config_dir="$1"
  local user_config_file="$config_dir/git/user-config"

  # The ANSI escape codes are used to move the cursor up and clear the line so that it shows the entered value
  read -p "      - Enter your Git name (optional): " git_name
  echo -ne "\033[1A\033[2K\r      - Enter your Git name (optional): $git_name\n"
  read -p "      - Enter your Git email (optional): " git_email
  echo -ne "\033[1A\033[2K\r      - Enter your Git email (optional): $git_email\n"

  if [ -z "$git_name" ] && [ -z "$git_email" ]; then
    echo -e "      - Skipping git user configuration"
    return 0
  fi

  echo "[user]" >"$user_config_file"

  if [ -n "$git_name" ]; then
    echo "	name = $git_name" >>"$user_config_file"
  fi

  if [ -n "$git_email" ]; then
    echo "	email = $git_email" >>"$user_config_file"
  fi
}
