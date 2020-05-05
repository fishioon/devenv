# function
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

proxy() {
	PROXY_ENV="http_proxy https_proxy all_proxy HTTP_PROXY HTTPS_PROXY ALL_PROXY"
	for envar in $PROXY_ENV; do
		if [[ -z "$1" ]]; then
			unset $envar
		else
			export $envar=$1
		fi
	done
}
