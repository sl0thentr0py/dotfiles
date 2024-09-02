# Setup fzf
# ---------
if [[ ! "$PATH" == */home/neel/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/neel/.fzf/bin"
fi

eval "$(fzf --bash)"
