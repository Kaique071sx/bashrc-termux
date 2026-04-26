case $- in
    *i*) ;;
      *) return;;
esac


HISTCONTROL=ignoreboth:erasedups

HISTSIZE=2000
HISTFILESIZE=3000
HISTTIMEFORMAT="%F %T "


shopt -s histappend


shopt -s checkwinsize

shopt -s globstar


if ! shopt -oq posix; then
    if [ -f "$PREFIX/share/bash-completion/bash_completion" ]; then
        . "$PREFIX/share/bash-completion/bash_completion"
    elif [ -f "$PREFIX/etc/bash_completion" ]; then
        . "$PREFIX/etc/bash_completion"
    fi
fi


alias sdcard='cd /sdcard/'
alias ls='ls --color=auto -h'
alias ll='ls -la --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ps='ps aux | grep --color=always'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cat='bat --style=plain'
alias pstree='pstree -p'
alias mkdir='mkdir -pv'
alias update='apt update && apt upgrade -y'
alias search='apt search'
alias install='apt install'
alias uninstall='apt uninstall'
alias ports='netstat -tulpn'
alias connections='ss -tulpn'
alias clean='apt clean'
alias autoclean='apt autoremove'
alias sys='neofetch 2>/dev/null || termux-info'
alias allports="netstat -tulpn"
alias allports='netstat -tulpn | grep -E "LISTEN|ESTABLISHED"'
alias tcpconn='netstat -tpn | grep ESTABLISHED'
alias udpconn='netstat -upn'
alias procs='ps aux | head -20'
alias killport='fkill() { kill -9 $(lsof -t -i:$1); }; fkill'

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


if [ "$EUID" -eq 0 ]; then
    
    PS1='\[\e[1;31m\]┌──\[\e[1;31m\](\[\e[1;37m\]root\[\e[1;31m\])-(\[\e[1;34m\]\w\[\e[1;31m\])\n\[\e[1;31m\]└─\[\e[1;31m\](\[\e[1;31m\]\$\[\e[1;31m\])\[\e[0m\] '
else
    
    PS1='\[\e[1;32m\]┌──\[\e[1;32m\](\[\e[1;37m\]\u@\h\[\e[1;32m\])-(\[\e[1;34m\]\w\[\e[1;32m\])\n\[\e[1;32m\]└─\[\e[1;32m\](\[\e[1;32m\]\$\[\e[1;32m\])\[\e[0m\] '
fi

case "$TERM" in
    xterm*|rxvt*|termux*)
        PS1="\[\e]0;\u@\h: \w\a\]$PS1"
        ;;
esac


alias prompt-root='echo -e "\e[1;31mRoot mode\e[0m"'
alias prompt-user='echo -e "\e[1;32mUser mode\e[0m"'


alias sysinfo='echo "OS: $(uname -o)"; echo "Kernel: $(uname -r)"; echo "Uptime: $(uptime -p)"; echo "Shell: $SHELL"; echo "Terminal: $TERM"'


alias l='ls -la --color=auto'
alias l.='ls -d .* --color=auto'
alias lh='ls -lh --color=auto'
alias lt='ls -lt --color=auto'
alias ltr='ls -ltr --color=auto'


alias chmod='chmod --preserve-root'
alias chown='chown --preserve-root'


export PREFIX=/data/data/com.termux/files/usr
export PATH=$PREFIX/bin:$PATH


HISTCONTROL=ignoredups:erasedups


if command -v tree &> /dev/null; then
    alias tree='tree -C'
fi

if [ -f "$PREFIX/libexec/git-core/git-sh-prompt" ]; then
    . "$PREFIX/libexec/git-core/git-sh-prompt"
    GIT_PS1_SHOWDIRTYSTATE=1
    GIT_PS1_SHOWUNTRACKEDFILES=1
    GIT_PS1_SHOWUPSTREAM="auto"
fi