if command -v pyenv 1>/dev/null 2>&1
    pyenv init - | source
end

set -Upx PATH "$HOME/.cargo/bin:$PATH"
set -Upx PATH "$HOME/go/bin:$PATH"
set -Upx PATH "$HOME/.gem/ruby/2.6.0/bin:$PATH"
set -Upx PATH "$HOME/.local/bin:$PATH"
set -Upx PATH "/usr/local/sbin:$PATH"
set -Upx PATH "$HOME/bin:$PATH"

set -Ux GPG_TTY `tty`

set -Ux GO111MODULE on

# use most pager for man pages
set -Ux MANPAGER most

if command -v nvim 1>/dev/null 2>&1
    alias vim="nvim"
end

if command -v lsd 1>/dev/null 2>&1
    alias ls="lsd"
end

alias socks="ssh -D 10080 -C -N jawheeler@sh.it.wm.edu"

fish_vi_key_bindings
