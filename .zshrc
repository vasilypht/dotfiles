# =========================
#         oh-my-zsh
# =========================
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(
    git
    zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh


# ===================
#         exa
# ===================
alias ls="exa --long --header"
alias la="ls -a"
alias ll="ls -l"
alias lla="ls -la"
alias l="lla"


# =====================
#         pyenv
# =====================
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
