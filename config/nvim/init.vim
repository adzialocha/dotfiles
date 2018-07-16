" Editor settings
set encoding=utf8              " Utf8 everywhere
syntax on                      " Syntax highlighthing on

" Term & colors
set background=dark            " We use a dark theme

" General configuration
set number                     " Line numbers
set history=1000               " Extend undo history
set showcmd                    " Show incomplete commands
set showmode                   " Show current mode
set clipboard=unnamed          " Use system clipboard
set hidden                     " Buffers can exist in the background

" Mouse
set ttyfast                    " Send more characters for redraws
set mouse=a                    " Enable mouse in all modes

" Turn off swap files
set noswapfile                 " Disable .swp files
set nobackup                   " Disable ~ backup files
set nowritebackup              " No really
set backupdir=/var/tmp,/tmp    " But if you do, write it here
set directory=/var/tmp,/tmp    " Or here

" Indentation and Display
set tabstop=2                  " Tabs are 2 spaces wide
set shiftwidth=2               " ... indents as well
set expandtab                  " Insert spaces for tabs
set smarttab                   " Tabs be smart
set smartindent                " ... same for indents
set autoindent                 " ... and even smarter.

" Show whitespace chars & assign to color group
set list listchars=trail:.,extends:>
match Whitespace /\s/

" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug '/usr/local/opt/fzf'
Plug 'Raimondi/delimitMate'
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
call plug#end()

" Colors
hi LineNr ctermfg=244 ctermbg=none
hi MatchParen cterm=underline ctermbg=none ctermfg=blue
hi Search cterm=none ctermfg=black ctermbg=yellow
hi Whitespace ctermfg=244

" Function: Removes trailing spaces
function TrimWhiteSpace()
  %s/\s*$//
  ''
endfunction

" Key mappings
map <F2> :call TrimWhiteSpace()<CR>
map! <F2> :call TrimWhiteSpace()<CR>
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>f :Files ~<CR>
