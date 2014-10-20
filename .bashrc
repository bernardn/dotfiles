# .bashc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

JAVA_HOME='/etc/alternatives/jre'; export JAVA_HOME

# User specific aliases and functions
### MY ALIASES ###
##################

# git command autocompletion script
source ~/bin/git-completion.bash

# git commamands simplified
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

# ls alias for color-mode
alias lh='ls -lhaG'

# lock computer
# OSX
if [[ -d '/System/Library/CoreServices' ]]; then
	alias lock='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'
fi


# hibernation and sleep settings
alias hibernate='sudo pmset -a hibernatemode 25'
alias sleep='sudo pmset -a hibernatemode 0'
alias safesleep='sudo pmset -a hibernatemode 3'
alias smartsleep='sudo pmset -a hibernatemode 2'

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

# proxy tunnel
#alias proxy='ssh -D XXXX -p XXXX USER@DOMAIN'
# ssh home
#alias sshome='ssh -p XXXX USER@DOMAIN'

# processes
#alias ps='ps -ax'

# refresh shell
alias reload='source ~/.bash_profile'

TERM=xterm
export TERM

# Load AWS-related stuff
test -f ~/.aws.rc && source ~/.aws.rc

export PATH=~/bin:$PATH
 
txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset
 
source ~/bin/git-prompt.sh

PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\]\[\e[0;32m\]$(__git_ps1 " (%s)")\[\e[1;32m\] \$\[\e[m\] \[\e[0;37m\]'
