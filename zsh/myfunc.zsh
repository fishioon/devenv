# function
v() {
	if [[ -S "$NVIM_LISTEN_ADDRESS" ]]; then
		nv "$@"
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

cpname() {
	name=`pwd`/$1
	printf $name | pbcopy
	echo $name
}

PROXY_ENV=(http_proxy ftp_proxy https_proxy all_proxy HTTP_PROXY HTTPS_PROXY FTP_PROXY ALL_PROXY)
setproxy(){
	proxy_host=$1
	proxy_port=$2
	for envar in $PROXY_ENV; do
		export $envar="http://$proxy_host:$proxy_port"
	done
}

unproxy(){
	for envar in $PROXY_ENV; do
		unset $envar
	done
}

http() {
	host=${1:-'127.0.0.1:9981'}
	dir=${2:-$PWD}
	echo 'http://'$host $dir
	goexec 'http.ListenAndServe(`'$host'`, http.FileServer(http.Dir(`'$dir'`)))'
}

