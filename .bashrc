# .bashc

# Show dirty state in prompt when in Git repos
export GIT_PS1_SHOWDIRTYSTATE=1

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Java
test -d /etc/alternatives/jre && export JAVA_HOME='/etc/alternatives/jre'

export PATH=~/bin:$PATH

# User specific aliases and functions
### ALIASES ###

# git command autocompletion script
test -f  ~/bin/git-completion.bash && source ~/bin/git-completion.bash

# git commands simplified
alias gst='git status'
alias gco='git checkout'
alias gci='git commit'
alias grb='git rebase'
alias gbr='git branch'
alias gad='git add -A'
alias gpl='git pull'
alias gpu='git push'
alias glg='git log --date-order --all --graph --format="%C(green)%h%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'
alias glg2='git log --date-order --all --graph --name-status --format="%C(green)%H%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'

# directory listings
#alias ls='ls --color=auto' 
alias ls='ls -hG'
alias ll='ls -l'
alias lla='ls -la'

# ls alias for color-mode
alias lh='ls -lhaG'

# OSX
if [[ -d '/System/Library/CoreServices' ]]; then
	test -f ~/.bashrc.osx && . ~/.bashrc.osx
fi

# up 'n' folders
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# simple ip
alias ip='ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\ -f2'
# more details
alias ip1="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
# external ip
alias ip2="curl -s http://www.showmyip.com/simple/ | awk '{print $1}'"

# grep with color
alias grep='grep --color=auto'

# processes
#alias ps='ps -ax'

# refresh shell
alias reload='source ~/.bash_profile'

export TERM=xterm

# Load AWS-related stuff
test -f ~/.aws.rc && source ~/.aws.rc


# Git prompt
test -f  ~/bin/git-prompt.sh && source ~/bin/git-prompt.sh

PS1_OLD=${PS1}
PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\]\[\e[1;92m\]$(__git_ps1 " (%s)")\[\e[1;32m\] \$\[\e[m\] \[\e[0;37m\]'