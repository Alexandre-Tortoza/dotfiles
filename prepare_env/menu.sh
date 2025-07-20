#!/usr/bin/env bash

choose_from_menu() {
    local -r prompt="$1" outvar="$2" options=("${@:3}")
    local cur=0 count=${#options[@]} index=0
    local esc=$'\033'
    printf "$prompt\n"

    while true; do
        index=0
        for o in "${options[@]}"; do
            if [ "$index" -eq "$cur" ]; then
                echo -e " >\e[7m$o\e[0m"
            else
                echo "  $o"
            fi
            (( index++ ))
        done

        read -rsn3 key || break
        if [[ $key == "${esc}[A" ]]; then
            (( cur-- )); (( cur < 0 )) && cur=0
        elif [[ $key == "${esc}[B" ]]; then
            (( cur++ )); (( cur >= count )) && cur=$((count - 1))
        elif [[ $key == "" ]]; then
            break
        fi
        echo -en "\e[${count}A"
    done

    printf -v "$outvar" "${options[$cur]}"
}

options=(
    "  Link"
    " 󰱯 Instalação Básica"
    " 󰩈 Sair"
)

choose_from_menu "" escolha "${options[@]}"
clear

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

case "$escolha" in
    " 󰱯 Instalação Básica")
        echo -e "  Iniciando Instalação Básica "
        if ! command -v yay >/dev/null 2>&1; then
            bash "$DOTFILES/scripts/link_files.sh"
            bash "$DOTFILES/scripts/basic_install.sh"
        fi
        if ! command -v zsh >/dev/null 2>&1; then
          bash "$DOTFILES/scripts/zsh_install.sh"
          chsh -s /usr/bin/zsh
          exec zsh
        fi
        if ! command -v oh-my-posh >/dev/null 2>&1; then
          bash "$DOTFILES/scripts/oh-my-posh_install.sh"
        fi

        # cansei sem KO KKKKKKKKKKKKK

        # curl https://sh.rustup.rs -sSf | sh
        # rustup 

        # cargo install \
        #     bat exa procs ripgrep du-dust tokei ytop tealdeer grex rmesg zoxide git-delta fd-find


      yay -S --needed \
        # go nodejs npm pnpm \
        # neovim php btop curl wget \
        # python python-pip ruby gem\
        # go nodejs npm pnpm \
        # python python-pip \
        # ruby jdk-openjdk \
        # neovim yarn lazygit \
        # btop base-devel  \
        # curl wget httpie jq \
        # firefox

        # sudo npm install -g neovim
        # /bin/bash -c "$(curl -fsSL https://php.new/install/linux/8.4)"
        yay -S composer
        yay -S lua luarocks lua51
        yay -S julia

cargo install tree-sitter-cli


        composer global require laravel/installer
        # bash "$DOTFILES/checkhealth/basic_install.sh"
        ;;
    " 󰩈 Sair")
    clear;;
    "  Link")
        echo -e "  Iniciando Link de Arquivos "
        bash "$DOTFILES/scripts/link_files.sh"
        ;;
    *)
    clear
        echo -e " ERRO desconhecida. Encaminhando bug para o macaco QA.";;
esac
