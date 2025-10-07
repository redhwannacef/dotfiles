#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$DOTFILES_DIR/scripts/art.sh"
source "$DOTFILES_DIR/scripts/link.sh"

log_art
link_dotfiles "$DOTFILES_DIR"
