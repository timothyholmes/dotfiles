
alias srcp='source ~/.bash_profile'
alias ll='ls -FGlAhp'
alias ca='code -a .'

for a in $(ls ~/Projects/); do alias $a="cd ~/Projects/$a && if [ -d ./.git ]; then git status; fi;"; done
