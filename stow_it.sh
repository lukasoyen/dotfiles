#!/usr/bin/bash

MODE="${1:-base}"

set -e

stow_dotfiles() {
    echo "Using stow to create dotfiles"
    rm -rf ~/.profile ~/.i3 ~/.vim ~/.config/nvim
    stow --target ~/ zsh spacevim xorg i3 kitty intellij
    case "$MODE" in
        home) ;;
        work) ;;
    esac
}

stow_dotfiles
