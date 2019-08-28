#!/bin/sh

add_line() {
	FILE=$1; LINE=$2
	grep -qxF -- "$LINE" "$FILE" || echo "$LINE" >> "$FILE"
}

exit_msg() {
	echo $1; exit -1
}

[[ -z "$DEVENV_HOME" ]] && export DEVENV_HOME=$PWD
[[ ! -d "$HOME/.config" ]] && mkdir -p $HOME/.config
[[ ! -L "$HOME/.config/nvim" ]] && ln -sf $DEVENV_HOME/nvim $HOME/.config/nvim

[[ -z "$ZDOTDIR" ]] && exit_msg "You need add [$ZDOTDIR] env first"
add_line "$ZDOTDIR/.zshrc" "export DEVENV_HOME=\"$DEVENV_HOME\""
add_line "$ZDOTDIR/.zshrc" 'source $DEVENV_HOME/env.sh'

echo "🎉 🎉 Good luck"
