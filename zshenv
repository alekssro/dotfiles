#!/bin/sh
#
# File: .zshenv
# Description:
#   Dynamically sets the PATH at each shell startup, as well as other
#   environment variables.
#   To enable these modifications at logon, source this file from .profile:
#
#     . ~/.zshenv
#
#   NOTE: avoid syntax and commands that aren't portable to other platforms and
#   shells. Check out http://hyperpolyglot.org/unix-shells for more information.


# bin folders
if [ -d "$HOME"/bin ]; then
	PATH="$PATH:$HOME/bin"
	for DIR in "$HOME"/bin/*; do
		test -d "$DIR" && PATH="$PATH:$DIR"
	done > /dev/null 2>&1
fi

if [ -d "$HOME/.local/bin" ]; then
	PATH="$PATH:$HOME/.local/bin"
fi

# opt folder
if [ -d "$HOME"/opt ]; then
	for DIR in "$HOME"/opt/*/bin; do
		test -d "$DIR" && PATH="$PATH:$DIR"
	done > /dev/null 2>&1
fi

# go binaries and workspace
test -d /usr/local/go && PATH="$PATH:/usr/local/go/bin"
test -d "$HOME/code/go" && {
	export GOPATH="$HOME/code/go"
	PATH="$PATH:$HOME/code/go/bin"
}

unset DIR

# remove duplicate entries from PATH
[ -n "$ZSH_VERSION" ] && typeset -U path

# export PATH for other sessions
export PATH

# use nano if it exists; otherwise use vim
command -v nano > /dev/null 2>&1 && export EDITOR=nano || export EDITOR=vim