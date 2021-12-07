#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='exa -l --git'
PS1='[\u@\h \W]\$ '

source /usr/share/doc/pkgfile/command-not-found.bash
alias vim=nvim
alias v=nvim
alias git=hub

alias ggs='git status '
alias gga='git add -p'
alias ggb='git branch '
alias ggp='git push '
alias ggc='git commit'
alias ggd='git diff'
alias ggco='git checkout '

alias tb='tig blame'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/go/bin"
export EDITOR=nvim
export ERL_AFLAGS="-kernel shell_history enabled"
export _JAVA_AWT_WM_NONREPARENTING=1

export HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history

export MM_DEBUG=1

eval "$(fasd --init auto)"
alias j='fasd_cd -d -1'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# added by travis gem
[ ! -s /home/neel/.travis/travis.sh ] || source /home/neel/.travis/travis.sh
source "$HOME/.cargo/env"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/neel/software/google-cloud-sdk/path.bash.inc' ]; then . '/home/neel/software/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/neel/software/google-cloud-sdk/completion.bash.inc' ]; then . '/home/neel/software/google-cloud-sdk/completion.bash.inc'; fi

source "$HOME/.secret_env"
eval "$(pyenv init -)"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
