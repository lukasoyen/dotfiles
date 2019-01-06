#!/usr/bin/bash

MODE="${1:-base}"

set -e

stow_dotfiles() {
    echo "Using stow to create dotfiles"
    rm -rf ~/.profile ~/.bash_* ~/.bashrc ~/.i3 ~/.vim ~/.config/nvim
    stow --target ~/ zsh spacevim xorg wm kitty intellij
    case "$MODE" in
        home) stow --target ~/ spacemacs ;;
        work) ;;
    esac
}

stow_dotfiles
