#!/usr/bin/env bash

link_config() {
  local src="$1"
  local dest="$2"

  if [ -e "$dest" ]; then
    echo "      - Skipping $dest (already exists)"
  else
    ln -s "$src" "$dest"
    echo "      - Linked $dest -> $src"
  fi
}
