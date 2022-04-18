# dotfiles

First of all, download the dotfiles repo:

```
git clone https://github.com/alekssro/dotfiles
```

# Set up dotfiles

1. Install zsh
  ```
  sudo pacman -S zsh    # Arch
  sudo apt install zsh  # Debian
  sudo yum install zsh  # CentOS
  ```

1. Set zsh as default shell
```
chsh -s $(which zsh)
```

3. Restart session to apply changes

4. Update git submodules:

  ```sh
  cd dotfiles
  git submodule init
  git submodule update
  ```

5. Run init script: `./init.zsh`

6. Restart the shell or run `exec zsh`

## Optional

### Install neofetch

```
sudo pacman -S neofetch   # Arch
sudo apt install neofetch # Debian
sudo yum install neofetch # CentOS
```