# Shortcuts
alias g='git'        # Git
alias k='kubectl'    # Kubernetes
alias d='docker'     # Docker
alias c='clear'      # Clear screen

# Docker Compose
alias up='docker compose up'
alias down='docker compose down'
alias build='docker compose build'
alias logs='docker compose logs --follow'

# Git – pretty graph
alias glog="git log --graph --pretty=format:'%C(yellow)%h%C(reset) -%C(auto)%d%C(reset) %s %C(green)(%cr)%C(reset)'"

# Modern ls (only if eza is installed)
if command -v eza >/dev/null; then
  alias ls='eza --group-directories-first'
  alias ll='ls -la'
  alias l='ls -1'
fi

# -------- Keybindings --------------------------------------
autoload -U up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

bindkey '^O' clear-screen                         # Ctrl+O → clear
foreground-nvim() { fg %nvim }                    # Ctrl+Z → foreground nvim
zle -N foreground-nvim
bindkey '^Z' foreground-nvim

bindkey "^[[1;3C" forward-word                    # Alt→ / Alt←
bindkey "^[[1;3D" backward-word

autoload -U select-word-style                     # Ctrl+W until '/'
select-word-style bash
