source ~/.antigen.zsh

antigen use oh-my-zsh

antigen bundle history-substring-search
antigen bundle git
antigen bundle z

antigen theme arrow

antigen bundle ytet5uy4/fzf-widgets
antigen bundle andrewferrier/fzf-z
antigen bundle Tarrasch/zsh-autoenv

if [ -d ~/.zsh.d ]; then
    for zshrc_snipplet in ~/.zsh.d/*.zsh ; do
        source $zshrc_snipplet
    done
fi

antigen apply

bindkey '^e' fzf-edit-files
bindkey '^k' fzf-kill-processes
bindkey '^r' fzf-insert-history
bindkey '^t' fzf-insert-files
