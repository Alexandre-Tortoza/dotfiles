export PATH=$PATH:/home/alexmrtr/.local/bin

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh)"
fi
eval "$(zoxide init zsh)"

alias cls='clear'
alias config-start='~/dotfiles/start.sh'

# === ALIASES NINJA === #

# 📖 bat — melhor que cat
alias cat='bat'                            # substitui cat por bat (com syntax highlight)
alias b='bat --paging=never --style=plain'

# 📁 exa — melhor que ls
alias ls='exa --icons'                     # exibe com ícones (requer Nerd Fonts)
alias ll='exa -lh --icons'                 # detalhes longos
alias la='exa -lha --icons'                # tudo, inclusive ocultos
alias lt='exa -T --icons'                  # modo árvore

# 🧠 procs — melhor que top/ps
alias ps='procs'                           # substitui ps
alias top='procs --watch'                 # top moderno

# 🔎 ripgrep — busca de texto bruta
alias rg='rg --smart-case'                # grep moderno e inteligente
alias rgi='rg --ignore-case'              # grep ignorando case

# 📊 du-dust — uso de disco (colorido e visual)
alias dus='dust'                          # visual bonito
alias dusl='dust -r -d 2'                 # mostra subpastas em 2 níveis

# 📈 tokei — contagem de linhas por linguagem
alias cloc='tokei'                        # cloc visual
alias tok='tokei -s lines'                # ordena por linhas

# 📊 ytop — monitoramento de sistema
alias sysmon='ytop'                       # top visual

# 🧙 tealdeer — tldr mais rápido
alias tldr='tealdeer'                     # resumo de comandos
alias tldri='tealdeer --show-instructions' # inclui instruções

# 🔥 grex — gera regex a partir de strings
alias mkregex='grex'                      # transforma exemplo em regex

# 🧾 rmesg — logs do kernel bonito
alias klog='rmesg'                        # logs do kernel coloridos

# 🧭 zoxide — navegação inteligente
# alias cd='z'                              # substitui cd
alias j='zoxide query'                    # consulta
alias zi='zoxide init zsh'                # init zsh (pode deixar no .zshrc)

# 🧪 delta — diff visual
alias diff='delta'                        # substitui diff por delta
alias gdiff='git diff | delta'            # git diff com highlight

# 🔍 fd — melhor que find
alias f='fd'                              # substitui find
alias fdir='fd --type d'                  # só diretórios
alias ff='fd --type f'                    # só arquivos

eval "$(oh-my-posh init zsh --config '~/omp-themes/pure.omp.json')"
# eval "$(oh-my-posh init zsh --config '~/omp-themes/emodipt-extend.omp.json')"
# eval "$(oh-my-posh init zsh --config '~/omp-themes/negligible.omp.json')"
# eval "$(oh-my-posh init zsh --config '~/omp-themes/nordtron.omp.json')"
# eval "$(oh-my-posh init zsh --config '~/omp-themes/powerlevel10k_lean.omp.json')"
# eval "$(oh-my-posh init zsh --config '~/omp-themes/the-unnamed.omp.json')"

source ~/dotfiles/storage/zsh/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

export PATH="/home/alexmrtr/.config/herd-lite/bin:$PATH"

export PHP_INI_SCAN_DIR="/home/alexmrtr/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"
