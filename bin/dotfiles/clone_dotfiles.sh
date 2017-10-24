#!/usr/bin/env bash

mkdir -p $HOME/repositories/dotfiles

# alias config='/usr/bin/git --git-dir=$HOME/repositories/dotfiles/ --work-tree=$HOME'

# Recursively clones
git clone --recursive --bare git@github.com:csutaria/dotfiles.git $HOME/repositories/dotfiles

