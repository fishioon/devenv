#!/bin/bash
cd "$(dirname "$0")"

ln -sf "$PWD/zsh/.zshenv" $HOME/
source $HOME/.zshenv

[ ! -d "$XDG_CONFIG_HOME" ] && mkdir -p $XDG_CONFIG_HOME

[ ! -L "$XDG_CONFIG_HOME/devenv" ] && ln -sf "$PWD/$i" "$XDG_CONFIG_HOME/devent"
for i in zsh nvim git; do
	[ ! -L "$XDG_CONFIG_HOME/$i" ] && ln -sf "$PWD/$i" "$XDG_CONFIG_HOME/$i"
done

## fzf
# command -v fzf || (brew install fzf && $(brew --prefix)/opt/fzf/install --xdg --no-bash --no-fish --no-update-rc --key-bindings --completion)

## jump
#go get -u github.com/gsamokovarov/jump

echo "🎉 🎉 Good luck"
