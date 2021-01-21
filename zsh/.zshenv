export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export DEVENV="$XDG_CONFIG_HOME/devenv"
export PATH="$DEVENV/bin:$HOME/go/bin:$HOME/.cargo/bin:$PATH"
export NODE_PATH="/usr/local/lib/node_modules"

export CLICOLOR=1
export LSCOLORS="Gxfxcxdxbxegedabagacad"

export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
export NODE_REPL_HISTORY=""
export EDITOR=nvim

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
