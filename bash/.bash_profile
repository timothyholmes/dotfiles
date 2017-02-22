[ -z "$PS1" ] && return

HISTCONTROL=ignoredups:ignorespace

shopt -s histappend

HISTSIZE=50000
HISTFILESIZE=100000

PROMPT_COMMAND='RET=$?;'

function _returnLambda {
   if [[ $RET = 0 ]]; then echo -e '\033[01;32m'; else echo -e '\033[01;31m'; fi;
}

if [ -f ~/.git-prompt.sh ]; then
    . ~/.git-prompt.sh
fi

GIT_PS1_SHOWDIRTYSTATE="true"
GIT_PS1_SHOWSTASHSTAT="true"
GIT_PS1_SHOWUNTRACKEDFILES="true"
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS="true"
MONGO_URL="mongodb://localhost:27017/"

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Top PS 1 is light text, bottom is dark
# PS1='\[$(_returnLambda)\]* \[\033[0;34m\]\W [\[\033[0;33m\]$(__git_ps1)\[\033[0;34m\]]\[$(_returnLambda)\] > \[\033[0;97m\]'
PS1='\[$(_returnLambda)\]* \[\033[0;34m\]\W [\[\033[0;35m\]$(__git_ps1)\[\033[0;34m\]]\[$(_returnLambda)\] > \[\033[0;30m\]'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

ulimit -n 9999
