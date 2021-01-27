###### function
v() {
	if [[ -S "$NVIM_LISTEN_ADDRESS" ]]; then
		$DEVENV/bin/nv "$@"
	else
		if [[ -z "$1" ]]; then
			nvim -c ":terminal"
		else
			nvim "$@"
		fi
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

# rsync current git repo to dst server
rs() {
	repo=$(git root)
	hostname=${1:-dev}
	rsync --rsh=ssh -avz --exclude='.git' $repo $hostname:/data/ifish/
}

realpath() {
	[[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

cn() {
	name=$(realpath $1)
	printf $name | pbcopy
	echo $name
}

known_hosts() {
	line=$1
	sed -i .bak "${line}d" $HOME/.ssh/known_hosts
}

proxy() {
	switch=${1:-off}
	sudo networksetup -setwebproxystate "Wi-Fi" $switch
	sudo networksetup -setsecurewebproxystate "Wi-Fi" $switch
}

ssh2https() {

}

### proxy
#export no_proxy=".paas.com,127.0.0.1,localhost,.oa.com,.woa.com,.tencent.com,10.0.0.0/8,9.0.0.0/8"
#export http_proxy=`scutil --proxy | awk '\
#  /HTTPEnable/ { enabled = $3; } \
#  /HTTPProxy/ { server = $3; } \
#  /HTTPPort/ { port = $3; } \
#  END { if (enabled == "1") { print "http://" server ":" port; } }'`
#export {https_proxy,HTTP_PROXY,HTTPS_PROXY}=$http_proxy
#export NO_PROXY=$no_proxy

###########
eval "$(starship init zsh)"
autoload -Uz compinit && compinit
bindkey -e

source $ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^o' autosuggest-execute

export _Z_DATA=$XDG_CONFIG_HOME/z
source $ZDOTDIR/z/z.sh

source /usr/local/opt/fzf/shell/key-bindings.zsh

setopt inc_append_history
setopt share_history
