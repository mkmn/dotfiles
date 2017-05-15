export PATH="$HOME/.anyenv/bin:$PATH"
if which anyenv > /dev/null; then
  eval "$(anyenv init -)"
fi

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
