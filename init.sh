#!/bin/sh

addLine() {
	FILE=$1
	LINE=$2
	grep -qxF -- "$LINE" "$FILE" || echo "$LINE" >> "$FILE"
}

[[ -z "$DEVENV_HOME" ]] && export DEVENV_HOME=$PWD
[[ ! -d "$HOME/.config" ]] && mkdir -p $HOME/.config
[[ ! -L "$HOME/.config/nvim" ]] && ln -sf $DEVENV_HOME/nvim $HOME/.config/nvim

if [[ -z "$ZDOTDIR" ]]; then
	echo "You need add $ZDOTDIR env first"
else
	addLine "$ZDOTDIR/.zshrc" "export DEVENV_HOME=\"$DEVENV_HOME\""
	addLine "$ZDOTDIR/.zshrc" 'source $DEVENV_HOME/shrc'
	[[ -f "$DEVENV_HOME/workrc" ]] && addLine "$ZDOTDIR/.zshrc" 'source $DEVENV_HOME/workrc'
fi

echo "🎉 🎉 Good luck"
