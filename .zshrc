fpath+=("$HOME/.zfunctions")
fpath+=("$HOME/.zfunctions/pure")
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000000
setopt appendhistory beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
autoload -Uz compinit
compinit
# End of lines added by compinstall

setopt nolistbeep autolist AUTO_CD
if [[ -e ~/.zfunctions/pure/prompt_pure_setup ]]; then
  autoload -Uz promptinit; promptinit
  PURE_PROMPT_SYMBOL='>>'
  PURE_GIT_PULL=0
  prompt pure
fi

bindkey '^_' undo
bindkey '^+' redo

alias resource='source ~/.zshrc'
alias ll='ls -l'
alias la='ls -la'
alias vim='nvim -p'
#alias view='nvim -R -p'
#alias vimdiff='nvim -d'

# dotfile management based on:
# https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
alias config="/usr/bin/git --git-dir=$HOME/repositories/dotfiles/ --work-tree=$HOME"

# make ctrl-c put line in history
# https://github.com/bentomas/dotfiles/blob/master/zshrc
TRAPINT() {
  # Store the current buffer in the history.
  zle && print -s -r -- $BUFFER

  # Return the default exit code so zsh aborts the current command.
  return $1
}

typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

autoload up-line-or-beginning-search
autoload down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# setup key accordingly
[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-beginning-search
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-beginning-search
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   history-beginning-search-backward
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" history-beginning-search-forward
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char

bindkey "\e[A" history-beginning-search-backward
bindkey "\e[B" history-beginning-search-forward

# Source local file for overriding defaults + machine specific settings
if [[ -f ~/.zshrc_local ]]; then
  source ~/.zshrc_local
fi

