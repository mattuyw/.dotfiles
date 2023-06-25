if [[ $- =~ i ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_TTY" ]]; then
  tmux attach-session -t $USER || tmux new-session -s $USER
fi

alias vim='nvim'
alias gpg-bye='gpg-connect-agent updatestartuptty /bye'

which thefuck > /dev/null 2>&1 && eval $(thefuck --alias)

export AWS_PROFILE=classic
export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/.ripgreprc"
export TMUX_PLUGIN_MANAGER_PATH="$HOME/.tmux/plugins/"

export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
gpg-bye > /dev/null 2>&1

# plugin manager
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-completions"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
[ -f /Users/mattuyw/.config/.gc ] && source /Users/mattuyw/.config/.gc 2> /dev/null
