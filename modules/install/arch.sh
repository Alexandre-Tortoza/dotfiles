
#!/usr/bin/env bash
set -e

# Cores e ícones
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../colors.sh"
source "$SCRIPT_DIR/../icons.sh"

# Lista de pacotes obrigatórios para desenvolvimento
PACMAN_PKGS=(
    base-devel
    git
    curl
    wget
    unzip
    neovim
    nodejs
    npm
    go
    lua
    luarocks
    ripgrep
    fd
    zsh
    xclip
)

echo -e "${COLOR_BLUE}$ICON_INFO Verificando pacotes com pacman...${COLOR_RESET}"

for pkg in "${PACMAN_PKGS[@]}"; do
    if pacman -Q "$pkg" &>/dev/null; then
        echo -e "${COLOR_GREEN}$ICON_OK $pkg já instalado${COLOR_RESET}"
    else
        echo -e "${COLOR_YELLOW}$ICON_ARROW Instalando $pkg...${COLOR_RESET}"
        sudo pacman -S --noconfirm "$pkg"
    fi
done

echo -e "${COLOR_GREEN}$ICON_DONE Todos os pacotes foram verificados e instalados.${COLOR_RESET}"
