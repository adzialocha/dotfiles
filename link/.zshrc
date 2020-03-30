function add_to_path {
  case ":$PATH:" in
    *":$1:"*) :;; # already there
    *) PATH="$PATH:$1";;
  esac
}

# ====================
# Basic path setup
# ====================

# Add dotfiles bin and brew path.
add_to_path $HOME/.dotfiles/bin
add_to_path $HOME/.local/bin
add_to_path /usr/local/sbin
add_to_path /usr/local/bin

# Path to our oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ====================
# Oh my zsh config
# ====================

# Set name of the theme to load.
ZSH_THEME="adz-custom"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.config/zsh-custom

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# ==================
# User configuration
# ==================

# Kill the <ESC> key lag
export KEYTIMEOUT=1

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# ==================
# Alias
# ==================

alias Ag="ag"
alias fd="fdfind"
alias l="ls -lah --group-directories-first"
alias la="ls -lAhv --group-directories-first"
alias ll="ls -lh --group-directories-first"
alias vim="nvim"

# ==================
# Development
# ==================

# Rust
add_to_path $HOME/.cargo/bin

# nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Use fd listing path candidates
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# pyenv & pyenv-virtualenv
add_to_path $HOME/.pyenv/bin
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# vault autocompletion
which vault > /dev/null && . "$(vault --initpath)"
