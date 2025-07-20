#!/bin/bash

set -e
set -u

echo "  Iniciando Link de Arquivos "

DOTFILES=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
STORAGE="$(cd "$DOTFILES/../../storage" && pwd)"

rm -rf $HOME/.zshrc
ln -s $STORAGE/zsh/.zshrc $HOME/.zshrc

rm -rf $HOME/.zsh
ln -s $STORAGE/zsh/.zsh $HOME/.zsh

rm -rf $HOME/omp-themes
ln -s $STORAGE/omp-themes $HOME/omp-themes

rm -rf $HOME/.config/nvim
ln -s $STORAGE/nvim $HOME/.config/nvim
