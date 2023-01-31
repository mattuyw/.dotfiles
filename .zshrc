if [[ $- =~ i ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_TTY" ]]; then
  tmux attach-session -t $USER || tmux new-session -s $USER
fi

alias ll="ls -lh"
alias la="ls -la"
alias ls='lsd'
alias vim='nvim -c NvimTreeToggle'
alias cat='bat --paging=never'
alias gpg-bye='gpg-connect-agent updatestartuptty /bye'
#alias terraform=docker run --rm -it -v /opt/terraform:/terraform hashicorp/terraform
#docker run --rm -e AWS_ACCESS_KEY_ID="..." \
#      -e AWS_SECRET_ACCESS_KEY="..." \
#      -e AWS_SESSION_TOKEN="..." -e AWS_DEFAULT_REGION=us-east-1 gcaws gcaws list i dba
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

[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# TODO: check if it exists
#eval $(thefuck --alias)

plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-completions"
#plug "zsh-users/zsh-history-substring-search"

#source $HOME/.config/zsh/colored-man-pages.zsh

which starship > /dev/null 2>&1 && source <(starship init zsh --print-full-init)

export FZF_DEFAULT_COMMAND="fd . $HOME"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"
