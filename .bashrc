#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

source /usr/share/doc/pkgfile/command-not-found.bash
source /usr/share/nvm/init-nvm.sh
alias vim=nvim
alias v=nvim

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export EDITOR=vim

export HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history

eval "$(fasd --init auto)"
alias j='fasd_cd -d'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
