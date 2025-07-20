#!/usr/bin/env bash
set -e
clear

echo -e "${GOLD}╭─༺───────────────────────────────────────────────────────────────༻─╮${NC}"
echo -e "${GOLD}│${NC}                                                            󰅟     ${GOLD}│${NC}"

# Verifica yay
if command -v yay >/dev/null 2>&1; then
  echo -e "${GOLD}│${NC}  ${GREEN} yay está instalado${NC}                                         ${GOLD}│${NC}"
else
  echo -e "${GOLD}│${NC}  ${RED} yay não está instalado${NC}                                     ${GOLD}│${NC}"
fi

# Verifica zsh
if command -v zsh >/dev/null 2>&1; then
  echo -e "${GOLD}│${NC}  ${GREEN} zsh está instalado${NC}                                           ${GOLD}│${NC}"
else
  echo -e "${GOLD}│${NC}  ${RED} zsh não está instalado${NC}                                     ${GOLD}│${NC}"
fi
# Verifica zsh
if command -v oh-my-posh >/dev/null 2>&1; then
  echo -e "${GOLD}│${NC}  ${GREEN} omp está instalado${NC}                                           ${GOLD}│${NC}"
else
  echo -e "${GOLD}│${NC}  ${RED} omp não está instalado${NC}                                           ${GOLD}│${NC}"
fi

# Rodapé bonito
echo -e "${GOLD}│${NC}                               󰅟                                ${GOLD}│${NC}"
echo -e "${GOLD}╰─༺───────────────────────────────────────────────────────────────༻─╯${NC}"
echo ""

# Exibe versão do yay se instalado
if command -v yay >/dev/null 2>&1; then
  echo "$(yay --version)"
  echo ""
fi
if command -v zsh >/dev/null 2>&1; then
  echo "$(zsh --version)"
  echo ""
fi
