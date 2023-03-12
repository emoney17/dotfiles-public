#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PATH=$PATH:~/.local/bin

PS1='[\u@\h \W]\$ '

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -l'
alias la='ls -al'

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
alias vim='nvim'

alias yt-dlp='yt-dlp --sub-langs en.* --embed-subs --embed-metadata'

export EDITOR="nvim"
export READER="zathura"
export IMAGE="feh"
export TERMINAL="st"
export BROWSER="librewolf"
export VIDEO="mpv"
