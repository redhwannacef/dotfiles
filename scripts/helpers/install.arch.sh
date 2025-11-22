#!/usr/bin/env bash

install_packages() {
  local pacakges=$1
  sudo pacman -S --noconfirm --needed "${packages[@]}"
}
