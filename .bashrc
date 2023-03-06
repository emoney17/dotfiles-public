#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#PS1='[\u@\h \w]\$ '
PS1='\w '
#PS1='\[\e[0;92m\]\u\[\e[0;92m\]@\[\e[0;92m\]\h\[\e[0m\]:\[\e[0;94m\]\w\[\e[0;94m\]\$\[\e[0m\] '

alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -lo'
alias la='ls -alo'

alias ..='cd ../'
alias ...='cd ../..'
alias ....='cd ../../..'

alias gs='git status'
alias ga='git add'
alias gaa='git add -A'
alias gm='git commit -m'
alias gmc='git commit -m "commit"'
alias gpp='git push origin master'
alias gp='git pull origin master'

alias lf='lfrun'

export EDITOR="nvim"
export READER="zathura"
export IMAGE="feh"
export TERMINAL="st"
export BROWSER="librewolf"
export VIDEO="mpv"

PATH=$PATH:~/.local/bin
