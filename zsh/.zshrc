export ZSH=$ZDOTDIR/oh-my-zsh

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh ] && source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh

# You can add sensitive data to profile which git ignored
[[ -f "$DEVENV/profile" ]] && source $DEVENV/profile
ZSH_THEME="robbyrussell"
plugins=(docker)
source $ZSH/oh-my-zsh.sh
source $ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^o' autosuggest-execute

_Z_DATA=$XDG_CONFIG_HOME/z
. $ZDOTDIR/z/z.sh
