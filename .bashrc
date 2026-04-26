# ~/.bashrc estilo Kali para Termux
#
# Se não for interativo, não faz nada
case $- in
    *i*) ;;
      *) return;;
esac

# Não duplicar linhas no histórico
HISTCONTROL=ignoreboth:erasedups

# Tamanho do histórico
HISTSIZE=2000
HISTFILESIZE=3000
HISTTIMEFORMAT="%F %T "

# Append ao invés de sobrescrever
shopt -s histappend

# Verificar tamanho da janela
shopt -s checkwinsize

# Habilitar globstar para **
shopt -s globstar

# Completions
if ! shopt -oq posix; then
    if [ -f "$PREFIX/share/bash-completion/bash_completion" ]; then
        . "$PREFIX/share/bash-completion/bash_completion"
    elif [ -f "$PREFIX/etc/bash_completion" ]; then
        . "$PREFIX/etc/bash_completion"
    fi
fi

# Aliases úteis estilo Kali
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

alias allports='netstat -tulpn | grep -E "LISTEN|ESTABLISHED"'
alias tcpconn='netstat -tpn | grep ESTABLISHED'
alias udpconn='netstat -upn'
alias procs='ps aux | head -20'
alias killport='fkill() { kill -9 $(lsof -t -i:$1); }; fkill'


# Cores para comandos específicos
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Detectar se é root (UID 0) ou usuário normal
if [ "$EUID" -eq 0 ]; then
    # Root - Vermelho
    PS1='\[\e[1;31m\]┌──\[\e[1;31m\](\[\e[1;37m\]root\[\e[1;31m\])-(\[\e[1;34m\]\w\[\e[1;31m\])\n\[\e[1;31m\]└─\[\e[1;31m\](\[\e[1;31m\]\$\[\e[1;31m\])\[\e[0m\] '
else
    # Usuário normal - Verde
    PS1='\[\e[1;32m\]┌──\[\e[1;32m\](\[\e[1;37m\]\u@\h\[\e[1;32m\])-(\[\e[1;34m\]\w\[\e[1;32m\])\n\[\e[1;32m\]└─\[\e[1;32m\](\[\e[1;32m\]\$\[\e[1;32m\])\[\e[0m\] '
fi

# Título da janela (para terminais que suportam)
case "$TERM" in
    xterm*|rxvt*|termux*)
        PS1="\[\e]0;\u@\h: \w\a\]$PS1"
        ;;
esac

# Comando para mostrar a cor do prompt
alias prompt-root='echo -e "\e[1;31mRoot mode\e[0m"'
alias prompt-user='echo -e "\e[1;32mUser mode\e[0m"'

# Mostrar info do sistema (estilo Kali)
alias sysinfo='echo "OS: $(uname -o)"; echo "Kernel: $(uname -r)"; echo "Uptime: $(uptime -p)"; echo "Shell: $SHELL"; echo "Terminal: $TERM"'

# Comando 'l' para listar com detalhes
alias l='ls -la --color=auto'
alias l.='ls -d .* --color=auto'
alias lh='ls -lh --color=auto'
alias lt='ls -lt --color=auto'
alias ltr='ls -ltr --color=auto'


# Segurança extra no Termux
alias chmod='chmod --preserve-root'
alias chown='chown --preserve-root'

# Caminho do Termux
export PREFIX=/data/data/com.termux/files/usr
export PATH=$PREFIX/bin:$PATH

# Não salvar comandos repetidos
HISTCONTROL=ignoredups:erasedups

# Comando 'tree' se disponível
if command -v tree &> /dev/null; then
    alias tree='tree -C'
fi

# Git prompt opcional
if [ -f "$PREFIX/libexec/git-core/git-sh-prompt" ]; then
    . "$PREFIX/libexec/git-core/git-sh-prompt"
    GIT_PS1_SHOWDIRTYSTATE=1
    GIT_PS1_SHOWUNTRACKEDFILES=1
    GIT_PS1_SHOWUPSTREAM="auto"
fi


alias allports="netstat -tulpn"
