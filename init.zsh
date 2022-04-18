#!/usr/bin/env zsh
#
# Symlinks files in this directory into $HOME directory

zmodload zsh/stat

# Base dir as path relative to $HOME directory
DIR="${0:a:h}"

function msg() {
    case "$1" in
        ERROR) print -Pn '%F{red}' ;;
        SKIP) print -Pn '%F{yellow}' ;;
        OK) print -Pn '%F{green}' ;;
    esac
    
    [[ -n "$2" ]] && print -n "[$1: $2]" || print -n "[$1]"
    print -P %f
}

# Files to be symlinked to home directory
local -A dotfiles
dotfiles=(
    git              		".config/git"
    nano		 			".nano"
    nanorc           		".config/nano/nanorc"
	neofetch				".config/neofetch/config.conf"
    ohmyzsh          		".zsh/ohmyzsh"
    ohmyzsh-custom   		".zsh/ohmyzsh-custom"
    tldr-sh-client/tldr		".local/bin/tldr"
	vim 					".vim"
    vimrc            		".vimrc"
    zshenv           		".zshenv"
    zshrc            		".zshrc"
)

local error symlink
local file srcfile destfile

for file (${(ko)dotfiles}); do
    echo -n "symlinking $file... "
    
    srcfile="$DIR/$file"
    destfile="$HOME/${dotfiles[$file]}"
    
    if [[ -h "$destfile" ]]; then
        symlink="$(zstat +link "$destfile")"
        if [[ "$symlink" == "$srcfile" ]]; then
            msg SKIP "file already symlinked"
            continue
        else
            echo -n "(old@ -> $symlink)"
        fi
    fi
    
    mkdir -p "${destfile:h}"
    if error="$(ln -nsf "$srcfile" "$destfile" 2>&1)"; then
        msg OK
        elif [[ -f "$destfile" ]]; then
        msg ERROR "destination already exists (file)"
        elif [[ -d "$destfile" ]]; then
        msg ERROR "destination already exists (dir)"
    else
        msg ERROR "$error"
    fi
done

# Add sourcing of .zshenv to .profile
grep -q "\. \"\$HOME/${dotfiles[zshenv]}\"" ~/.profile || {
	cat >> ~/.profile <<-EOF
		# load posix-compatible .zshenv
		if [ -r "\$HOME/${dotfiles[zshenv]}" ]; then
		    . "\$HOME/${dotfiles[zshenv]}"
		fi
	EOF
}

# After install steps
msg OK "Done!"
