# rbenv init
if [ -e $HOME/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# nodenv init
if [ -e $HOME/.nodenv ]; then
  export PATH="$HOME/.nodenv/bin:$PATH"
  eval "$(nodenv init -)"
fi

# yvm init
if [ -e $HOME/.yvm ]; then
  export YVM_DIR=$HOME/.yvm
  [ -r $YVM_DIR/yvm.sh ] && . $YVM_DIR/yvm.sh
fi

# autocomplete
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# prompt
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr '%F{red}+'
zstyle ':vcs_info:git:*' unstagedstr '%F{yellow}*'
zstyle ':vcs_info:git:*' formats '%F{cyan}[%b%c%u%F{cyan}]%f'
zstyle ':vcs_info:git:*' actionformats '%F{cyan}[%b|%a%F{cyan}]%f'
precmd(){ vcs_info }
## left prompt
PROMPT=$'%F{green}%~${vcs_info_msg_0_}%f\n$ '
## right prompt
RPROMPT=''

# alias
alias ls='ls -G'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias diff='diff -u'
alias mv='mv -i'
alias mv='cp -i'
alias rm='rm -i'
# git
alias g='git'
alias t='tig'
# vim
alias vim='nvim'
alias vi='vim'
alias v='vim'
# ruby
alias be='bundle exec'
alias r='rails'
alias rc='rails console'
alias rs='rails server'

export GOPATH=$HOME/go
eval "$(gh completion -s zsh)"
