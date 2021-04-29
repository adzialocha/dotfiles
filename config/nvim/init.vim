" Vim options
" -----------------------------------------------------------------------------


" General configuration
set clipboard=unnamedplus      " Use system clipboard
set encoding=utf8              " Utf8 everywhere
set hidden                     " Buffers can exist in the background
set history=1000               " Extend undo history
set noshowmode                 " We have lightline for this
set number                     " Line numbers
set showcmd                    " Show incomplete commands
set autoread                   " Reload automatically on file changes

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
set copyindent                 " Make autoindent use same chars as prev line
set smarttab                   " Tabs be smart
set smartindent                " ... same for indents
set autoindent                 " ... and even smarter
set linebreak                  " Break long lines by word, not char

" Scrolling
set scroll=4                   " Number of lines to scroll with ^U/^D
set scrolloff=15               " Keep cursor away from this many chars

" Searching
set smartcase                  " Lets you search for ALL CAPS

" Plugins & Settings
" -----------------------------------------------------------------------------


" Install plugins via plugged
call plug#begin('~/.config/nvim/plugged')
Plug 'Raimondi/delimitMate'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'brooth/far.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'maximbaz/lightline-ale'
Plug 'pangloss/vim-javascript'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
call plug#end()

" Lightline
let g:lightline = {
\ 'colorscheme': 'seoul256',
\ 'active': {
\   'left': [
\     ['mode', 'paste'],
\     ['filename', 'modified']
\   ],
\   'right': [
\     ['lineinfo'],
\     ['readonly', 'linter_warnings', 'linter_errors']
\   ]
\ },
\ 'component_expand': {
\   'linter_warnings': 'lightline#ale#warnings',
\   'linter_errors': 'lightline#ale#errors',
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error',
\ },
\ }

" ALE
let g:ale_lint_on_text_changed = 'never' " Do not automatically check while editing
let g:ale_set_loclist = 0                " Do not use loclist

" Configure linters and fixers
let g:ale_linters = {
\ 'rust': ['analyzer'],
\ }
let g:ale_fixers = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ 'javascript': ['eslint', 'standard'],
\ 'rust': ['rustfmt'],
\ 'scss': ['stylelint'],
\ 'typescript': ['eslint', 'standard'],
\ 'typescriptreact': ['eslint', 'standard'],
\ }

" FZF
fun! SetupCommandAlias(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfun

" Ag
call SetupCommandAlias("ag","Ag")

" Deoplete
let g:deoplete#enable_at_startup = 1

call deoplete#custom#option({
\ 'auto_complete_delay': 200,
\ })

set completeopt-=preview

" Color and syntax
" -----------------------------------------------------------------------------


" Settings
set background=dark            " We use a dark theme
syntax on                      " Syntax highlighthing on

" TypeScript + React syntax highlighting is ugly, just take the js one
autocmd BufNewFile,BufRead *.tsx set syntax=javascript
autocmd BufNewFile,BufRead *.ts set syntax=javascript

" Show whitespace chars & assign to color group
set list listchars=trail:.,extends:>
match Whitespace /\s/
hi Whitespace ctermfg=grey

" Use similar line colors like our zsh prompt
hi LineNr ctermfg=grey ctermbg=none

" Change the gutter color to something less strong
hi SignColumn ctermbg=none

" Make match visible
hi MatchParen cterm=underline ctermbg=none ctermfg=blue

" Nice looking search highlighting
hi Search cterm=none ctermfg=black ctermbg=yellow

" ALE linter plugin colors
hi ALEErrorSign ctermbg=none ctermfg=red
hi ALEWarningSign ctermbg=none ctermfg=yellow
hi ALEStyleWarning ctermfg=black
hi ALEStyleWarning ctermbg=yellow
hi ALEWarning ctermfg=black
hi ALEWarning ctermbg=yellow
hi ALEStyleError ctermfg=black
hi ALEStyleError ctermbg=red
hi ALEError ctermfg=black
hi ALEError ctermbg=red

" Deoplete autocomplete plugin colors
hi Pmenu ctermbg=235 ctermfg=white
hi PmenuSel ctermbg=cyan ctermfg=black
hi PmenuSbar ctermbg=235
hi PmenuThumb ctermbg=grey



" Key mappings
" -----------------------------------------------------------------------------


" Do not open help menu on F1
map <F1> <nop>

" Select and sort paragraph
nmap <Leader>i vip:sort<CR>

" Switch between current/previous buffer
nmap <C-e> :e#<CR>

" Move in command line as we know it from terminals
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-d> <Delete>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>

" Window movement shortcuts
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" ALE move to next linting error
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" ALE fix lint errors
nmap <silent> <F1> <Plug>(ale_fix)

" ALE Language Server
nmap <silent> K <Plug>(ale_hover)
nmap <silent> gd <Plug>(ale_go_to_definition)
nmap <silent> <F2> <Plug>(ale_rename)

" FZF Search
nmap ; :Buffers<CR>
nmap <Leader>t :Files<CR>
nmap <Leader>f :Files ~<CR>
