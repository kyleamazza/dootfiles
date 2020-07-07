PATH=/Users/kyleamazza/.cargo/bin:/Users/kyleamazza/.cabal/bin:/Users/kyleamazza/.ghcup/bin:/Users/kyleamazza/.local/bin:/Users/kyleamazza/.swiftenv/shims:/usr/local/bin:/Users/kyleamazza/.yarn/bin:/Users/kyleamazza/.config/yarn/global/node_modules/.bin:/Users/kyleamazza/.rbenv/shims:/Users/kyleamazza/.rbenv/shims:/Users/kyleamazza/.rbenv/bin:/Users/kyleamazza/.nvm/versions/node/v10.16.3/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin:$GOPATH/bin:/Users/kyleamazza/.asdf/installs/rust/1.38.0/bin:/Users/kyleamazza/.gogs/bin/gogs:/usr/local/opt/sqlite/bin:/Users/kyleamazza/.local/bin/redis-cluster-playground:/Library/Frameworks/Mono.framework/Versions/Current/bin/:/Library/Ballerina/bin/:/Users/kyleamazza/.asdf/installs/rust/1.43.1/bin/

# TEMP alias for dev Redis
export REDIS_DEV="sityo-dev.lyxl8a.clustercfg.usw2.cache.amazonaws.com"
export PG_DEV="db1-mft-sityo-uswest-dev.clas4gubsacm.us-west-2.rds.amazonaws.com"
export PG_STG="db1-mft-sityo-uswest-stg.clas4gubsacm.us-west-2.rds.amazonaws.com"
export PATH="/Users/kyleamazza/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export DENO_INSTALL="/Users/kyleamazza/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Erlang asdf plugin
export KERL_CONFIGURE_OPTIONS="--disable-debug --without-javac"

# Auto 'cd's into directory if the argument is not a command
shopt -s autocd

###################
### BEGIN ALIASES
alias q="exit"

# Runs last command as sudo (NOTE: `sudo !!` also does this, but it's not as fun...
alias bruh='echo "WHO DO YOU THINK YOU ARE I AM" && sudo !!'

# ls related (all use exa, which is modern ls)
alias ls='exa -a --group-directories-first'
alias ll='exa -lg --group-directories-first'
alias la='exa -lag --group-directories-first'
alias lm='exa -lgs modified --group-directories-first'
alias lmr='exa -lgs modified --group-directories-first --reverse'

# greppo mcbeppo
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# treeeee
alias treee='tree -F -a -C --dirsfirst'

# history
alias hgrep='history | grep'

# SQLite
alias sqlite="sqlite3"

# Get ports
alias ports='ss -nutpal'

# Podman
# alias docker='podman' # Not feasible currently, needs a Linux VM running somewhere plus configuration

alias doc='cd ~/Documents'
alias proj='cd ~/Documents/projects'
alias ss='cd ~/Documents/self-study'

export BOOKS="~/Documents/books"
alias books="cd $BOOKS"

# RabbitMQ via Docker
alias ribbit='docker run -d -p 5672:5672 -p 15672:15672 --name ribbit rabbitmq:3.8-management'
alias pg='docker run -d -p 5432:5432 --name pg postgres:12.1'
alias mysquirrel='docker run -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=mysquirrel --name mysquirrel mysql:8.0.20'
alias stripo='docker run -d -p 12111-12112:12111-12112 --name stripo stripemock/stripe-mock:latest'
alias hasaki='docker run -d -p 8080:8080 -e HASURA_GRAPHQL_DATABASE_URL=postgres://postgres:postgres@host.docker.internal:5432/hasaki -e HASURA_GRAPHQL_ENABLE_CONSOLE=true --name hasura hasura/graphql-engine:latest'
alias prom='docker run --name prom -d -p 9090:9090 prom/prometheus'
alias redis-cluster='docker run -d -p 7000:7000 -p 7001:7001 -p 7002:7002 --name redis-cluster -e "IP=0.0.0.0" grokzen/redis-cluster:5.0.5'
alias shhpgdev='ssh -N -L 5433:db1-mft-sityo-uswest-dev.ccyha5oyecbf.us-west-2.rds.amazonaws.com:5432 -i ~/.ssh/"rsa_sityo_tools.pem" ubuntu@ec2-35-162-177-75.us-west-2.compute.amazonaws.com'
alias shhpgstg='ssh -N -L 5433:db1-mft-sityo-uswest-stg.ccyha5oyecbf.us-west-2.rds.amazonaws.com:5432 -i ~/.ssh/"rsa_sityo_tools.pem" ubuntu@ec2-35-162-177-75.us-west-2.compute.amazonaws.com'

