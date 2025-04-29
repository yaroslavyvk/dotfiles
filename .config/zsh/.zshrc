# -----  Login / non-interactive  ---------------------------------
export ZDOTDIR="$HOME/.config/zsh"

# ⏩ PATH і менеджери версій
typeset -U path
export PNPM_HOME="$XDG_DATA_HOME/pnpm"
path=(
  $HOME/.local/bin
  $PNPM_HOME
  $path
)
# Змінні оточення
#export PATH="$HOME/.cargo/bin:$PATH"
#export PATH="$HOME/.local/bin:$PATH"

#eval "$(fnm env --use-on-cd --corepack-enabled --shell zsh)"


# 🗄  локальні доповнення
[[ -f $ZDOTDIR/local/zprofile.local ]] && source $ZDOTDIR/local/zprofile.local
# -----  Основне оточення  ----------------------------------------
# Історія
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000 SAVEHIST=10000
setopt INC_APPEND_HISTORY SHARE_HISTORY HIST_REDUCE_BLANKS \
       HIST_SAVE_NO_DUPS HIST_FIND_NO_DUPS EXTENDED_HISTORY

# Зручності
setopt AUTO_CD EXTENDED_GLOB
bindkey -e                     # emacs-режим редагування
typeset -a precmd_functions
precmd_functions+=(set-tab-title)
set-tab-title() { print -Pn "\e]0;${PWD:t}\a" }

# ----  Oh My Zsh (якщо хочеш лишити)  ----------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git docker kube-ps1 zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# ----  Плагіни, що не йдуть через OMZ  ---------------------------
# source "$BREW_PREFIX/opt/fzf/shell/key-bindings.zsh"   # ⇠ додай, якщо треба
# source $ZDOTDIR/plugins.d/fast-syntax-highlighting.zsh

# ----  Імпорт підфайлів  -----------------------------------------
source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/completion.zsh

# ----  Коли входиш без tmux  -------------------------------------
[[ -z $TMUX ]] && exec tmux
