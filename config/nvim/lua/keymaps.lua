-- Switch between current/previous buffer
vim.keymap.set('n', '<C-e>', ':e#<CR>', { noremap = false })

-- Move in command line as we know it from the terminal
vim.keymap.set('c', '<C-a>', '<Home>')
vim.keymap.set('c', '<C-d>', '<Delete>')
vim.keymap.set('c', '<C-b>', '<S-Left>')
vim.keymap.set('c', '<C-f>', '<S-Right>')

-- Window movement shortcuts
vim.keymap.set('', '<C-j>', '<C-W>j', { noremap = false })
vim.keymap.set('', '<C-k>', '<C-W>k', { noremap = false })
vim.keymap.set('', '<C-h>', '<C-W>h', { noremap = false })
vim.keymap.set('', '<C-l>', '<C-W>l', { noremap = false })

-- Telescope fuzzy finder
vim.keymap.set('n', ';', '<cmd>Telescope buffers<CR>', { noremap = false })
vim.keymap.set('n', '<Leader>f', '<cmd>Telescope live_grep<CR>', { noremap = false })
vim.keymap.set('n', '<Leader>a', '<cmd>Telescope diagnostics<CR>', { noremap = false })
vim.keymap.set('n', '<Leader>s', '<cmd>Telescope builtin<CR>', { noremap = false })
vim.keymap.set('n', '<Leader>t', '<cmd>Telescope find_files hidden=true no_ignore=false<CR>', { noremap = false })

-- LSP
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.rename()<CR>')
vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.format { async = true }<CR>')
vim.keymap.set('n', 'cd', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', '<C-j>', '<cmd>lua vim.diagnostic.jump({ count = -1 })<CR>')
vim.keymap.set('n', '<C-k>', '<cmd>lua vim.diagnostic.jump({ count = 1 })<CR>')
