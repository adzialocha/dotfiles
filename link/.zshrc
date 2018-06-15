# ====================
# Basic path setup
# ====================

# Add dotfiles bin and brew path.
export PATH=$HOME/.dotfiles/bin:/usr/local/bin:$PATH

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
export PATH="$HOME/.cargo/bin:$PATH"
