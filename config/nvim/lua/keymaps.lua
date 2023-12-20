local utils = require('utils')

-- Select and sort paragraph
utils.map {'n', '<Leader>i', 'vip:sort<CR>', noremap = false}

-- Switch between current/previous buffer
utils.map {'n', '<C-e>', ':e#<CR>', noremap = false}

-- Remove current search highlight
utils.map {'n', '<F3>', ':noh<CR>'}

-- Move in command line as we know it from the terminal
utils.map {'c', '<C-a>', '<Home>'}
utils.map {'c', '<C-d>', '<Delete>'}
utils.map {'c', '<C-b>', '<S-Left>'}
utils.map {'c', '<C-f>', '<S-Right>'}

-- Window movement shortcuts
utils.map {'', '<C-j>', '<C-W>j', noremap = false}
utils.map {'', '<C-k>', '<C-W>k', noremap = false}
utils.map {'', '<C-h>', '<C-W>h', noremap = false}
utils.map {'', '<C-l>', '<C-W>l', noremap = false}

-- Telescope fuzzy finder
utils.map {'n', ';', '<cmd>Telescope buffers<CR>', noremap = false}
utils.map {'n', '<Leader>f', '<cmd>Telescope live_grep<CR>', noremap = false}
utils.map {'n', '<Leader>a', '<cmd>Telescope grep_string<CR>', noremap = false}
utils.map {'n', '<Leader>s', '<cmd>Telescope treesitter<CR>', noremap = false}
utils.map {'n', '<Leader>t', '<cmd>Telescope find_files hidden=true no_ignore=true<CR>', noremap = false}

-- lsp
utils.map {'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>'}
utils.map {'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>'}
utils.map {'n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>'}
utils.map {'n', 'gf', '<cmd>lua vim.lsp.buf.format { async = true }<CR>'}
utils.map {'n', 'cd', '<cmd>lua vim.diagnostic.open_float()<CR>'}
utils.map {'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>'}
utils.map {'n', '<C-j>', '<cmd>lua vim.diagnostic.goto_prev()<CR>'}
utils.map {'n', '<C-k>', '<cmd>lua vim.diagnostic.goto_next()<CR>'}
utils.map {'n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>'}
