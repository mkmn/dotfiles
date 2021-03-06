#!/bin/bash -e

DOTFILES_DIR="$HOME/dotfiles"

if [ ! -d $DOTFILES_DIR ]; then
	git clone https://github.com/mkmn/dotfiles.git $DOTFILES_DIR
fi

pushd $DOTFILES_DIR
for f in .??*
do
	[[ $f == ".git" ]] && continue
	[[ $f == ".DS_Store" ]] && continue
	[[ $f == ".gitignore" ]] && continue

	ln -sfnv "$DOTFILES_DIR/$f" "$HOME/$f"
done
popd
