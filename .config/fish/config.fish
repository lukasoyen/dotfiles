set -gx EDITOR nvim

fish_add_path --path ~/.local/bin/
fish_add_path --path ~/.nix-profile/bin/

. '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish'
. '/nix/var/nix/profiles/default/etc/profile.d/nix.fish'

direnv hook fish | source
zoxide init fish --cmd cd | source
if status is-interactive
    # Commands to run in interactive sessions can go here
end
