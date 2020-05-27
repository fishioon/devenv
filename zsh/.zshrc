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

rs() {
	repo=$1
	hostname=${2:-dev}
	rsync --rsh=ssh -avz --exclude='.git' ~/code/work/$repo $hostname:/data/fish/
}

cpath() {
	name=`pwd`/$1
	printf $name | pbcopy
	echo $name
}

http() {
	host=${1:-'127.0.0.1:9981'}
	dir=${2:-$PWD}
	echo 'http://'$host $dir
	goexec 'http.ListenAndServe(`'$host'`, http.FileServer(http.Dir(`'$dir'`)))'
}

known_hosts() {
	line=$1
	sed -i .bak "${line}d" $HOME/.ssh/known_hosts
}

###########
fpath=($ZDOTDIR/pure $fpath)
autoload -Uz compinit && compinit

source $ZDOTDIR/pure/pure.zsh
source $ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh

_Z_DATA=$XDG_CONFIG_HOME/z
. $ZDOTDIR/z/z.sh

[ -d "/usr/local/opt/fzf/" ] && source "/usr/local/opt/fzf/shell/key-bindings.zsh"

### bindkey
bindkey -e
bindkey '^o' autosuggest-execute

### alias
alias l='ls -lah'
alias ll='ls -lh'
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
alias m=tldr
alias sshconfig='nvim ~/.ssh/config'
alias zshconfig='nvim ~/.config/zsh/.zshrc'
