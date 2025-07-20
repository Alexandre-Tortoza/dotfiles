#!/usr/bin/env bash
set -e

DOTFILES=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)


echo " Instalando dotfiles a partir de: $DOTFILES"

FILES_TO_SYMLINK=(
    "nvim"
)

for file in "${FILES_TO_SYMLINK[@]}"; do
    src="$DOTFILES/storage/$file"
    dest="$HOME/$(basename "$file")"

    if [ -e "$dest" ] || [ -L "$dest" ]; then
        echo "󰂭 Já existe: $dest — movendo pra backup"
        mv "$dest" "$dest.backup.$(date +%s)"
    fi

    echo " Linkando $src -> $dest"
    ln -s "$src" "$dest"
done

bash "$DOTFILES/modules/menu.sh"

echo "   Ambiente configurado. "
