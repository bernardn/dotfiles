# .bashc
echo -en "\033[1;30mLoading common:"

export TERM=xterm

### Timezone

# Set Current timezone
# test -z $TZ && tz=$(date '+%Z') && echo -n " $tz" && tz $tz;

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Locale fix
LC_FALLBACK=$(locale -a|egrep -ie 'en_us.utf.?8')

### Prompt
PS1_OLD=${PS1}
PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\]\[\e[1;92m\]$(__git_ps1 " | %s")\[\e[1;32m\] \$\[\e[m\] \[\e[0;37m\]'

### Import custom files
ls -A ~/.dotfiles/.bashrc.d>/dev/null 2>&1 && for f in ~/.dotfiles/.bashrc.d/*; do source "$f"; done

### User bin dir in path
export PATH=~/bin:$PATH

echo
