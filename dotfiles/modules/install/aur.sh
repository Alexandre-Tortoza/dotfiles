#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/../colors.sh"
source "$SCRIPT_DIR/../icons.sh"

AUR_PKGS=(
  bottom
  tealdeer
  procs
  ytop
  grex
  rmesg
  ascii-image-converter-git
)

echo -e "${COLOR_BLUE}${ICON_INFO} Verificando pacotes AUR...${COLOR_RESET}"

# Verifica se o yay está disponível
if ! command -v yay &>/dev/null; then
  echo -e "${COLOR_RED}${ICON_FAIL} 'yay' não encontrado.${COLOR_RESET}"
  echo -e "${COLOR_YELLOW}${ICON_ARROW} Para instalar o yay manualmente:${COLOR_RESET}"
  echo -e "  git clone https://aur.archlinux.org/yay.git"
  echo -e "  cd yay && makepkg -si"
  exit 1
fi

# Instala pacotes AUR com yay
for pkg in "${AUR_PKGS[@]}"; do
  if yay -Q "$pkg" &>/dev/null; then
    echo -e "${COLOR_GREEN}${ICON_OK} $pkg já instalado (via yay)${COLOR_RESET}"
  else
    echo -e "${COLOR_YELLOW}${ICON_ARROW} Instalando $pkg via yay...${COLOR_RESET}"
    yay -S --noconfirm "$pkg"
  fi
done

echo -e "${COLOR_GREEN}${ICON_DONE} Todos os pacotes AUR foram verificados e instalados.${COLOR_RESET}"

