#!/bin/bash

add_line() {
	FILE=$1; LINE=$2
	grep -qxF -- "$LINE" "$FILE" || echo "$LINE" >> "$FILE"
}

exit_msg() {
	echo $1; exit -1
}

[ -z "$DEVENV_HOME" ] && export DEVENV_HOME=$PWD; add_line "$HOME/.zshenv" "export DEVENV_HOME=\"$DEVENV_HOME\""
[ -z "$XDG_CONFIG_HOME" ] && export XDG_CONFIG_HOME="$HOME/.config"; add_line "$HOME/.zshenv" "export XDG_CONFIG_HOME=\"$XDG_CONFIG_HOME\""
[ -z "$ZDOTDIR" ] && export ZDOTDIR="$XDG_CONFIG_HOME/zsh"; add_line "$HOME/.zshenv" "export ZDOTDIR=\"$ZDOTDIR\""

[ ! -d "$XDG_CONFIG_HOME" ] && mkdir -p $HOME/.config

[ ! -L "$ZDOTDIR" ] && ln -sf $DEVENV_HOME/zsh $XDG_CONFIG_HOME/zsh
[ ! -L "$XDG_CONFIG_HOME/nvim" ] && ln -sf $DEVENV_HOME/nvim $XDG_CONFIG_HOME/nvim
[ ! -L "$XDG_CONFIG_HOME/git" ] && ln -sf $DEVENV_HOME/git $XDG_CONFIG_HOME/git

### add
command -v fzf || (brew install fzf && $(brew --prefix)/opt/fzf/install --xdg --no-bash --no-fish --no-update-rc --key-bindings --completion)

echo "🎉 🎉 Good luck"