# Yarn because I'm lazy
alias ya='yarn add'
alias yad='yarn add -D'
alias yr='yarn remove'
alias yi='yarn install'

# ngrok
alias ng='ngrok http --subdomain=mobileforming $1'

# git
alias g='git'
alias bfg='java -jar ~/.local/bin/bfg.jar'

# kubectl bc kubectl is too long to type
alias kctl='kubectl'
alias kc='kubectl'
alias k='kubectl'
alias kns='kubens'
alias kn='kubens'
alias kcx='kubectx'
alias kx='kubectx'

# Fsharp
alias fsi='fsharpi'
alias fsc='fsharpc'
alias fsnew='dotnet new console -lang "F#" -o '

# GREP
alias girl='grep -iRl'

# Ballerina
alias bal='ballerina'

# Android
alias genDebugKeystore='keytool -genkey -v -keystore debug.keystore -storepass android -alias androiddebugkey -keypass android -keyalg RSA -keysize 2048 -validity 10000'

### END ALIASES
###################

# Git completion (branches, etc)
test -f ~/.local/bin/.git-completion.bash && . $_

export VISUAL=vim
export EDITOR="$VISUAL"

export VIRTUALENVWRAPPER_PYTHON="/Users/kyleamazza/.pyenv/versions/3.8.0/bin/python"
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Documents/projects
source /usr/local/bin/virtualenvwrapper.sh

# Go
export GOPATH=$HOME/go # Default GOPATH
goget() {
  go get "$@" && asdf reshim golang
}

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
eval "$(rbenv init -)"

### Change PS1 by function, in order to change properly when a bad command is

PROMPT_COMMAND=ps1

GREEN='\[\033[0;32m\]'
RED='\[\033[0;31m\]'
BLUE='\[\033[1;34m\]'
YELLOW='\[\033[1;33m\]'
COLOR_NONE='\[\e[0m\]'

function set_virtualenv () {
  if test -z "$VIRTUAL_ENV" ; then
    PYTHON_VIRTUALENV=""
  else
    PYTHON_VIRTUALENV="\n${GREEN}(pyenv:`basename \"$VIRTUAL_ENV\"`)${COLOR_NONE}"
  fi
}

function is_git_repo {
  git branch > /dev/null 2>&1
}

function set_git_branch {
  git_status="$(git status 2> /dev/null)"

  if [[ ${git_status} =~ "working tree clean" ]]; then
    state="${GREEN}"
  elif [[ ${git_status} =~ "Changes to be committed" ]]; then
    state="${YELLOW}"
  else
    state="${RED}"
  fi

  remote_pattern="Your branch is (.*) of"
  if [[ ${git_status} =~ ${remote_pattern} ]]; then
    if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
      remote="^"
    else
      remote="v"
    fi
  else
    remote=""
  fi

  diverge_pattern="Your branch and (.*) have diverged"
  if [[ ${git_status} =~ ${diverge_pattern} ]]; then
    remote=":"
  fi

  branch_pattern="On branch ([^${IFS}]*)"
  if [[ "${git_status}" =~ ${branch_pattern} ]]; then
    branch=${BASH_REMATCH[1]}
  fi

  BRANCH="${state}(git:${branch})${remote}${COLOR_NONE} "
}

function ps1 {
  ### PS1
  if [ $? -eq "0" ]
    then 
      SC="${GREEN}+"
    else
      SC="${RED}-"
  fi

  if is_git_repo ; then
    set_git_branch
  else
    BRANCH=''
  fi

  set_virtualenv
  source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"

  PS1="{\[$(tput sgr0)\]\[\033[38;5;10m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;226m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]}:\w [${SC}\[\e[0m\]]${PYTHON_VIRTUALENV}${BRANCH}[$(kube_ps1)]\n >>> \[$(tput sgr0)\]"
}
### END PS1 stuff


source "$HOME/.homesick/repos/homeshick/homeshick.sh"

if which swiftenv > /dev/null; then eval export PATH="/Users/kyleamazza/.swiftenv/shims:${PATH}" command swiftenv rehash 2>/dev/null source '/usr/local/Cellar/swiftenv/1.4.0/bin/../libexec/../completions/swiftenv.bash'; fi
export PATH="/usr/local/sbin:$PATH"

. $HOME/.asdf/asdf.sh

# opam configuration
test -r /Users/kyleamazza/.opam/opam-init/init.sh && . /Users/kyleamazza/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
