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

PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
