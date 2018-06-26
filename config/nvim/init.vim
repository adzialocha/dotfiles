" Display settings
set encoding=utf8							" Utf8 everywhere
set t_Co=256									" Enable 256 colors
syntax on											" Syntax highlighthing on

" General configuration
set number										" Line numbers
set history=1000							" Extend undo history
set showcmd										" Show incomplete commands
set clipboard=unnamed					" Use system clipboard

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

set textwidth=0							  

" Colors
hi LineNr ctermfg=244
hi MatchParen cterm=underline ctermbg=none ctermfg=blue
hi Search cterm=none ctermfg=black ctermbg=yellow
