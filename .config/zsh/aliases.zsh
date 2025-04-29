alias g='git'
alias k='kubectl'
alias d='docker'
alias c='clear'

#alias ls='eza --group-directories-first'
#alias ll='ls -la'
#alias l='ls -1'

# Docker Compose short-cuts
alias up='docker compose up'
alias down='docker compose down'
alias build='docker compose build'
alias logs='docker compose logs --follow'

# Git pretty log
alias glog="git log --graph --pretty=format:'%C(yellow)%h%C(reset) -%C(auto)%d%C(reset) %s %C(green)(%cr)%C(reset)'"


#keybindings

# Стрілки ↑/↓ — пошук по історії
autoload -U up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

bindkey '^O' clear-screen           # Ctrl+O = очистити

# Ctrl+Z повертає nvim, якщо він у фоні
foreground-nvim() { fg %nvim }
zle -N foreground-nvim
bindkey '^Z' foreground-nvim

# Alt←/→  — рух по словам
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

# Ctrl+W видаляти до '/'
autoload -U select-word-style
select-word-style bash
