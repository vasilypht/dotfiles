# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# ZSH-Plugins
# -----------
source ~/.zsh-plugins/powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh-plugins/copypath/copypath.plugin.zsh

autoload -U compinit; compinit
source ~/.zsh-plugins/fzf-tab/fzf-tab.plugin.zsh


# =====================
#         pyenv
# =====================
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
