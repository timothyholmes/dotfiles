
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

PROMPT_COMMAND='RET=$?;'

function _returnLambda {
   if [[ $RET = 0 ]]; then echo -e '\033[01;32m'; else echo -e '\033[01;31m'; fi;
}

PS1='\[$(_returnLambda)\]* \[\033[0;34m\]\W \[$(_returnLambda)\]> \[\033[0;97m\]'
# PS1='\[$(_returnLambda)\]* \[\033[0;34m\]\W \[$(_returnLambda)\]> \[\033[0;30m\]'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
