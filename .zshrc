# anyenv init
if [ -e $HOME/.anyenv ]; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init -)"
fi

# yvm init
if [ -e $HOME/.yvm ]; then
  export YVM_DIR=$HOME/.yvm
  [ -r $YVM_DIR/yvm.sh ] && . $YVM_DIR/yvm.sh
fi

# autocomplete
_cache_hosts=(`ruby -ne 'print $1.strip, "\n" if /^Host\s+(.+)$/' ~/.ssh/**/config`)
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
alias ll='ls -lh'
alias la='ls -a'
alias lla='ls -lha'
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

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

if [ -e $HOME/.env.local ]; then
  source $HOME/.env.local
fi

eval "$(gh completion -s zsh)"
