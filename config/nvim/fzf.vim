" Override fzf to disable syntax highlighting in preview (just use `cat`)
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--preview', 'cat {}']}, <bang>0)
