export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell" # TODO
HYPHEN_INSENSITIVE="true"
zstyle ':omz:update' mode reminder  # just remind me to update when it's time
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(git pass asdf)
source $ZSH/oh-my-zsh.sh

### ALIASES ###
alias vim=nvim
alias v=nvim

alias pp='pass fzf'

alias be='bundle exec'
alias ber='bundle exec rspec'

### ENV ###
export EDITOR='nvim'
export HOMEBREW_NO_AUTO_UPDATE=1
export PASSWORD_STORE_ENABLE_EXTENSIONS=true
export PATH="/Users/neel/.local/share/sentry-devenv/bin:$PATH"
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

eval "$(direnv hook zsh)"
eval "$(zoxide init --cmd j zsh)"
source <(fzf --zsh)
