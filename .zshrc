fpath=( "$HOME/.zfunctions" $fpath )
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000000
setopt appendhistory beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/csutaria/.zshrc'
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
autoload -Uz compinit
compinit
# End of lines added by compinstall

setopt nolistbeep autolist AUTO_CD
autoload -Uz promptinit; promptinit
PURE_PROMPT_SYMBOL='>'
PURE_GIT_PULL=0
prompt pure

bindkey '^_' undo
bindkey '^+' redo

alias resource='source ~/.zshrc'

# Created by newuser for 5.1.1
alias config='/usr/bin/git --git-dir=/home/cyrus/repositories/dotfiles/ --work-tree=/home/cyrus'
