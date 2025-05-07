Dotfiles
===========

These are my dotfiles to use with a Ubuntu. It may remove/install some software
and also delete stuff from your `$HOME`.

Setup
-----

```
git clone --recurse-submodules https://github.com/lummax/dotfiles.git && cd dotfiles
```

```
sudo apt install git curl fish
sh <(curl -L https://nixos.org/nix/install) --daemon
nix run .#profile.switch
stow --target ~/ .
fc-cache -fv
chsh -s $(which fish)
```
