if [ -n "$ZSH_VERSION" ]; then
    shell=zsh
elif [ -n "$BASH_VERSION" ]; then
    shell=bash
fi

[ -f ~/.fzf.$shell ] && source ~/.fzf.$shell 2> /dev/null
