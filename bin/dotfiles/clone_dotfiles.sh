#!/usr/bin/env bash

mkdir -p $HOME/repositories/dotfiles

# Honor aliases
shopt -s expand_aliases
alias config='/usr/bin/git --git-dir=$HOME/repositories/dotfiles/ --work-tree=$HOME'

git clone --bare https://github.com/csutaria/dotfiles.git $HOME/repositories/dotfiles
config checkout

config config --local status.showUntrackedFiles no

mkdir -p $HOME/.zfunctions
git clone https://github.com/sindresorhus/pure.git "$HOME/.zfunctions/pure"
chmod 755 $HOME/.zfunctions
chmod 755 $HOME/.zfunctions/pure
