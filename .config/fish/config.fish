set -gx EDITOR nvim
zoxide init fish --cmd cd | source
if status is-interactive
    # Commands to run in interactive sessions can go here
end
