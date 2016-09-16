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

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

PS1='\[$(_returnLambda)\]☀︎ \W $(__git_ps1)\[$(_returnLambda)\] ➤ \[\033[01;00m\]'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

ulimit -n 9999
