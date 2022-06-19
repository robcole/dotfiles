alias restart-dns="sudo killall -HUP mDNSResponder; sleep 2;"
alias ls='ls -G'
alias dev='cd ~/dev'
alias sourceme="source ~/.zprofile"
alias ld="lazydocker"
alias dana="cd ~/dev/dana"

function parse_git_branch () {
git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function nuke-docker () {
  docker rm -vf $(docker ps -aq)
  docker rmi -f $(docker images -aq)
}

function rm-docker () {
  nuke-docker
}

export N_PREFIX="$HOME/.n"
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
export PATH="$N_PREFIX/bin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="/Users/robcole/.rbenv/shims:$PATH"
export PATH="/usr/local/share/python3:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export DOCKER_BUILDKIT=1
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
export OVERMIND_PROCFILE="Procfile.dev"

eval "$(mcfly init zsh)"
bindkey '^R' mcfly-history-widget

eval "$(rbenv init - zsh)"