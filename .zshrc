#if [[ $- =~ i ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_TTY" ]]; then
#  tmux attach-session -t $USER || tmux new-session -s $USER
#fi

alias vim='nvim'
alias gpg-bye='gpg-connect-agent updatestartuptty /bye'

command -v thefuck > /dev/null 2>&1 && eval $(thefuck --alias)

export AWS_PROFILE=ClassicProduction.CoreServices
export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/.ripgreprc"
export TMUX_PLUGIN_MANAGER_PATH="$HOME/.tmux/plugins/"

# plugin manager
if [ -f "$HOME/.local/share/zap/zap.zsh" ]; then
  source "$HOME/.local/share/zap/zap.zsh"
  plug "zsh-users/zsh-autosuggestions"
  plug "zsh-users/zsh-syntax-highlighting"
  plug "zsh-users/zsh-completions"
fi

# Generated for envman. Do not edit.
# [ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
[ -f /Users/mattuyw/.config/.gc ] && source /Users/mattuyw/.config/.gc 2> /dev/null

export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
gpg-bye > /dev/null 2>&1

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
