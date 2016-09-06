#iir!/bin/bash
alias editalias='subl ~/.bash_aliases; source ~/.bash_aliases'
alias edithosts='sudo vim /etc/hosts'

alias saymyname='echo "The Goblin"'

# RELOAD ALL BASH
alias reloadbash='source /etc/profile && source ~/.bash_profile && source ~/.bashrc && source ~/.bash_aliases'

# APACHE2
alias apacherestart='sudo apachectl restart'

for a in $(ls ~/Projects/); do alias $a="cd ~/Projects/$a"; done

# List files
alias ll='ls -alF'
alias la='ls -A'

alias a='atom .'
alias aa='atom -a .'
alias chr='open -a "Google Chrome"'

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
