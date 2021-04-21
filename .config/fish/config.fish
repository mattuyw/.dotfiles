set -U fish_color_autosuggestion 969896
set -U fish_color_cancel \x2dr
set -U fish_color_command b294bb
set -U fish_color_comment f0c674
set -U fish_color_cwd green
set -U fish_color_cwd_root red
set -U fish_color_end b294bb
set -U fish_color_error cc6666
set -U fish_color_escape 00a6b2
set -U fish_color_history_current \x2d\x2dbold
set -U fish_color_host normal
set -U fish_color_match \x2d\x2dbackground\x3dbrblue
set -U fish_color_normal normal
set -U fish_color_operator 00a6b2
set -U fish_color_param 81a2be
set -U fish_color_quote b5bd68
set -U fish_color_redirection 8abeb7
set -U fish_color_search_match bryellow\x1e\x2d\x2dbackground\x3dbrblack
set -U fish_color_selection white\x1e\x2d\x2dbold\x1e\x2d\x2dbackground\x3dbrblack
set -U fish_color_status red
set -U fish_color_user brgreen
set -U fish_color_valid_path \x2d\x2dunderline
set -U fish_pager_color_completion normal
set -U fish_pager_color_description B3A06D\x1eyellow
set -U fish_pager_color_prefix white\x1e\x2d\x2dbold\x1e\x2d\x2dunderline
set -U fish_pager_color_progress brwhite\x1e\x2d\x2dbackground\x3dcyan
set -U fish_greeting Welcome\x20to\x20fish\x2c\x20the\x20friendly\x20interactive\x20shell

set -gx ANDROID_HOME /usr/local/opt/android-sdk
set -gx RIPGREP_CONFIG_PATH $HOME/.config/ripgrep/.ripgreprc
set -gx LANG en_US.UTF-8
set -gx EDITOR vim
set -gx N_PREFIX $HOME/.n

if not contains $HOME/.fish-path-hook $PATH
        and status --is-interactive
        or status --is-login
    if ! test -e $HOME/.path
        generate_path > $HOME/.path
    end

    set -gx PATH (cat $HOME/.path) $HOME/.fish-path-hook

    # sometimes within subshell when VIRTUAL_ENV is already set
    # above PATH adjustements will put VIRTUAL_ENV not on top of PATH
    # hence ignoring most of PATH order
    if set -q VIRTUAL_ENV
        set -gx PATH $VIRTUAL_ENV/bin $PATH
    end
end

if which starship > /dev/null 2>&1
    starship init fish | source
end

if which zoxide > /dev/null 2>&1
    zoxide init fish | source
end

alias l="ls -la"
alias fish_config.fish="vim ~/.config/fish/config.fish"
if which nvim > /dev/null 2>&1
    alias vim=nvim
    set -gx EDITOR nvim
end
if which fzf > /dev/null 2>&1
    alias vimz='vim (fzf)'
    set -gx FZF_DEFAULT_COMMAND 'fd --type f'
end

if ! test -e $HOME/.manpath
    generate_manpath > $HOME/.manpath
end
for i in (cat $HOME/.manpath)
    if test -d $i
        set -gx MANPATH $i $MANPATH
    end
end

set -l compilepath \
    /usr/local/opt/openssl \
    /usr/local/opt/gmp

for i in $compilepath[-1..1]
    if test -d $i/lib
            and not echo $LDFLAGS | grep $i/lib > /dev/null
        set -gx LDFLAGS "-L$i/lib $LDFLAGS"
    end
    if test -d $i/include
            and not echo $CPPFLAGS | grep $i/include > /dev/null
        set -gx CPPFLAGS "-I$i/include $CPPFLAGS"
    end
    if test -d $i/lib/pkgconfig
            and not echo $PKG_CONFIG_PATH | grep $i/lib/pkgconfig > /dev/null
        set -gx PKG_CONFIG_PATH "$i/lib/pkgconfig:$PKG_CONFIG_PATH"
    end
end

if which direnv > /dev/null 2>&1
        and status --is-interactive
    eval (direnv hook fish)
end

if test -e $HOME/.iterm2_shell_integration.fish
    source $HOME/.iterm2_shell_integration.fish
end

if test -f /usr/local/share/chtf/chtf.fish
    source /usr/local/share/chtf/chtf.fish
end

if which itermocil > /dev/null 2>&1
    complete -c itermocil -a "(itermocil --list)"
end

if test -d $HOME/.ssh
    cat $HOME/.ssh/*.config > $HOME/.ssh/.config
end

if which src-hilite-lesspipe.sh > /dev/null 2>&1
    set -gx LESSOPEN "| src-hilite-lesspipe.sh %s"
    set -gx LESS " -R "
end

if not functions -q fisher
        and status --is-interactive
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl -sL https://git.io/fisher | source
    fisher update
end

if which fortune > /dev/null 2>&1
        and which cowsay > /dev/null 2>&1
        and status --is-interactive
    fortune -s | cowsay
end

if not set -q SSH_CONNECTION
        and which gpgconf > /dev/null 2>&1
        and which gpg --card-status > /dev/null 2>&1
        and status --is-interactive
    set -gx GPG_TTY (tty)
    set -gx SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
    set -gx SSH_AGENT_PID ""

    if which gpg-connect-agent > /dev/null 2>&1
        gpg-connect-agent updatestartuptty /bye > /dev/null 2>&1 &
    end

    # modify macOS system SSH_AUTH_SOCK if it does not match
    # only for non-root user
    if which launchctl > /dev/null 2>&1
            and test (id -u) -gt 0
            and test (launchctl asuser (id -u) launchctl getenv SSH_AUTH_SOCK) != $SSH_AUTH_SOCK
        launchctl asuser (id -u) launchctl setenv SSH_AUTH_SOCK (echo $SSH_AUTH_SOCK) &
    end
end
