#########################
# git setup
#########################

# source git's ps1 script
$(brew --prefix &>/dev/null) && [[ -f $(brew --prefix)/etc/bash_completion.d/git-prompt.sh ]] && source `brew --prefix`/etc/bash_completion.d/git-prompt.sh

# display working directory state (* for modified/+ for staged)
GIT_PS1_SHOWDIRTYSTATE=true
# display stashed state ($ if there are stashed files)
GIT_PS1_SHOWSTASHSTATE=true
# display HEAD vs upstream state
GIT_PS1_SHOWUPSTREAM="auto"
# use colors
GIT_PS1_SHOWCOLORHINTS=true
# detached-head description
GIT_PS1_DESCRIBE_STYLE=branch

#########################
# colors (solarized)
#########################

declare -A COLORS

if tput setaf 1 &> /dev/null; then
  tput sgr0
  if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
    COLORS+=( [base03]=$(tput setaf 234) )
    COLORS+=( [base02]=$(tput setaf 235) )
    COLORS+=( [base01]=$(tput setaf 240) )
    COLORS+=( [base00]=$(tput setaf 241) )
    COLORS+=( [base0]=$(tput setaf 244) )
    COLORS+=( [base1]=$(tput setaf 245) )
    COLORS+=( [base2]=$(tput setaf 254) )
    COLORS+=( [base3]=$(tput setaf 230) )
    COLORS+=( [yellow]=$(tput setaf 136) )
    COLORS+=( [orange]=$(tput setaf 166) )
    COLORS+=( [red]=$(tput setaf 160) )
    COLORS+=( [magenta]=$(tput setaf 125) )
    COLORS+=( [violet]=$(tput setaf 61) )
    COLORS+=( [blue]=$(tput setaf 33) )
    COLORS+=( [cyan]=$(tput setaf 37) )
    COLORS+=( [green]=$(tput setaf 64) )
  else
    COLORS+=( [base03]=$(tput setaf 8) )
    COLORS+=( [base02]=$(tput setaf 0) )
    COLORS+=( [base01]=$(tput setaf 10) )
    COLORS+=( [base00]=$(tput setaf 11) )
    COLORS+=( [base0]=$(tput setaf 12) )
    COLORS+=( [base1]=$(tput setaf 14) )
    COLORS+=( [base2]=$(tput setaf 7) )
    COLORS+=( [base3]=$(tput setaf 15) )
    COLORS+=( [yellow]=$(tput setaf 3) )
    COLORS+=( [orange]=$(tput setaf 9) )
    COLORS+=( [red]=$(tput setaf 1) )
    COLORS+=( [magenta]=$(tput setaf 5) )
    COLORS+=( [violet]=$(tput setaf 13) )
    COLORS+=( [blue]=$(tput setaf 4) )
    COLORS+=( [cyan]=$(tput setaf 6) )
    COLORS+=( [green]=$(tput setaf 2) )
  fi
  COLORS+=( [bold]=$(tput bold) )
  COLORS+=( [reset]=$(tput sgr0) )
else
  # Linux console colors. I don't have the energy
  # to figure out the Solarized values
  COLORS+=( [magenta]="\033[1;31m" )
  COLORS+=( [orange]="\033[1;33m" )
  COLORS+=( [green]="\033[1;32m" )
  COLORS+=( [purple]="\033[1;35m" )
  COLORS+=( [white]="\033[1;37m" )
  COLORS+=( [bold]="" )
  COLORS+=( [reset]="\033[m" )
fi

__color() {
  echo "\[${COLORS[$1]}\]"
}

__ps1() {
  local ruby_version='$(__rbenv_ps1 "[%s] ")'
  local node_version='$(__nodenv_ps1 "[%s] ")'
  local cwd='\w'
  local git_state='$(__git_ps1 " (%s `git rev-parse --abbrev-ref @{u} 2>/dev/null`)")'
  local prompt='\$ '

  echo $(__color yellow)$node_version$(__color red)$ruby_version$(__color cyan)$cwd$(__color base2)$git_state
  echo '\[${COLORS[$prompt_color]}\]'$prompt$(__color reset)
}

export PROMPT_COMMAND='if [ $? -eq 0 ]; then prompt_color=base2; else prompt_color=red; fi;'$PROMPT_COMMAND
export PS1=$( __ps1 )