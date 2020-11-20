# Install zsh
echo "Install zsh"
apt-get install zsh

# Set zsh as default shell
echo "Set zsh as default shell"
chsh -s $(which zsh)

# clone dotfiles
echo "Clone dotfiles"
git clone git@github.com:alekssro/dotfiles

# done, restart session and run init.zsh
echo "Done. Restart session and run ./init.zsh"
