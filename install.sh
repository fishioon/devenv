#!/bin/bash

add_line() {
	FILE=$1; LINE=$2
	grep -qxF -- "$LINE" "$FILE" || echo "$LINE" >> "$FILE"
}
zshenv_file=$HOME/.zshenv
[ -z "$DEVENV" ] && export DEVENV=$PWD; add_line $zshenv_file "export DEVENV=\"$DEVENV\""
[ -z "$XDG_CONFIG_HOME" ] && export XDG_CONFIG_HOME="$HOME/.config"; add_line $zshenv_file "export XDG_CONFIG_HOME=\"$XDG_CONFIG_HOME\""
[ -z "$ZDOTDIR" ] && export ZDOTDIR="$XDG_CONFIG_HOME/zsh"; add_line $zshenv_file "export ZDOTDIR=\"$ZDOTDIR\""
add_line $zshenv_file "export PATH=\$HOME/go/bin:\$DEVENV/bin:/usr/local/opt/llvm/bin:\$PATH"

[ ! -d "$XDG_CONFIG_HOME" ] && mkdir -p $HOME/.config

[ ! -L "$ZDOTDIR" ] && ln -sf $DEVENV/zsh $XDG_CONFIG_HOME/zsh
[ ! -L "$XDG_CONFIG_HOME/nvim" ] && ln -sf $DEVENV/nvim $XDG_CONFIG_HOME/nvim
[ ! -L "$XDG_CONFIG_HOME/git" ] && ln -sf $DEVENV/git $XDG_CONFIG_HOME/git

### add
command -v fzf || (brew install fzf && $(brew --prefix)/opt/fzf/install --xdg --no-bash --no-fish --no-update-rc --key-bindings --completion)

echo "🎉 🎉 Good luck"
