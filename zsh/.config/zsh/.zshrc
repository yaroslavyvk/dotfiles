#  Interactive shell only – exit early for scripts
[[ $- != *i* ]] && return

# -------------- Paths & versions ---------------------------
: ${XDG_DATA_HOME:=$HOME/.local/share}             # XDG fallback

typeset -U path                                    # keep entries unique
path=(
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
  ZSH_THEME="robbyrussell"
  plugins=(git docker kube-ps1)                     # core plugins
  source $ZSH/oh-my-zsh.sh
fi

# External plugins – load **after** OMZ
if [[ -d "$HOME/.zsh-plugins" ]]; then
  source "$HOME/.zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
  source "$HOME/.zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# ---------------- Basics ------------------------------------
export EDITOR="${EDITOR:-nvim}"
export DOTFILES="$HOME/.dotfiles"


source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/completion.zsh"

# ---------------- Tmux auto-start ---------------------------
if command -v tmux >/dev/null && [[ -z $TMUX ]] && [[ $TERM != "dumb" ]]; then
  exec tmux
fi
