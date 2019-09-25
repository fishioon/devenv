# export
# $DEVENV_HOME: init.sh define and add to .zshrc

# source profile at first
source $DEVENV_HOME/profile

export PATH=/usr/local/sbin:$HOME/go/bin:$DEVENV_HOME/bin:$PATH
export NODE_PATH=/usr/local/lib/node_modules
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
export EDITOR=nvim
export NODE_REPL_HISTORY=""

# alias
alias ga='git add'
alias gc='git commit -v'
alias gcm='git checkout master'
alias gcd='git checkout develop'
alias gco='git checkout'
alias gd='git diff'
alias gp='git push'
alias gst='git status'

alias sshconfig='v ~/.ssh/config'
alias vi=nvim

# function

v() {
	if [[ -S "$NVIM_LISTEN_ADDRESS" ]]; then
		nv "$@"
	else
		nvim "$@"
	fi
}

is_in_git_repo() {
	git rev-parse HEAD > /dev/null 2>&1
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
	hostname=$2
	[ -z "$hostname" ] && hostname=dev
	rsync --rsh=ssh -avz --exclude='.git' ~/code/work/$repo $hostname:/data/fish/
}

cpabs() {
	name=`pwd`/$1
	printf $name | pbcopy
	echo $name
}

PROXY_ENV=(http_proxy ftp_proxy https_proxy all_proxy HTTP_PROXY HTTPS_PROXY FTP_PROXY ALL_PROXY)
assignProxy(){
	for envar in $PROXY_ENV; do
		export $envar=$1
	done

	NO_PROXY_ENV=(no_proxy NO_PROXY)
	for envar in $NO_PROXY_ENV; do
		export $envar=$2
	done
	sed -i.bak -e '/^#ProxyCommand/ s/^#//' ~/.ssh/config
}

clrProxy(){
	for envar in $PROXY_ENV
	do
		unset $envar
	done
	sed -i.bak -e '/^ProxyCommand/ s/^#*/#/' ~/.ssh/config
}

## proxy switch
proxy() {
	if [[ -z "$HTTP_PROXY" ]]; then
		# proxy_value and no_proxy_value define at profile
		assignProxy $proxy_value $no_proxy_value
	else
		clrProxy
	fi
}

# proxy config
# work_wifi,proxy_value,no_proxy_value define at 'profile' file
ssid=`networksetup -getairportnetwork en0 | awk '{print $4}'`
if [[ $ssid == $work_wifi ]]; then
	assignProxy $proxy_value $no_proxy_value
else
	clrProxy
fi

## go get github.com/gsamokovarov/jump 
eval "$(jump shell --bind=z)"

bindkey '^o' autosuggest-execute
