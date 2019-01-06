#!/usr/bin/bash

MODE="${1:-base}"

set -e

install_packages() {
    arch_cleanup_base
    arch_install_base
    case "$MODE" in
        home) arch_install_home ;;
        work) arch_install_work ;;
    esac
}

arch_cleanup_base() {
    echo "Removing unused software from base system"
    sudo pacman -Rsu --noconfirm vim || true
    sudo pacman -Rsu --noconfirm palemoon-bin || true
}

arch_install_base() {
    echo "Installing base system"
    sudo pacman -S --needed --noconfirm \
        base-devel \
        manjaro-pulse \
        pavucontrol \
        ntfs-3g \
        adobe-source-code-pro-fonts\
        xf86-input-synaptics \
        kitty \
        zsh-completions \
        stow \
        pass \
        feh \
        ripgrep \
        fzf \
        rofi \
        z \
        neovim \
        moreutils \
        arandr \
        unclutter \
        zathura-pdf-mupdf \
        pycharm-community-edition

    echo ".. installing vivaldi"
    if ! grep -q herecura /etc/pacman.conf; then
        sudo tee --append /etc/pacman.conf <<EOF
[herecura]
Server = https://repo.herecura.be/herecura/x86_64
EOF
        sudo pacman -Sy
    fi
    sudo pacman -S --needed --noconfirm \
        vivaldi-snapshot \
        vivaldi-snapshot-ffmpeg-codecs

    echo ".. installing packages from aur"
    gpg --recv-keys EB4F9E5A60D32232BB52150C12C87A28FEAC6B20 # browserpass
    for package in packages/*/; do
        pushd "$package"
        makepkg --clean --install --syncdeps --noconfirm
        git clean -fxd
        popd
    done

    echo ".. setting zsh as shell"
    sudo chsh --shell "$(which zsh)" "$(whoami)"
}

arch_install_home() {
    echo "Installing packages for the home install"
    sudo pacman -S --needed --noconfirm \
        ledger
}

arch_install_work() {
    echo "Installing packages for the work install"
    sudo pacman -S --needed \
        task \
        timew
}

install_packages
