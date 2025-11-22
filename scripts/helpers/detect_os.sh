#!/usr/bin/env bash

detect_os() {
  if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "macos"
  elif [[ -f /etc/arch-release ]]; then
    echo "arch"
  else
    echo -e "\033[0;31mError:\033[0m Unsupported operating system" >&2
    exit 1
  fi
}
