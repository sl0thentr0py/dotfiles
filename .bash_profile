#
# ~/.bash_profile
#

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

[[ -f ~/.bashrc ]] && . ~/.bashrc

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
source "$HOME/.cargo/env"
eval "$(pyenv init --path)"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# virtualenvwrapper
export WORKON_HOME=~/.venvs
source $HOME/.pyenv/versions/3.9.7/bin/virtualenvwrapper.sh
