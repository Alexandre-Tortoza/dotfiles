
#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"
source "$SCRIPT_DIR/colors.sh"
source "$SCRIPT_DIR/icons.sh"

OS=""
INSTALL_SCRIPT=""

detect_os() {
    uname_out="$(uname -s)"

    case "$uname_out" in
        Linux*)
            if [ -f /etc/os-release ]; then
                . /etc/os-release
                case "$ID" in
                    ubuntu|debian)
                        OS="debian"
                        INSTALL_SCRIPT="$SCRIPT_DIR/install/ubuntu.sh"
                        ;;
                    arch)
                        OS="arch"
                        INSTALL_SCRIPT="$SCRIPT_DIR/install/arch.sh"
                        ;;
                    fedora)
                esac
            fi
            ;;
        MINGW*|MSYS*|CYGWIN*)
            OS="windows"
            INSTALL_SCRIPT="$SCRIPT_DIR/install/windows.sh"
            ;;
        *)
            OS="unknown"
            ;;
    esac
}
clear
detect_os
echo -e "${COLOR_CYAN}Sistema: $OS${COLOR_RESET}"

if [ -z "$INSTALL_SCRIPT" ] || [ ! -f "$INSTALL_SCRIPT" ]; then
    echo -e "${COLOR_RED}$ICON_FAIL Sistema não suportado : $INSTALL_SCRIPT${COLOR_RESET}"
    exit 1
fi

echo -e "${COLOR_GREEN}$ICON_OK Executando: $INSTALL_SCRIPT${COLOR_RESET}"
bash "$INSTALL_SCRIPT"
