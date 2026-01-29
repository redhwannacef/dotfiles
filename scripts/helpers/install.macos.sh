#!/usr/bin/env bash

install_packages() {
  local packages=$1
  local missing_packages=()
  local existing_packages=()

  for package in $packages; do
    if ! command -v "$package" >/dev/null 2>&1; then
      missing_packages+=("$package")
    else
      existing_packages+=("$package")
    fi
  done

  if [ ${#existing_packages[@]} -gt 0 ]; then
    echo "      - Skipping packages: ${existing_packages[*]} (already exists)"
  fi

  if [ ${#missing_packages[@]} -gt 0 ]; then
    echo "      - Installing packages: ${missing_packages[*]}"
    brew install "${missing_packages[@]}" --quiet >/dev/null 2>&1
  fi
}
