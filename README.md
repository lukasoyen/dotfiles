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
sudo apt install git curl
curl -fsSL https://install.determinate.systems/nix | sh -s -- install --determinate
echo "$(which fish)" | sudo tee -a /etc/shells
chsh -s $(which fish)

nix run .#profile.switch
stow --target ~/ .

fc-cache -fv
```

### MacOS

```
brew install iterm2 koekeishiya/formulae/skhd
curl -fsSL https://install.determinate.systems/nix | sh -s -- install --determinate
echo "$(which fish)" | sudo tee -a /etc/shells
chsh -s $(which fish)

nix run .#profile.switch
stow --target ~/ .
stow --target ~/ macos
```
