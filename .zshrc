alias vim='nvim'
alias gpg-bye='gpg-connect-agent updatestartuptty /bye'
alias cat='bat --paging=never'
alias sed='gsed'
alias grep='ggrep'

# command -v thefuck > /dev/null 2>&1 && eval $(thefuck --alias)

export AWS_PROFILE=ClassicProduction.CoreServices
export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/.ripgreprc"
export TMUX_PLUGIN_MANAGER_PATH="$HOME/.tmux/plugins/"

export STARSHIP_CONFIG="$HOME/.config/starship.toml"
# export PATH="$PATH:$HOME/.pipx/bin"
# export PATH="/usr/local/bin:$PATH"
#
# plugin manager
export ZAP_GIT_PREFIX="git@github.com:"
if [ -f "$HOME/.local/share/zap/zap.zsh" ]; then
  source "$HOME/.local/share/zap/zap.zsh"
  plug "zsh-users/zsh-autosuggestions"
  plug "zsh-users/zsh-syntax-highlighting"
  plug "zsh-users/zsh-completions"
  # plug "wintermi/zsh-brew"
  plug "wintermi/zsh-starship"
  plug "wintermi/zsh-lsd"
  plug "laggardkernel/zsh-thefuck"
  plug "zap-zsh/vim"
  plug "aloxaf/fzf-tab"
  plug "freed-wu/fzf-tab-source"
fi

export KEYTIMEOUT=1
# export PATH="$HOME/.local/pipx/venvs:$PATH"
# export PATH="$HOME/.cargo/bin:$PATH"
# export PATH="$HOME/.local/bin:$PATH"

# Generated for envman. Do not edit.
# [ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
[ -f /Users/mattuyw/.config/.gc ] && source /Users/mattuyw/.config/.gc 2> /dev/null

# NOTE: this works best not on macOS
#
# export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
export GPG_TTY=$(tty)
# gpgconf --launch gpg-agent
# gpg-bye > /dev/null 2>&1

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

autoload -Uz compinit; compinit -C
