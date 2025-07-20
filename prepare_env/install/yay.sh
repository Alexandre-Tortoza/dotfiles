#!/usr/bin/env bash
set -e

echo "DOTFILES está em: $DOTFILES"

sudo pacman -S --needed git base-devel

git clone https://aur.archlinux.org/yay.git "$DOTFILES/yay"
cd "$DOTFILES/temp/yay"
makepkg -si