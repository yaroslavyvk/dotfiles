[[ -o interactive ]] || return

HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS HIST_REDUCE_BLANKS HIST_IGNORE_SPACE AUTO_CD
bindkey -e

# Zsh/package-provided completions, with standard permission checks.
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

alias g='git'
alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias gc='git commit'
alias gl='git log --oneline --graph --decorate'
alias gp='git push'
alias gco='git checkout'
compdef _git g

# Install Docker separately through your company-approved channel.
alias d='docker'
alias dc='docker compose'
alias up='docker compose up'
alias down='docker compose down'
alias build='docker compose build'
alias logs='docker compose logs --follow'
if (( $+commands[docker] )); then
  source <(docker completion zsh)
  compdef _docker d
fi

alias ..='cd ..'
alias ...='cd ../..'
if (( $+commands[eza] )); then
  alias ls='eza --group-directories-first --icons'
  alias ll='eza -lh --icons'
  alias la='eza -lha --icons'
  alias lg='eza -lh --git --icons'
fi

# Autojump: j <directory> and jc <child-directory>.
if (( $+commands[brew] )); then
  brew_prefix=$(brew --prefix)
  [[ -r "$brew_prefix/etc/profile.d/autojump.sh" ]] && source "$brew_prefix/etc/profile.d/autojump.sh"
  unset brew_prefix
fi

if (( $+commands[starship] )); then
  export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
  eval "$(starship init zsh)"
fi
