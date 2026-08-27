# ── Prompt (Powerlevel10k) ───────────────────────────────────
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# ── History ───────────────────────────────────────────────────
# Controls how many commands are remembered and how they're stored
HISTSIZE=10000                 # commands kept in memory during session
SAVEHIST=10000                 # commands kept in the history file
HISTFILE=~/.zsh_history        # where history is saved
setopt SHARE_HISTORY           # share history across all open terminal sessions
setopt HIST_IGNORE_DUPS        # don't save a command if it's the same as the previous one
setopt APPEND_HISTORY          # append to history file instead of overwriting it


# ── Completion ────────────────────────────────────────────────
# Built-in tab-completion system (paths, commands, flags, etc.)
fpath=(~/.zsh/zsh-completions/src ~/.zsh/completions $fpath)
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select                            # navigate completions with arrow keys
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'     # case-insensitive matching
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"       # colorize completion list like `ls`


# ── Aliases (eza) ─────────────────────────────────────────────
# Modern replacement for `ls` — colors, git status, icons, tree view
# Repo: https://github.com/eza-community/eza
alias ls='eza --icons --group-directories-first'          # basic listing
alias ll='eza -l --icons --group-directories-first'       # long format
alias la='eza -la --icons --group-directories-first'      # long format, show hidden
alias lt='eza --tree --icons --level=2'                   # tree view, 2 levels deep
alias lg='eza -l --icons --git --group-directories-first' # long format with git status

# ── bat ───────────────────────────────────────────────────────
# Modern replacement for `cat` — syntax highlighting, line numbers, git diff markers
# Repo: https://github.com/sharkdp/bat
alias cat='bat --paging=never'   # instant output, no pager (default cat-like behavior)
alias catp='bat'                 # with pager, for longer files

# Use bat to syntax-highlight man pages
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# ── bat theme ─────────────────────────────────────────────────
# Custom Aizen Dark theme for bat
export BAT_THEME="AizenDark"

# ── Aliases (misc) ────────────────────────────────────────────
alias grep='grep --color=auto'


# ── Syntax Highlighting (Aizen Dark theme) ───────────────────
# Colors commands, paths, strings, etc. as you type
# Repo: https://github.com/zsh-users/zsh-syntax-highlighting
# NOTE: styles must be set BEFORE sourcing the plugin,
# and the "source" line must stay at the very end of this file
typeset -A ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[default]='fg=#d0d6f0'                       # plain/unrecognized arguments
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#f08898,bold'            # command that doesn't exist
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#c8a2f4'                 # if/for/while/case etc.
ZSH_HIGHLIGHT_STYLES[alias]='fg=#90dcd0,bold'                    # shell aliases
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#84b4f8,bold'                  # shell builtins (cd, export, etc.)
ZSH_HIGHLIGHT_STYLES[function]='fg=#84b4f8,bold'                 # shell functions
ZSH_HIGHLIGHT_STYLES[command]='fg=#a4e09c,bold'                  # valid external commands
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#a4e09c,underline'          # e.g. "sudo" before a command
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#d0d6f0'              # ; && || pipe separators
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=#84b4f8'                # cached/hashed command lookups
ZSH_HIGHLIGHT_STYLES[path]='fg=#f5dea4,underline'                # paths that exist on disk
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#c8a2f4'                      # wildcard patterns (*.txt, etc.)
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#c8a2f4,underline'   # !! and similar history expansions
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#90dcd0'          # -x style flags
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#90dcd0'          # --flag style flags
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=#f5dea4'          # `command` substitution
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#a4e09c'        # 'text' in single quotes
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#a4e09c'        # "text" in double quotes
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=#f5dea4' # $VAR inside double quotes
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=#f5dea4'   # backtick substitution in quotes
ZSH_HIGHLIGHT_STYLES[assign]='fg=#d0d6f0'                        # variable assignments (VAR=value)
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#f08898'                   # > >> < redirection operators
ZSH_HIGHLIGHT_STYLES[comment]='fg=#6c7280,italic'                # # comments

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# ── Prompt (Powerlevel10k) ───────────────────────────────────
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# ── fd ────────────────────────────────────────────────────────
# Modern replacement for `find` — respects .gitignore, faster, simpler syntax
# Repo: https://github.com/sharkdp/fd
# Used by fzf below for Ctrl+T / Alt+C
export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --exclude .git'

# ── fzf ───────────────────────────────────────────────────────
# Fuzzy finder — Ctrl+R (history search), Ctrl+T (file search), Alt+C (cd into dir)
# Repo: https://github.com/junegunn/fzf
source <(fzf --zsh)   # enables keybindings + completion (fzf >= 0.48)

# Aizen Dark colors for the fzf popup
export FZF_DEFAULT_OPTS="
  --color=bg+:#262626,bg:#1a1a1a,spinner:#c8a2f4,hl:#84b4f8
  --color=fg:#d0d6f0,header:#84b4f8,info:#f5dea4,pointer:#c8a2f4
  --color=marker:#a4e09c,fg+:#d0d6f0,prompt:#f5dea4,hl+:#84b4f8
"

# ── ripgrep ───────────────────────────────────────────────────
# Modern replacement for `grep` — respects .gitignore, much faster, recursive by default
# Repo: https://github.com/BurntSushi/ripgrep
alias grep='rg'


# ── pyenv ─────────────────────────────────────────────────────
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

. "$HOME/.local/share/../bin/env"
