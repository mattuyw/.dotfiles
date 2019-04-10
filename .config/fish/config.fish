set -gx SPACEFISH_PYENV_SHOW false
set -gx ANDROID_HOME /usr/local/opt/android-sdk
set -gx LANG en_US.utf-8
set -gx EDITOR vim
set -gx GPG_TTY (tty)
set -gx SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
set -gx SSH_AGENT_PID ""
gpg-connect-agent updatestartuptty /bye > /dev/null

set -l path \
    $HOME/.local/bin \
    $HOME/.cargo/bin \
    $HOME/go/bin \
    $HOME/Library/Python/3.7/bin \
    /usr/local/opt/python/libexec/bin \
    /usr/local/bin \
    /usr/local/sbin \
    $HOME/.pyenv/shims \
    /usr/local/opt/coreutils/libexec/gnubin

for i in $path[-1..1]
    if test -d $i
        set -gx PATH $i $PATH
    end
end

if test (python3 -m virtualfish 2> /dev/null)
    eval (python3 -m virtualfish auto_activation compat_aliases projects)
end
if test (which direnv)
    eval (direnv hook fish)
end

set -l manpath \
    /usr/local/opt/coreutils/libexec/gnuman

for i in $manpath[-1..1]
    if test -d $i
        set -gx MANPATH $i $MANPATH
    end
end

if test -e $HOME/.iterm2_shell_integration.fish
    source $HOME/.iterm2_shell_integration.fish
end

if test (which itermocil)
    complete -c itermocil -a "(itermocil --list)"
end

if test -d $HOME/.ssh
    cat $HOME/.ssh/*.config > $HOME/.ssh/.config
end

if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

fortune | cowsay

