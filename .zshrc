# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Poetry
export PATH="$HOME/.local/bin:$PATH"

plugins=(
    git
    docker
    poetry
    copyfile
    copypath
    
    # custom
    zsh-syntax-highlighting
    zsh-autosuggestions
    zsh-history-substring-search
)

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Load Pyenv
eval "$(pyenv init -)"

# Aliases Exa
alias ls="exa --icons --group --header"
alias la="ls -a"
alias ll="ls -l"
alias l="ll -a"

# starship
eval "$(starship init zsh)"

