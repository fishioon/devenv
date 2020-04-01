export ZSH=$ZDOTDIR/oh-my-zsh

alias ga='git add'
alias gc='git commit -v'
alias gcm='git checkout master'
alias gcd='git checkout develop'
alias gcb='git checkout -b'
alias gco='git checkout'
alias gd='git diff'
alias gp='git push'
alias gst='git status'
alias vi=nvim
alias sshconfig='v ~/.ssh/config'
alias zshconfig='v ~/.config/zsh/.zshrc'

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh ] && source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh
source $ZDOTDIR/myfunc.zsh

# You can add sensitive data to profile which git ignored
[[ -f "$DEVENV/profile" ]] && source $DEVENV/profile
ZSH_THEME="robbyrussell"
plugins=(docker)
source $ZSH/oh-my-zsh.sh
source $ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^o' autosuggest-execute

_Z_DATA=$XDG_CONFIG_HOME/z
. $ZDOTDIR/z/z.sh
