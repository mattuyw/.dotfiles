#source $HOME/.bin/ensure_path.sh
#source $HOME/.bin/ensure_manpath.sh

#[ -n "$TMUX" ] && exec zsh --login

#export LSCOLORS=dxfxcxdxbxegedabagacad


if [ -n "$ZSH_VERSION" ]; then
    shell=zsh
elif [ -n "$BASH_VERSION" ]; then
    shell=bash
fi

#which starship > /dev/null 2>&1 && source <(starship init $shell --print-full-init)

[ -f ~/.fzf.$shell ] && source ~/.fzf.$shell 2> /dev/null
