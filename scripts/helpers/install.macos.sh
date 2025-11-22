#!/usr/bin/env bash

install_packages() {
  local packages=$1
  local missing_packages=()

  for package in $packages; do
    if ! command -v "$package" >/dev/null 2>&1; then
      missing_packages+=("$package")
    fi
  done

  if [ ${#missing_packages[@]} -gt 0 ]; then
    brew install "${missing_packages[@]}" --quiet >/dev/null 2>&1
  fi
}
