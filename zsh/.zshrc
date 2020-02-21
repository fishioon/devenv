## PATH DEVENV ZDOTDIR XDG_CONFIG_HOME define at ~/.zshenv
export LANG=en_US.UTF-8
export ZSH=$ZDOTDIR/oh-my-zsh
export EDITOR=nvim

export NODE_PATH=/usr/local/lib/node_modules
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
export REDISCLI_HISTFILE=/dev/null
export NODE_REPL_HISTORY=""

# You can add sensitive data to profile which git ignored
[[ -f "$DEVENV/profile" ]] && source $DEVENV/profile

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

# function
v() {
	if [[ -S "$NVIM_LISTEN_ADDRESS" ]]; then
		nv "$@"
	else
		nvim "$@"
	fi
}

gitignore() {
	if [[ -f ".gitignore" ]]; then 
		echo ".gitignore already exists"
	else
		lang=${1:-Go}
		curl -o .gitignore "https://raw.githubusercontent.com/github/gitignore/master/${lang}.gitignore"
	fi
}

rs() {
	repo=$1
	hostname=${2:-dev}
	rsync --rsh=ssh -avz --exclude='.git' ~/code/work/$repo $hostname:/data/fish/
}

cpname() {
	name=`pwd`/$1
	printf $name | pbcopy
	echo $name
}

PROXY_ENV=(http_proxy ftp_proxy https_proxy all_proxy HTTP_PROXY HTTPS_PROXY FTP_PROXY ALL_PROXY)
setproxy(){
	for envar in $PROXY_ENV; do
		export $envar=$1
	done

	NO_PROXY_ENV=(no_proxy NO_PROXY)
	for envar in $NO_PROXY_ENV; do
		export $envar=$2
	done
	#sed -i.bak -e '/^#ProxyCommand/ s/^#//' ~/.ssh/config
	if [[ "$OSTYPE" = darwin* ]]; then
		networksetup -setwebproxy "Wi-fi" $proxy_host $proxy_port
		networksetup -setsecurewebproxy "Wi-fi" $proxy_host $proxy_port
		networksetup -setautoproxyurl "Wi-fi" $pac_url
	fi
}

unproxy(){
	for envar in $PROXY_ENV
	do
		unset $envar
	done
	#sed -i.bak -e '/^ProxyCommand/ s/^#*/#/' ~/.ssh/config
	if [[ "$OSTYPE" = darwin* ]]; then
		networksetup -setsecurewebproxystate "Wi-fi" off
		networksetup -setwebproxystate "Wi-fi" off
		networksetup -setautoproxystate "Wi-fi" off
	fi
}

## proxy switch
proxy() {
	if [[ -z "$HTTP_PROXY" ]]; then
		# proxy_value and no_proxy_value define at profile
		setproxy $proxy_value $no_proxy_value
	else
		unproxy
	fi
	echo $HTTP_PROXY
}

http() {
	host=${1:-'127.0.0.1:9981'}
	dir=${2:-$PWD}
	echo 'http://'$host $dir
	goexec 'http.ListenAndServe(`'$host'`, http.FileServer(http.Dir(`'$dir'`)))'
}

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh ] && source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh
## jump "go get -u github.com/gsamokovarov/jump 
eval "$(jump shell --bind=z)"

# proxy config
# work_wifi,proxy_value,no_proxy_value define at 'profile' file
if [[ "$OSTYPE" = darwin* ]]; then
	ssid=`networksetup -getairportnetwork en0 | awk '{print $4}'`
	if [[ $ssid == $work_wifi ]]; then
		[[ -z "$HTTP_PROXY" ]] && setproxy $proxy_value $no_proxy_value
	else
		[[ -z "$HTTP_PROXY" ]] || unproxy
	fi
fi
