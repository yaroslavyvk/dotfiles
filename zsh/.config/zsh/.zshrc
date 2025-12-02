#  Interactive shell only – exit early for scripts
[[ $- != *i* ]] && return

# -------------- Paths & versions ---------------------------
: ${XDG_DATA_HOME:=$HOME/.local/share}             # XDG fallback

typeset -U path                                    # keep entries unique
path=(
  /opt/homebrew/bin
  /opt/homebrew/sbin
  $HOME/.local/share/nvim/mason/bin
  $HOME/.local/bin
  $PNPM_HOME
  $path                                            # keep system PATH
)

# ---------------- History -----------------------------------
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000 SAVEHIST=10000
setopt INC_APPEND_HISTORY SHARE_HISTORY HIST_REDUCE_BLANKS \
       HIST_SAVE_NO_DUPS HIST_FIND_NO_DUPS EXTENDED_HISTORY

# -------------- Quality-of-life -----------------------------
setopt AUTO_CD EXTENDED_GLOB
bindkey -e                                          # Emacs keymap
precmd() { print -Pn "\e]0;${PWD:t}\a" }            # tab title

# ---------------- Oh-My-Zsh ---------------------------------
if [[ -d "$HOME/.oh-my-zsh" ]]; then
  export ZSH="$HOME/.oh-my-zsh"
  ZSH_THEME="" #"robbyrussell"
  plugins=(git docker)                     # core plugins
  source $ZSH/oh-my-zsh.sh
  #PROMPT=" $PROMPT"
fi

# External plugins – load **after** OMZ
if [[ -d "$HOME/.zsh-plugins" ]]; then
  source "$HOME/.zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
  source "$HOME/.zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# ---------------- Basics ------------------------------------
export EDITOR="${EDITOR:-nvim}"
export DOTFILES="$HOME/dotfiles"
export KUBECONFIG="$HOME/.kube/config"

source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/completion.zsh"

# --- Autojump (Homebrew) ---
if [[ -s "$(brew --prefix)/etc/profile.d/autojump.sh" ]]; then
  . "$(brew --prefix)/etc/profile.d/autojump.sh"
fi

# --- Zoxide ---
eval "$(zoxide init zsh)"

# ---------------- Starship prompt ---------------------------
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
eval "$(starship init zsh)"
# ---------------- Tmux auto-start ---------------------------
if command -v tmux >/dev/null && [[ -z $TMUX ]] && [[ $TERM != "dumb" ]]; then
  exec tmux
 fi
export PATH="/opt/homebrew/share/google-cloud-sdk/bin:$PATH"

export DOCKER_CLI_PLUGIN_PATH="/opt/homebrew/lib/docker/cli-plugins:$HOME/.docker/cli-plugins"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ---------------- Yazi ---------------------------

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
