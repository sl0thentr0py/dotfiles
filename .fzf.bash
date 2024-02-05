# Setup fzf
# ---------
if [[ ! "$PATH" == */home/neel/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/neel/.fzf/bin"
fi

# Auto-completion
# ---------------
source "/home/neel/.fzf/shell/completion.bash"

# Key bindings
# ------------
source "/home/neel/.fzf/shell/key-bindings.bash"
