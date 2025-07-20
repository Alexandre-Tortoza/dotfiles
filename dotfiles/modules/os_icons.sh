
#!/usr/bin/env bash

get_os_icon() {
    local os="$(uname -s)"

    case "$os" in
        Linux*)     echo "$(get_linux_distro_icon)" ;;
        CYGWIN*|MINGW*|MSYS*) echo "" ;;
        *)          echo "Se tá a onde cara ?" ;;
    esac
}

get_linux_distro_icon() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        case "$ID" in
            ubuntu) echo "󰕈" ;;
            arch)   echo "" ;;
            *)      echo "🐧" ;;
        esac
    else
        echo "🐧"
    fi
}
