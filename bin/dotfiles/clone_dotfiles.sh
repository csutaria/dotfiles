#!/usr/bin/env bash

mkdir -p $HOME/repositories/dotfiles

alias config='/usr/bin/git --git-dir=$HOME/repositories/dotfiles/ --work-tree=$HOME'

git clone --bare https://github.com/csutaria/dotfiles.git $HOME/repositories/dotfiles
config checkout

config config --local status.showUntrackedFiles no
