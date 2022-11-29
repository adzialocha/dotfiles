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

" Adjust floating windows to look like the rest
hi FloatBorder ctermfg=darkgrey ctermbg=black
hi NormalFloat ctermfg=lightgrey ctermbg=black
