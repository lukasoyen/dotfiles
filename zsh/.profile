export PATH="$HOME/.local/bin:$PATH"

export BROWSER=/usr/bin/vivaldi-snapshot
export EDITOR='nvim'

export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

export FZF_CTRL_T_COMMAND='rg --files'
export FZFZ_SUBDIR_LIMIT=0

if [ -d ~/.profile.d ]; then
    for profile_snipplet in ~/.profile.d/*.profile ; do
        source $profile_snipplet
    done
fi
