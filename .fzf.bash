# Setup fzf
# ---------
if [[ ! "$PATH" == */home/neel/.fzf/bin* ]]; then
  export PATH="$PATH:/home/neel/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/neel/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/neel/.fzf/shell/key-bindings.bash"
source "/home/neel/.config/fzf-git-functions.bash"

