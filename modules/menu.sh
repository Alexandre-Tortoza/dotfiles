
#!/usr/bin/env bash
set -e

TIMEOUT=10

while true; do
  cat <<EOF

󰅬 Rodar mais alguma etapa? ($TIMEOUT segundos)

  [1] –> Checkhealth
  [2] –> Instalar dependências
  [0] –> Sair sem rodar mais nada

EOF

  read -t $TIMEOUT -n1 -p "󰫣 Opção: " CHOICE
  echo

  if [ -z "$CHOICE" ]; then
    echo " Timeout de $TIMEOUT s atingido. Até mais!"
    exit 0
  fi

  case "$CHOICE" in
    1)
      echo " Rodando Checkhealth…"
      bash "$(dirname "${BASH_SOURCE[0]}")/checkhealth.sh"
      ;;
    2)
      echo "󰏗 Instalando dependências…"
      bash "$(dirname "${BASH_SOURCE[0]}")/install_deps.sh"
      ;;
    0)
      echo "👋 Saindo. Tudo certo por aqui!"
      exit 0
      ;;
    *)
      echo " Opção inválida: “$CHOICE”. Tenta de novo\n\n primata !"
      ;;
  esac
done

