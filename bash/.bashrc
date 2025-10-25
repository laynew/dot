#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

echo "[$(date +%Y%m%d%H%M%S)] loaded ~/.bashrc" >> ~/.mylog

! command -v __git_ps1 && [[ -f /usr/share/git/completion/git-prompt.sh ]] && . /usr/share/git/completion/git-prompt.sh

shopt -s checkwinsize
shopt -s histappend
HISTCONTROL=ignoreboth
HISTSIZE=100000
HISTFILESIZE=100000

alias ls='ls --color=auto'
alias ll='ls -laF'
alias grep='grep --color=auto'
alias s='systemctl'
alias lgit='lazygit'
alias info='info --vi-keys'

get_color () {
	hash_code="$(echo $1 | cksum | awk '{print $1}')"
	fg_color="$(( hash_code % 256 ))"
	echo "$fg_color"
}
fg_color="$(get_color $(cat /etc/hostname))"
COL_HOST="\[\033[38;5;${fg_color}m\]";
COL_USER="\[\033[38;5;$(get_color $USER)m\]";
COL_RESET="\[\033[0m\]"
COL_BLUE="\[\033[01;34m\]"
PS1="[${COL_USER}\u${COL_RESET}@${COL_HOST}\h${COL_RESET}:${COL_BLUE}\w${COL_RESET}\$(__git_ps1)] \\$ "

[[ $(tty) = "/dev/tty1" ]] && startx

[[ -z $TMUX && -n $(which start_tmux) && ! $(tty) =~ ^/dev/tty ]] && start_tmux
