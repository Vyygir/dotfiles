# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/vyygir/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Key-bindings?!
builtin bindkey "^A" beginning-of-line
builtin bindkey "^E" end-of-line
builtin bindkey "^[^H" backward-kill-word
builtin bindkey "^[^?" backward-kill-word

# Session variables
export EDITOR=hx

# Common exports
export PATH="$HOME/.local/bin:$PATH"

# Starship
__starship_first=1
function _starship_precmd() {
    if (( __starship_first )); then
        __starship_first=0
    else
        echo
    fi
}
precmd_functions+=(_starship_precmd)

function clear() {
    # This is a garbage fix to make sure that clear doesn't pad the shit out of
    # the top of the terminal when we re-source the shell configuration
    command clear
    __starship_first=1
}

eval "$(starship init zsh)"

#

# Editor workaround to remove kitty spacing
function hx() {
    kitty @ set-spacing padding=0 padding-top=10 margin=0
    kitty @ set-colors background=#232323
    kitty @ set-background-opacity 1.0

    command hx "$@"

    kitty @ set-spacing padding=6 margin=6
    kitty @ set-colors background=#111213
    kitty @ set-background-opacity 0.5
}

# I'm lazy. I want to open things with one-command from the terminal.
open() {
    xdg-open "$@" &!
}

# Methods to affect terminal readability for people who are too lame for 2K
function bigly() {
    kitty @ set-font-size 13
}

function impeach() {
    kitty @ set-font-size 0
}

# rustup/rustc
. "$HOME/.cargo/env"

# Node Version Manager
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Zig Version Manager
export ZVM_INSTALL="$HOME/.zvm/self"
export PATH="$PATH:$HOME/.zvm/bin:$ZVM_INSTALL"

# Additional path links
export PATH="$PATH:$HOME/.local/bin"

# Environment variables
export HYPRSHOT_DIR="$HOME/Pictures/Screenshots"
export DELTA_PAGER="moar"

# SSH keychain agent
eval "$(keychain --eval --quiet id_ed25519)"

# Fun with Flatpak (but not really because it's Flatpak)
export XDG_DATA_DIRS="/var/lib/flatpak/exports/share:$XDG_DATA_DIRS"

# Mario would shit
function pipes() {
    local tmp=$(mktemp)
    curl -s https://raw.githubusercontent.com/pipeseroni/pipes.sh/master/pipes.sh > "$tmp"
    kitty @ set-spacing padding=0 margin=0
    bash "$tmp"
    kitty @ set-spacing padding=6 margin=6
    rm "$tmp"
}

# Dotfiles helper
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
