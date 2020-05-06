export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export DEVENV="$XDG_CONFIG_HOME/devenv"
export PATH="$DEVENV/bin:$HOME/go/bin:$PATH"
export NODE_PATH="/usr/local/lib/node_modules"

export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
export NODE_REPL_HISTORY=""
export EDITOR=nvim

source $ZDOTDIR/func.zsh
source $ZDOTDIR/alias.sh
export proxy_address="http://127.0.0.1:12639"
export {http_proxy,https_proxy}=$proxy_address
