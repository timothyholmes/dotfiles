#iir!/bin/bash
alias editalias='subl ~/.bash_aliases; source ~/.bash_aliases'
alias edithosts='sudo vim /etc/hosts'

# Source Bash Profile
alias srcp='source ~/.bash_profile'

for a in $(ls ~/Sites/); do alias $a="cd ~/Sites/$a && if [ -d ./.git ]; then git status; fi;"; done

# List files
alias la='ls -A'
alias ll='ls -FGlAhp'
alias l='ls -FGlAhp'

# Atom
alias a='atom .'
alias aa='atom -a .'

# VSCode
alias ca='code -a .'

# Hidden Files
alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES && killall Finder'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO && killall Finder'

alias weather='curl -4 http://wttr\.in'

# AUTO COMPLETE
function _clientdirs()
{
    local curw
    COMPREPLY=()
    curw=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=($(compgen -W '`ls ~/dev`' -- $curw))
    return 0
}

function g()
{
    cd ~/dev/$1
}

complete -F _clientdirs g
