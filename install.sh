#!/usr/bin/bash

MODE="${1:-base}"

set -e

install_packages() {
  if [ $(lsb_release --id --short) = "ManjaroLinux" ]; then
      arch_cleanup_base
      arch_install_base
      case "$MODE" in
          home)
              arch_install_home
              ;;
          work)
              arch_install_work
              ;;
      esac
  fi
}

arch_cleanup_base() {
    echo "Removing unused software from base system"
    sudo pacman -Rsu palemoon-bin || true
}

arch_install_base() {
    echo "Installing base system"
    sudo pacman -S --needed \
        ntfs-3g adobe-source-code-pro-fonts xf86-input-synaptics \
        zsh-completions stow pass feh \
        ripgrep fzf z \
        arandr unclutter \
        pycharm-community-edition

    echo ".. installing vivaldi"
    if ! grep -q herecura /etc/pacman.conf; then
        sudo tee --append /etc/pacman.conf <<EOF
[herecura]
Server = https://repo.herecura.be/herecura/x86_64
EOF
        sudo pacman -Sy
    fi
    sudo pacman -S --needed \
        vivaldi-snapshot vivaldi-snapshot-ffmpeg-codecs

    echo ".. setting zsh as shell"
    sudo chsh --shell "$(which zsh)" "$(whoami)"
}

arch_install_home() {
    echo "Installing packages for the home install"
    sudo pacman -S --needed ledger
}

arch_install_work() {
    echo "Installing packages for the work install"
    sudo pacman -S --needed task timew
}

stow_dotfiles() {
    echo "Using store to create dotfiles"
}

install_packages
stow_dotfiles
echo "All done"

