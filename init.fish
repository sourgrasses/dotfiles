if command -v pyenv 1>/dev/null 2>&1
    pyenv init - | source
end

set -px PATH $HOME/.cargo/bin
set -px PATH $HOME/go/bin
set -px PATH $HOME/.gem/ruby/2.6.0/bin
set -px PATH $HOME/.local/bin
set -px PATH /usr/local/sbin
set -px PATH /usr/local/bin
set -px PATH $HOME/bin
set -px PATH /opt/homebrew/bin
set -px PATH /opt/homebrew/opt/llvm/bin

set -px PATH $HOME/.local/share/gem/ruby/2.7.0/bin

set -Ux GPG_TTY `tty`

set -Ux GO111MODULE on

# use most pager for man pages
if command -v pyenv 1>/dev/null 2>&1
    set -Ux MANPAGER most
end

if command -v nvim 1>/dev/null 2>&1
    alias vim="nvim"
end

if command -v lsd 1>/dev/null 2>&1
    alias ls="lsd"
end

alias socks="ssh -D 10080 -C -N jawheeler@sh.it.wm.edu"

fish_vi_key_bindings
