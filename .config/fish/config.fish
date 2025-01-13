set -gx EDITOR nvim
direnv hook fish | source
zoxide init fish --cmd cd | source
if status is-interactive
    # Commands to run in interactive sessions can go here
end
