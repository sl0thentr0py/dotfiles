#
# ~/.bash_profile
#
[[ -f ~/.bashrc ]] && . ~/.bashrc

if uwsm check may-start; then
    exec uwsm start hyprland-uwsm.desktop
fi

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

case ":$PATH:" in
    *:/home/neel/.juliaup/bin:*)
        ;;

    *)
        export PATH=/home/neel/.juliaup/bin${PATH:+:${PATH}}
        ;;
esac

# <<< juliaup initialize <<<

. "$HOME/.local/share/../bin/env"
