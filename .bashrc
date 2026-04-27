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
shopt -s cdspell
shopt -s dirspell

if ! shopt -oq posix; then
    if [ -f "$PREFIX/share/bash-completion/bash_completion" ]; then
        . "$PREFIX/share/bash-completion/bash_completion"
    elif [ -f "$PREFIX/etc/bash_completion" ]; then
        . "$PREFIX/etc/bash_completion"
    fi
fi

export PREFIX=/data/data/com.termux/files/usr
export PATH=$PREFIX/bin:$PATH

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

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
alias allports='netstat -tulpn | grep -E "LISTEN|ESTABLISHED"'
alias tcpconn='netstat -tpn | grep ESTABLISHED'
alias udpconn='netstat -upn'
alias procs='ps aux | head -20'
alias killport='fkill() { kill -9 $(lsof -t -i:$1); }; fkill'
alias prompt-root='echo -e "\e[1;31mRoot mode\e[0m"'
alias prompt-user='echo -e "\e[1;32mUser mode\e[0m"'
alias sysinfo='echo "OS: $(uname -o)"; echo "Kernel: $(uname -r)"; echo "Uptime: $(uptime -p)"; echo "Shell: $SHELL"; echo "Terminal: $TERM"'
alias l.='ls -d .* --color=auto'
alias lh='ls -lh --color=auto'
alias lt='ls -lt --color=auto'
alias ltr='ls -ltr --color=auto'
alias chmod='chmod --preserve-root'
alias chown='chown --preserve-root'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias path='echo -e "${PATH//:/\\n}"'
alias untar='tar -xvf'

mkcd() { mkdir -pv "$1" && cd "$_"; }
cdl()  { cd "$1" && ls -la --color=auto; }
extract() {
    if [ -f "$1" ] ; then
        case "$1" in
            *.tar.bz2|*.tbz2) tar xvjf "$1"   ;;
            *.tar.gz|*.tgz)   tar xvzf "$1"   ;;
            *.tar.xz|*.txz)   tar xvJf "$1"   ;;
            *.bz2)            bunzip2 "$1"     ;;
            *.rar)            unrar x "$1"     ;;
            *.gz)             gunzip "$1"      ;;
            *.tar)            tar xvf "$1"    ;;
            *.zip|*.ZIP)      unzip "$1"       ;;
            *.xz)             unxz "$1"        ;;
            *.7z)             7z x "$1"        ;;
            *.zst)            unzstd "$1"      ;;
            *)                echo "'$1' não reconhecido como arquivo comprimido." ;;
        esac
    else
        echo "'$1' não é um arquivo válido."
    fi
}

if command -v tree &> /dev/null; then
    alias tree='tree -C'
fi

if command -v dircolors &> /dev/null; then
    eval "$(dircolors -b)"
else
    export LS_COLORS='di=1;34:ln=1;36:so=1;35:pi=33:ex=1;32:bd=1;33:cd=1;33:su=1;31:sg=1;31:tw=1;34:ow=1;34'
fi

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

KALI_HOST="kali"
if [ "$EUID" -eq 0 ]; then
    PS1='\[\e[1;31m\]┌──\[\e[1;31m\](\[\e[1;37m\]root\[\e[1;31m\]㉿'$KALI_HOST'\[\e[1;31m\])-(\[\e[1;34m\]\w\[\e[1;31m\])\n\[\e[1;31m\]└─\[\e[1;31m\](\[\e[1;31m\]\$\[\e[1;31m\])\[\e[0m\] '
else
    PS1='\[\e[1;32m\]┌──\[\e[1;32m\](\[\e[1;37m\]\u㉿'$KALI_HOST'\[\e[1;32m\])-(\[\e[1;34m\]\w\[\e[1;32m\])\n\[\e[1;32m\]└─\[\e[1;32m\](\[\e[1;32m\]\$\[\e[1;32m\])\[\e[0m\] '
fi

case "$TERM" in
    xterm*|rxvt*|termux*)
        PS1="\[\e]0;\u@\h: \w\a\]$PS1"
        ;;
esac

if [ -f "$PREFIX/libexec/git-core/git-sh-prompt" ]; then
    . "$PREFIX/libexec/git-core/git-sh-prompt"
    GIT_PS1_SHOWDIRTYSTATE=1
    GIT_PS1_SHOWUNTRACKEDFILES=1
    GIT_PS1_SHOWUPSTREAM="auto"
fi

if [[ $- == *i* ]]; then
    echo -e "\e[1;34m┌─── Sistema ─────────────────────\e[0m"
    echo -e "\e[1;36m OS     :\e[0m $(uname -o)"
    echo -e "\e[1;36m Kernel :\e[0m $(uname -r)"
    echo -e "\e[1;36m Uptime :\e[0m $(uptime -p 2>/dev/null || uptime)"
    echo -e "\e[1;36m Shell  :\e[0m $SHELL"
    echo -e "\e[1;36m Term   :\e[0m $TERM"
    echo -e "\e[1;34m└─────────────────────────────────\e[0m"
fi
