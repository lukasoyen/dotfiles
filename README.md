Dotfiles
===========

These are my dotfiles to use with a [manjaro
i3](https://manjaro.github.io/homepage/public/download/i3/) setup. It will
remove/install some software and also delete stuff from your `$HOME`. See
`install.sh` and `stow_it.sh`.

Setup
-----

```
git clone --recurse-submodules https://github.com/lummax/dotfiles.git && cd dotfiles
./install.sh && ./stow_it.sh
```

This also supports the two profiles `home` and `work`:

```
./install.sh home && ./stow_it.sh home
```

or

```
./install.sh work && ./stow_it.sh work
```

Structure
---------

The `install.sh` will remove and install some software using `pacman` and
`makepgk`. To install packages from the
[AUR](https://aur.archlinux.org/?setlang=de), add the package repository as a
git submodule to the folder `packages/`.

The `stow_it.sh` uses [GNU Stow](https://www.gnu.org/software/stow/) to manage
the dotfile setup. For this to work, the `stow_it.sh` removes some dotfiles
from `$HOME`. `bundles/` is a folder for generic git submodules that can be
used as a symlink target (see the `zsh/.antigen.zsh` symlink as an example).
