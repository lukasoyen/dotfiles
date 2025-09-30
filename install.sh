#!/bin/bash

cd "$(dirname "$0")"

if [[ "$OSTYPE" == "darwin"* ]]; then
    curl -fsSL https://install.determinate.systems/nix | sh -s -- install --determinate —-no-confirm

    . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
    
    nix run .#profile.switch
    
    echo "$(which fish)" | sudo tee -a /etc/shells
    sudo chsh -s $(which fish) $USER
    
    stow --target ~/ .
    stow --target ~/ macos
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sudo apt install --yes git curl fontconfig
    curl -fsSL https://install.determinate.systems/nix | sh -s -- install --determinate —-no-confirm

   . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh

    nix run .#profile.switch
    
    echo "$(which fish)" | sudo tee -a /etc/shells
    sudo chsh -s $(which fish) $USER
    
    stow --target ~/ .
    
    fc-cache -fv
else
    echo "Unsupported operating system: $OSTYPE"
    exit 1
fi
