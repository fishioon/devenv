#!/bin/bash

add_line() {
	FILE=$1; LINE=$2
	grep -qxF -- "$LINE" "$FILE" || echo "$LINE" >> "$FILE"
}

DEVENV=$PWD
ZSHENV_FILE=$HOME/.zshenv
XDG_CONFIG_HOME="$HOME/.config"
[ ! -d "$XDG_CONFIG_HOME" ] && mkdir $XDG_CONFIG_HOME
add_line $ZSHENV_FILE "export DEVENV=\"$DEVENV\""
add_line $ZSHENV_FILE "export XDG_CONFIG_HOME=\"$XDG_CONFIG_HOME\""
add_line $ZSHENV_FILE 'export PATH="$HOME/go/bin:$DEVENV/bin:$PATH"'
add_line $ZSHENV_FILE 'export ZDOTDIR="$XDG_CONFIG_HOME/zsh"'

for i in zsh nvim git; do
	[ ! -L "$XDG_CONFIG_HOME/$i" ] && ln -sf "$DEVENV/$i" "$XDG_CONFIG_HOME/$i"
done

## fzf
# command -v fzf || (brew install fzf && $(brew --prefix)/opt/fzf/install --xdg --no-bash --no-fish --no-update-rc --key-bindings --completion)

## jump
go get -u github.com/gsamokovarov/jump

echo "🎉 🎉 Good luck"
