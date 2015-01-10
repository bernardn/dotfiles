# .bashc
echo -en "\033[1;30mLoading common:"

export TERM=xterm

### Timezone
# Change session timezone
function tz {
		test -z $1 && echo $TZ || export TZ=$1; ttz=$(date '+%Z');
		test "! -z $1 & $ttz != $1" && export TZ=$ttz;
}

# Set Current timezone
test -z $TZ && tz=$(date '+%Z') && echo -n " $tz" && tz $tz;

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Git states in prompt when in Git repos
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM=""

# Locale fix
LC_FALLBACK=$(locale -a|egrep -ie 'en_us.utf.?8')

### ALIASES ###

# directory listings
alias ls='ls -hG'
alias ll='ls -l'
alias la='ls -la'

# up 'n' folders
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# simple ip
alias ips='ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d" " -f2'
# more details
alias ip2="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
# external ip
alias ip-wan="curl -s http://wtfismyip.com/text | awk '{print $1}'"

# grep with color
alias grep='grep --color=auto'

# SSH
alias    ssh-insecure='ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
function ssh-exec      { s="$1" && shift && ssh "$s" "bash -c '$*'" ; }
function ssh-exec-file { test -f "$2" && test -x "$2" && ssh "$1" "bash -s " <  "$2"  ; }

# Disk usage
function du-max { d=${1:-"."}; n=${2:-"15"}; test -d "$d" && du -m "$d" 2>/dev/null | grep ^[1-9][0-9]*\\s | sort -nr -k 1 | head -n "$n" || echo Directory "$d" disk usage analysis Failed.; }

# Group members
function group-members { grep ^"$1" /etc/group | awk -F':' '/'"$1"'/{print $4}' | tr ',' '\n' | sort | uniq | xargs; }

# processes
alias psx='ps -ax'

# password generator
function pw-gen { c=${1:-32}; dd if=/dev/random of=/dev/stdout bs="$c" count=1 2>/dev/null|base64|sed 's/=*$//'; }

# refresh shell
alias reload='source ~/.bash_profile'

### Prompt
PS1_OLD=${PS1}
PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\]\[\e[1;92m\]$EXTRAPS1\[\e[1;32m\] \$\[\e[m\] \[\e[0;37m\]'

### Import custom files
ls -A ~/.bashrc.d>/dev/null 2>&1 && for f in ~/.bashrc.d/*; do source "$f"; done

### User bin dir in path
export PATH=~/bin:$PATH

echo