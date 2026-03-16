
fish_add_path /home/simo/.spicetify
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias lgdotfiles='lazygit --git-dir=$HOME/.dotfiles --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /home/simo/.lmstudio/bin
# End of LM Studio CLI section

