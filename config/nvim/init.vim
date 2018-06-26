" Editor settings
set encoding=utf8							" Utf8 everywhere
syntax on											" Syntax highlighthing on

" Term & colors
set background=dark           " We use a dark theme
set termguicolors             " True colors
let base16colorspace=256      " 256 color support for Base16

" General configuration
set number										" Line numbers
set history=1000							" Extend undo history
set showcmd										" Show incomplete commands
set showmode                  " Show current mode
set clipboard=unnamed					" Use system clipboard
set hidden                    " Buffers can exist in the background

" Mouse
set ttyfast										" Send more characters for redraws
set mouse=a										" Enable mouse in all modes

" Turn off swap files
set noswapfile             		" Disable .swp files
set nobackup               		" Disable ~ backup files
set nowritebackup         		" No really
set backupdir=/var/tmp,/tmp  	" But if you do, write it here
set directory=/var/tmp,/tmp   " Or here

" Indentation and Display
set tabstop=2									" Tabs are 2 spaces wide
set shiftwidth=2							" ... indents as well
set expandtab									" Insert spaces for tabs
set smarttab									" Tabs be smart
set smartindent								" ... same for indents
set autoindent								" ... and even smarter.

" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'chriskempson/base16-vim'
Plug 'sheerun/vim-polyglot'
call plug#end()

" Base16 colorscheme 
colorscheme base16-monokai

" Colors
hi LineNr ctermfg=grey ctermbg=none guibg=none guifg=grey
hi MatchParen cterm=underline ctermbg=none ctermfg=blue
hi Search cterm=none ctermfg=black ctermbg=yellow
