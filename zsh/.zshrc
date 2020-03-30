export ZSH=$ZDOTDIR/oh-my-zsh
source $ZDOTDIR/myfunc.zsh

# You can add sensitive data to profile which git ignored
[[ -f "$DEVENV/profile" ]] && source $DEVENV/profile
location='home'
if [[ "$OSTYPE" = darwin* ]]; then
	ssid=`networksetup -getairportnetwork en0 | awk '{print $4}'`
	if [[ $ssid == $wifi_work ]]; then
		location='work'
	fi
fi
export location=$location

ZSH_THEME="robbyrussell"
plugins=(docker)
source $ZSH/oh-my-zsh.sh
source $ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^o' autosuggest-execute

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
alias proxyhome="setproxy $proxy_home_host $proxy_home_port"
alias proxywork="setproxy $proxy_work_host $proxy_work_port"

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh ] && source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh
## jump "go get -u github.com/gsamokovarov/jump 
eval "$(jump shell --bind=z)"
