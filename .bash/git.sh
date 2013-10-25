#########################
# aliases
#########################

alias gs='git status'
alias ga='git add'
alias gai='git add --interactive'
alias gap='git add -p'
alias gb='git branch'
alias gc='git commit'
alias gr='git reset'
alias grp='git reset -p'
alias gd='git diff'
alias gdword='git diff --word-diff'
alias gdc='git diff --cached'
alias go='git checkout'
alias gop='git checkout -p'
alias gk='gitk --all&'
alias gx='gitx --all'
alias glog='git glog'
alias gh='git hist'
alias giton='export GIT_PS1_SHOWDIRTYSTATE=true && export GIT_PS1_SHOWSTASHSTATE=true && export GIT_PS1_SHOWUPSTREAM=verbose'
alias gitoff='unset GIT_PS1_SHOWDIRTYSTATE && unset GIT_PS1_SHOWSTASHSTATE && unset GIT_PS1_SHOWUPSTREAM'


#alias gbc='git branch --contains'
#alias grb='git rebase'
#alias gl='git log'
#alias glp='git log -m -p -- '
#alias glps='git log -p -S'
#alias gbl='git blame'
#alias gg='git grep'


#########################
# completion
#########################

[[ -f $(brew --prefix)/etc/bash_completion.d/git-completion.bash ]]    && source $(brew --prefix)/etc/bash_completion.d/git-completion.bash

[[ -f $(brew --prefix)/etc/bash_completion.d/hub.bash_completion.sh ]] && source $(brew --prefix)/etc/bash_completion.d/hub.bash_completion.sh && __git_complete hub __git_main

#########################
# ps1
#########################

# see ~/.bash/ps1.sh
