function add_to_path {
  case ":$PATH:" in
    *":$1:"*) :;; # already there
    *) PATH="$1:$PATH";; # or PATH="$PATH:$1"
  esac
}

# ====================
# Basic path setup
# ====================

# Add dotfiles bin and brew path.
add_to_path $HOME/.dotfiles/bin
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

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# ==================
# Alias
# ==================

alias vim="nvim"

# ==================
# Languages
# ==================

# Rust
add_to_path $HOME/.cargo/bin

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/dev
source /usr/local/bin/virtualenvwrapper.sh
