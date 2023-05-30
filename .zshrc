if [[ $- =~ i ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_TTY" ]]; then
  tmux attach-session -t $USER || tmux new-session -s $USER
fi

alias ll="ls -lh"
alias la="ls -la"
alias ls='lsd'
alias vim='nvim'
alias cat='bat --paging=never'
alias gpg-bye='gpg-connect-agent updatestartuptty /bye'
export PIP_REQUIRE_VIRTUALENV=true

# Created by `pipx` on 2022-06-13 16:27:17
#export PIPX_DEFAULT_PYTHON="$HOME/.pyenv/versions/3.11.1/bin/python"
export PATH="$PATH:$HOME/.local/pipx/venvs"
export PATH="$PATH:$HOME/.local/bin"
export PATH="/usr/local/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/.ripgreprc"
export TMUX_PLUGIN_MANAGER_PATH="$HOME/.tmux/plugins/"

export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
gpg-bye > /dev/null 2>&1
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# plugin manager
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-completions"

which thefuck > /dev/null 2>&1 && eval $(thefuck --alias)
which starship > /dev/null 2>&1 && source <(starship init zsh --print-full-init)

export FZF_DEFAULT_COMMAND="fd . $HOME"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"

ssm(){
  aws ssm start-session --target $(aws ec2 describe-instances --filters "Name=tag:Name,Values=$1" "Name=instance-state-name,Values=running" --query "Reservations[*].Instances[*].[InstanceId]" --output text) --reason $(whoami) --document-name "Boxes" --parameters "username=$(whoami)"
}

export AWS_PROFILE=classic
