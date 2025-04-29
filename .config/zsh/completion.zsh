# Add Homebrew site-functions to fpath if brew is installed
if type brew &>/dev/null; then
  fpath+="$(brew --prefix)/share/zsh/site-functions"
fi

# Add custom completions
fpath+="$ZDOTDIR/.packages/zsh-completions/src"

# Initialize completion system
autoload -U compinit
compinit
_comp_options+=(globdots)  # Include hidden files in completion

# Tabtab support (Node.js CLI tools)
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && source ~/.config/tabtab/zsh/__tabtab.zsh || true

# Nice completion styles
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' expand prefix suffix

zstyle ':completion:*:*:*:*:descriptions' format '-- %d --'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'

# Enable completion caching
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/.zcompcache"

# Enable kubectl and k3s completions if available
if command -v kubectl &> /dev/null; then
  eval "$(kubectl completion zsh)"
fi

if command -v k3s &> /dev/null; then
  eval "$(k3s completion zsh)"
fi
