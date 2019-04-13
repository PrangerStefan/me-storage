#!/bin/bash
declare -a dotfiles

DOTFILESDIR=$HOME/me/dotfiles

dotfiles=($HOME/.zshrc
					$HOME/.config/awesome/rc.lua
					$HOME/.config/awesome/themes/multicolor/theme.lua
					$HOME/.zsh/hcialias
					$HOME/.ruby-scripts
					$HOME/.bash-functions
					$HOME/.sumo-functions
					$HOME/.custom-commands
					)

for file in "${dotfiles[@]}"; do
	filename=$(basename $file)
	if [ -f $HOME/me/dotfiles/$filename ]; then
		DIFF=$(diff $file $DOTFILESDIR/$filename) 
		if [ "$DIFF" != "" ]; then
			notify-send $file "was modified, you might want to push to git" -t 4500
		  echo $file "was modified, copying to" $HOME "/me/dotfiles."
		  echo "diff:"$DIFF
			cp $file $HOME/me/dotfiles
		else
		  echo $file "was not modified, skipping."
		fi
	else
		echo "adding new file:" $file "to dotfiles directory"
		cp $file $HOME/me/dotfiles
	fi
done