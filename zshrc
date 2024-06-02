# =====================
#         pyenv
# =====================
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


# =========================
#         oh-my-zsh
# =========================
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(
    git
    fzf-tab
    copypath
    copyfile
    encode64
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


# ===================
#         FZF
# ===================
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
zstyle ':fzf-tab:*' fzf-flags --height=60%
