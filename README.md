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
sudo apt-get install $(cat packages.txt) 
chsh -s $(which fish)
stow --target ~/ .
fc-cache -fv
```
