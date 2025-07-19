
#!/usr/bin/env bash
set -e

source "$(dirname "${BASH_SOURCE[0]}")/colors.sh"
source "$(dirname "${BASH_SOURCE[0]}")/icons.sh"

print_check() {
    local name="$1"
    local cmd="$2"
    local version_flag="${3:---version}"
    local extra_check="$4"

    if command -v "$cmd" >/dev/null 2>&1; then
        local version_output="$($cmd $version_flag 2>/dev/null | head -n 1)"
        echo -e "${COLOR_GREEN}${ICON_OK} $name encontrado: $version_output${COLOR_RESET}"
        if [ -n "$extra_check" ]; then
            eval "$extra_check"
        fi
    else
        echo -e "${COLOR_RED}${ICON_FAIL} $name não encontrado${COLOR_RESET}"
    fi
}

clear
echo -e "${COLOR_BLUE}\n$ICON_INFO Verificando ambiente de desenvolvimento...\n${COLOR_RESET}"

# Ferramentas básicas
print_check "Go" "go"
print_check "Rust" "rustc"
print_check "Cargo" "cargo"
print_check "Neovim" "nvim" "--version"
print_check "Lua" "lua"
print_check "Luarocks" "luarocks"
print_check "Node.js" "node"
print_check "npm" "npm"
print_check "Yarn" "yarn"
print_check "Docker" "docker"
print_check "Git" "git"

# Ferramentas Rust instaladas com cargo
echo -e "${COLOR_BLUE}\n Verificando ferramentas Rust instaladas...\n${COLOR_RESET}"

rust_tools=(
    bat
    btm
    exa
    grex
    procs
    rmesg
    tldr
    tokei
    tree-sitter
    ytop
    zoxide
)

for tool in "${rust_tools[@]}"; do
    if command -v "$tool" >/dev/null 2>&1; then
        version="$($tool --version 2>/dev/null | head -n 1)"
        echo -e "${COLOR_GREEN}${ICON_OK} $tool instalado: $version${COLOR_RESET}"
    else
        echo -e "${COLOR_RED}${ICON_FAIL} $tool não encontrado${COLOR_RESET}"
    fi
done

echo -e "${COLOR_YELLOW}\n$ICON_DONE Verificação concluída.${COLOR_RESET}\n"

