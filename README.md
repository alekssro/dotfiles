# dotfiles

# Install zsh

```
sudo apt install zsh
```

# Install Oh My Zsh

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

# Install plugins

## zsh-autosuggestions

```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```


## zsh-syntax-highlighting

```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

# Install zsh dracula theme

1. Download `git clone https://github.com/dracula/zsh.git`.
2. Move dracula.zsh-theme file to oh-my-zsh's theme folder: oh-my-zsh/themes/dracula.zsh-theme.
3. Move /lib to oh-my-zsh's theme folder: oh-my-zsh/themes/lib.

# Set gnome terminal scheme color

```
bash -c  "$(wget -qO- https://git.io/vQgMr)"
```

*dracula: 36*

# Install tpm (tmux plugin manager)

- [TPM Installation](https://github.com/tmux-plugins/tpm#installation)
- [Dracula theme for tmux](https://draculatheme.com/tmux)