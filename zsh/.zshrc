[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh ] && source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh

export ZSH=$ZDOTDIR/oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(docker)
source $ZSH/oh-my-zsh.sh
source $ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^o' autosuggest-execute

_Z_DATA=$XDG_CONFIG_HOME/z
. $ZDOTDIR/z/z.sh
