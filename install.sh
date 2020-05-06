#!/bin/bash
cd "$(dirname "$0")"
export XDG_CONFIG_HOME=$HOME/.config

[ ! -d "$XDG_CONFIG_HOME" ] && mkdir -p $XDG_CONFIG_HOME

for i in zsh nvim git; do
	[ ! -L "$XDG_CONFIG_HOME/$i" ] && ln -sf "$PWD/$i" "$XDG_CONFIG_HOME/$i"
done
[ ! -L "$XDG_CONFIG_HOME/devenv" ] && ln -sf "$PWD" "$XDG_CONFIG_HOME/devenv"

## fzf
# command -v fzf || (brew install fzf && $(brew --prefix)/opt/fzf/install --xdg --no-bash --no-fish --no-update-rc --key-bindings --completion)

ln -sf "$PWD/zsh/.zshenv" $HOME/
source $HOME/.zshenv

echo "🎉 🎉 Good luck"
