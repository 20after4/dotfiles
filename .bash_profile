export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export EDITOR="subl -w"
export SVN_EDITOR="subl -w"

alias less="less -r"
alias gsvn="git svn"
alias gup='git-smart-pull'
alias gm='git-smart-merge'
alias gs='git status'
alias gpm='git pull && git push origin master'
alias gsl='git smart-log'

if [ "iTerm.app" == "$TERM_PROGRAM" ] ; then
       tabcolors[0]="160,160,160"
        tabcolors[1]="244,0,220"
        tabcolors[2]="0,200,244"
        tabcolors[3]="68,250,132"
        tabcolors[4]="80,48,200"
        tabcolors[5]="100,100,100"
        tabcolors[6]="220,42,88"
        tabcolors[7]="220,200,120"



        export TTYNUM=`ps -p $$ -o tty= | cut -c 5,6,7`

        tci=`expr $TTYNUM % ${#tabcolors[*]}`
        export TABCOLOR="${tabcolors[$tci]}"

        OIFS=$IFS
        set -- "$TABCOLOR"
        IFS=","; declare -a RGB=($*)
        IFS=$OIFS

        echo -e "\033]6;1;bg;red;brightness;${RGB[0]}\a\c"
        echo -e "\033]6;1;bg;green;brightness;${RGB[1]}\a\c"
        echo -e "\033]6;1;bg;blue;brightness;${RGB[2]}\a\c"
fi

BLACK="\[$(tput setaf 0)\\"
RED="\[$(tput setaf 1)\]"
GREEN="\[$(tput setaf 2)\]"
LIME="\[$(tput setaf 190)\]"
YELLOW="\[$(tput setaf 3)\]"
POWDER_BLUE="\[$(tput setaf 153)\]"
BLUE="\[$(tput setaf 4)\]"
MAGENTA="\[$(tput setaf 5)\]"
CYAN="\{$(tput setaf 6)\]"
WHITE="\[$(tput setaf 7)\]"
BRIGHT="\[$(tput bold)\]"
NORMAL="\[$(tput sgr0)\]"
UNDERLINE="\[$(tput smul)\]"

export GIT_PS1_SHOWUPSTREAM="auto"

function parse_git_branch {
   __git_ps1 "(%s)"
   # git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function _update_ps1()
{
   export PS1="$(~/bin/powerline-bash.py $?)"
}

# Poweline style bash prompt!
export PROMPT_COMMAND="_update_ps1"
