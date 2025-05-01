# Homebrew completions
if command -v brew &>/dev/null; then
  fpath+=("$(brew --prefix)/share/zsh/site-functions")
fi

# Extra completions shipped with dotfiles
fpath+=("$ZDOTDIR/.packages/zsh-completions/src")

# Initialise completion system (secure, no dump-files warnings)
autoload -U compinit && compinit -u

# Node tabtab completions
[[ -f $HOME/.config/tabtab/zsh/__tabtab.zsh ]] && source $_

# Styles
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*:*:*:*:descriptions' format '-- %d --'
zstyle ':completion:*:messages'  format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings'  format ' %F{red}-- no matches found --%f'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/.zcompcache"

# Kubernetes / k3s
command -v kubectl &>/dev/null && eval "$(kubectl completion zsh)"
command -v k3s    &>/dev/null && eval "$(k3s completion zsh)"
