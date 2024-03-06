# Adds another path to `$PATH` environment variable and makes sure to avoid
# duplicates
function add_to_path {
  case ":$PATH:" in
    *":$1:"*) :;; # already there
    *) PATH="$PATH:$1";;
  esac
}

# Sources a file when it exists
function source_if_exists {
  [ -f $1 ] && source $1
}

# ====================
# Basic path setup
# ====================

# Add dotfiles and local bin paths
add_to_path $HOME/.dotfiles/bin
add_to_path $HOME/.local/bin
add_to_path /usr/local/sbin
add_to_path /usr/local/bin

# Path to our oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# ====================
# Oh my zsh config
# ====================

# Set name of the theme to load
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

# Conveniently delete word in command line prompt
bindkey '^x' delete-word

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
# Applications
# ==================

# flatpak
add_to_path /var/lib/flatpak/exports/share/applications
add_to_path $HOME/.local/share/flatpak/exports/share/applications

# fzf
export FZF_DEFAULT_OPTS="
  --height 30%
  --reverse
  --color bg:-1,bg+:-1,hl:15,hl+:11,fg:-1,fg+:15
  --color border:0,spinner:8,header:0,info:8
  --color pointer:15,marker:15,prompt:12
"
export FZF_DEFAULT_COMMAND="fd --type f --follow"
export FZF_PREVIEW_COMMAND="cat {}"

source_if_exists /usr/share/fzf/key-bindings.zsh
source_if_exists /usr/share/fzf/completion.zsh

# ==================
# Development
# ==================

# Rust
add_to_path $HOME/.cargo/bin

# n
export N_PREFIX=$HOME/.n
add_to_path $N_PREFIX/bin

# ==================

# pyenv & pyenv-virtualenv
# add_to_path $HOME/.pyenv/bin
# export PYENV_VIRTUALENV_DISABLE_PROMPT=1
# eval "$(pyenv init --path)"
# eval "$(pyenv virtualenv-init -)"

# poetry
# add_to_path $HOME/.poetry/bin

# rvm
# source_if_exists $HOME/.rvm/scripts/rvm

# dart
# add_to_path $HOME/.pub-cache/bin

# android & flutter
# add_to_path $HOME/dev/flutter/bin
# add_to_path $HOME/dev/android/Sdk/platform-tools
# export ANDROID_HOME=$HOME/dev/android/Sdk
# export CHROME_EXECUTABLE=/usr/bin/google-chrome-stable
# export JAVA_HOME=/usr/lib/jvm/default

# go
# add_to_path $(go env GOBIN)
# add_to_path $(go env GOPATH)/bin
