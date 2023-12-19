# Adds another path to `$PATH` environment variable and makes sure to avoid
# duplicates
function add_to_path {
  case ":$PATH:" in
    *":$1:"*) :;; # already there
    *) PATH="$PATH:$1";;
  esac
}

# Uses `add_to_path` function but makes sure the to-be-added path really exists
function optional_add_to_path {
  if [ -d $1 ]
  then
    add_to_path $1
  fi
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

# Set keyboard layout
setxkbmap eu

# Move through command line prompt by word
bindkey '^f' forward-word
bindkey '^b' backward-word

# ==================
# Alias
# ==================

alias Ag="ag"
alias vim="nvim"
alias l="ls -lah --group-directories-first"
alias la="ls -lAhv --group-directories-first"
alias ll="ls -lh --group-directories-first"

# p2panda development directory shortcut
alias panda=". panda"

# ==================
# Development
# ==================

# Rust
add_to_path $HOME/.cargo/bin

# fzf
export FZF_PREVIEW_COMMAND="cat {}"
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
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
# add_to_path $HOME/.pyenv/bin
# export PYENV_VIRTUALENV_DISABLE_PROMPT=1
# eval "$(pyenv init --path)"
# eval "$(pyenv virtualenv-init -)"

# poetry
# add_to_path $HOME/.poetry/bin

# rvm
# source $HOME/.rvm/scripts/rvm

# n
export N_PREFIX=$HOME/.n
add_to_path $N_PREFIX/bin

# dart
# add_to_path $HOME/.pub-cache/bin

# android & flutter
# add_to_path $HOME/dev/flutter/bin
# add_to_path $HOME/dev/android/Sdk/platform-tools
# export ANDROID_HOME=$HOME/dev/android/Sdk
# export CHROME_EXECUTABLE=/usr/bin/google-chrome-stable
# export JAVA_HOME=/usr/lib/jvm/default

# flatpack
add_to_path /var/lib/flatpak/exports/share
add_to_path $HOME/.local/share/flatpak/exports/share
