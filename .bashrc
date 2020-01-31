[[ -r `brew --prefix`/etc/profile.d/bash_completion.sh ]] && . `brew --prefix`/etc/profile.d/bash_completion.sh

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

# git
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[32m\]\w\[\033[0m\]\[\033[31m\]$(__git_ps1 "[%s]")\[\033[0m\]\n\$ '
__git_complete g __git_main
