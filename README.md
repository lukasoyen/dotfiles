Dotfiles
===========

These are my dotfiles. It may remove/install some software and also delete
stuff from your `$HOME`.

Setup
-----

```
git clone --recurse-submodules https://github.com/lummax/dotfiles.git && cd dotfiles
```

### Ubuntu

```
sudo apt install git curl fontconfig
curl -fsSL https://install.determinate.systems/nix | sh -s -- install --determinate

nix run .#profile.switch

echo "$(which fish)" | sudo tee -a /etc/shells
chsh -s $(which fish)

stow --target ~/ .

fc-cache -fv
```

### MacOS

```
brew install iterm2 koekeishiya/formulae/skhd
curl -fsSL https://install.determinate.systems/nix | sh -s -- install --determinate

nix run .#profile.switch

echo "$(which fish)" | sudo tee -a /etc/shells
chsh -s $(which fish)

stow --target ~/ .
stow --target ~/ macos
```
