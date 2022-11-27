source $HOME/.bash_profile

# Created by `pipx` on 2022-06-13 16:27:17
export PATH="$PATH:/Users/mattuyw/.local/bin"
export PATH="/usr/local/bin:$PATH"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
gpg-connect-agent updatestartuptty /bye
