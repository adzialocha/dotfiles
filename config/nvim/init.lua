-- General editor configurations
require('basic')

-- Key bindings
require('keymaps')

-- Manage plugins via `Packer`
require('plugins')

-- Custom plugin configurations
require('plugins.cmp')
require('plugins.lspconfig')
require('plugins.lualine')
require('plugins.treesitter')

-- Custom FZF configuration
vim.cmd 'source ~/.config/nvim/fzf.vim'

-- Initialize color scheme
vim.cmd 'source ~/.config/nvim/theme.vim'

-- Alias commands
vim.cmd 'source ~/.config/nvim/alias.vim'
