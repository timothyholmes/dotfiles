[ -z "$PS1" ] && return

HISTCONTROL=ignoredups:ignorespace

shopt -s histappend

HISTSIZE=50000
HISTFILESIZE=100000

PROMPT_COMMAND='RET=$?;'

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

PS1='\[$(_returnLambda)\]λ \W$(__git_ps1) $ \[\033[01;00m\]'
# for branch info: \W$(__git_ps1)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

ulimit -n 9999
