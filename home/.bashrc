PATH=/Users/kyleamazza/.cargo/bin:/Users/kyleamazza/.cabal/bin:/Users/kyleamazza/.ghcup/bin:/Users/kyleamazza/.local/bin:/Users/kyleamazza/.swiftenv/shims:/usr/local/bin:/Users/kyleamazza/.yarn/bin:/Users/kyleamazza/.config/yarn/global/node_modules/.bin:/Users/kyleamazza/.rbenv/shims:/Users/kyleamazza/.rbenv/shims:/Users/kyleamazza/.rbenv/bin:/Users/kyleamazza/.nvm/versions/node/v10.16.3/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin

export PATH="/Users/kyleamazza/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Auto 'cd's into directory if the argument is not a command
shopt autocd

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

# history
alias hgrep='history | grep'

# Get ports
alias ports='ss -nutpal'

alias doc='cd ~/Documents'
alias proj='cd ~/Documents/projects'
alias ss='cd ~/Documents/self-study'

alias ..='cd ../'

export BOOKS="~/Documents/books"
alias books="cd $BOOKS"

export VISUAL=vim
export EDITOR="$VISUAL"

export VIRTUALENVWRAPPER_PYTHON="/Users/kyleamazza/.pyenv/versions/3.8.0/bin/python"
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Documents/projects
source /usr/local/bin/virtualenvwrapper.sh

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

  PS1="{\[$(tput sgr0)\]\[\033[38;5;10m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;226m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]}:\w [${SC}\[\e[0m\]]${PYTHON_VIRTUALENV}${BRANCH}\n >>> \[$(tput sgr0)\]"
}
### END PS1 stuff


source "$HOME/.homesick/repos/homeshick/homeshick.sh"

if which swiftenv > /dev/null; then eval export PATH="/Users/kyleamazza/.swiftenv/shims:${PATH}" command swiftenv rehash 2>/dev/null source '/usr/local/Cellar/swiftenv/1.4.0/bin/../libexec/../completions/swiftenv.bash'; fi
