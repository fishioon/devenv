#!/bin/sh

add_line() {
	FILE=$1; LINE=$2
	grep -qxF -- "$LINE" "$FILE" || echo "$LINE" >> "$FILE"
}

exit_msg() {
	echo $1; exit -1
}

[[ -z "$XDG_CONFIG_HOME" ]] && export XDG_CONFIG_HOME="$HOME/.config"; add_line "$HOME/.zshenv" "export XDG_CONFIG_HOME=\"$XDG_CONFIG_HOME\""
[[ -z "$ZDOTDIR" ]] && export ZDOTDIR="$XDG_CONFIG_HOME/zsh"; add_line "$HOME/.zshenv" "export ZDOTDIR=\"$ZDOTDIR\""
[[ -z "$DEVENV_HOME" ]] && export DEVENV_HOME=$PWD; add_line "$HOME/.zshenv" "export DEVENV_HOME=\"$DEVENV_HOME\""

[[ ! -d "$XDG_CONFIG_HOME" ]] && mkdir -p $HOME/.config
[[ ! -L "$ZDOTDIR" ]] && ln -sf $DEVENV_HOME/zsh $XDG_CONFIG_HOME/zsh
[[ ! -L "$XDG_CONFIG_HOME/nvim" ]] && ln -sf $DEVENV_HOME/nvim $XDG_CONFIG_HOME/nvim

echo "🎉 🎉 Good luck"
