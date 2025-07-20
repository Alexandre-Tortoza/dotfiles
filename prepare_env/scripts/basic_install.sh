#!/usr/bin/env bash
set -euo pipefail

DOTFILES=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
TEMP_DIR=$(mktemp -d -t TEMP-XXX  )


trap 'rm -rf "$TEMP_DIR"' EXIT INT TERM
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git "$TEMP_DIR/yay/"
cd "$TEMP_DIR/yay"
makepkg -si
sudo yay -S --needed --noconfirm unzip 
yay

