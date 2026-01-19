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

alias q='rlwrap ~/q/l32/q'

alias ssh='TERM=linux ssh'

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

eval "$(fzf --bash)"

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

export PATH="/home/neel/.local/share/sentry-devenv/bin:$PATH"

eval "$(direnv hook bash)"

export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# sentry-testing
export SENTRY_KUBE_KUBECTL_VERSION=1.24.3
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
export SENTRY_KUBE_CUSTOMER=sass

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/neel/google-cloud-sdk/path.bash.inc' ]; then . '/home/neel/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/neel/google-cloud-sdk/completion.bash.inc' ]; then . '/home/neel/google-cloud-sdk/completion.bash.inc'; fi
. "$HOME/.cargo/env"
