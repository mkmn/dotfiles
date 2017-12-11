# git
if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
  source `brew --prefix`/etc/bash_completion.d/git-completion.bash
  __git_complete g __git_main
fi

if [ -f `brew --prefix`/etc/bash_completion.d/git-prompt.sh ]; then
  source `brew --prefix`/etc/bash_completion.d/git-prompt.sh
fi

# ssh
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# prompt
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[32m\]\w\[\033[0m\]\[\033[31m\]$(__git_ps1 "[%s]")\[\033[0m\]\n\$ '

# alias
alias ls='ls -G'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias vi='nvim'
alias v='nvim'
alias diff='diff -u'
## git
alias g='git'
alias t='tig'
alias git-merged-branch='f(){ git branch --merged $1 | egrep -v "develop|master|sandbox"; }; f'
## rails
alias r='rails'
alias rc='rails console'
alias rs='rails server'
