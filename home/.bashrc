### EXPORTS
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export CECS476PW=fhnpzy06

export ANDROID_SDK=/home/kyleamazza/Android/Sdk
export PATH=$PATH:$HOME/bin:$HOME/.rbenv/bin:/home/opt/android-studio/bin:/home/opt/UnityHub/:/home/opt/terraform:/home/opt/gawk-5.0.0/:~/.nvm/versions/node/**/bin:/home/opt/firefox:/home/opt/geckodriver/
export PATH=$ANDROID_SDK/emulator:$ANDROID_SDK/tools:$PATH
export PATH="/usr/local/go/bin/:$PATH"

export VISUAL=vim
export GOPATH="/home/kyleamazza/go"
export EDITOR="$VISUAL"

export TAMZEN=~/.fonts/tamzen-font/bdf
export BOOKS="/media/windows/computer_science"
export LBSU="/home/kyleamazza/Documents/lbsu" 
export SELF_STUDY=~/Documents/self-study
export PROJECTS=~/Documents/projects
export KALOOH=~/Documents/lbsu/491acecs/kalooh
export ME="/media/windows/me"

export PYTHONSTARTUP="/home/kyleamazza/.pythonstartup"

getip() { curl -s ifconfig.me | xargs echo; }; 

########################
### ALIASES
########################
### Standard Bash Aliases
alias ls='ls --color -A'
alias ll='ls -l'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias books="cd $BOOKS"

alias pia="/home/opt/pia/run.sh"

### Python virtualenvwrapper
VIRTUALENVWRAPPER_PYTHON="/usr/local/bin/python3.7"
source "/home/kyleamazza/.local/bin/virtualenvwrapper.sh"

# alias docker="podman" # The world is not ready yet...for podman-compose. Since it doesn't exist :'(

### Yarn Aliases
# Could improve with 'case' statement
yarn() {
  if [[ $1 == "i" ]]; then
    command yarn add ${@:2}
  elif [[ $1 = "id" ]]; then
    command yarn add ${@:2} --dev 
  else
    command yarn $@
  fi
}

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
    PYTHON_VIRTUALENV="${GREEN}(pyenv:`basename \"$VIRTUAL_ENV\"`)${COLOR_NONE}\n"
  fi
}

function is_git_repo {
  git branch > /dev/null 2>&1
}

function set_git_branch {
  git_status="$(git status 2> /dev/null)"
  
  if [[ ${git_status} =~ "working directory clean" ]]; then
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

  BRANCH="${state}(${branch})${remote}${COLOR_NONE} "
}

function ps1 () {
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

PS1="${PYTHON_VIRTUALENV}{\[$(tput sgr0)\]\[\033[38;5;10m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;226m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]}:\w [${SC}\[\e[0m\]] ${BRANCH}\n >>> \[$(tput sgr0)\]"
}

### END PS1 stuff

# RBENV
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi


# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /home/kyleamazza/.nvm/versions/node/v12.3.1/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /home/kyleamazza/.nvm/versions/node/v12.3.1/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /home/kyleamazza/.nvm/versions/node/v12.3.1/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /home/kyleamazza/.nvm/versions/node/v12.3.1/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /home/kyleamazza/.nvm/versions/node/v12.3.1/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.bash ] && . /home/kyleamazza/.nvm/versions/node/v12.3.1/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.bash

# Homeshick
source $HOME/.homesick/repos/homeshick/homeshick.sh

