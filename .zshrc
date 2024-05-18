# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias ls="exa"
alias la="ls -a"
alias ll="ls -l"
alias lla="ls -la"
alias l="lla"
