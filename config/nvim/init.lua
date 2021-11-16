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
require('plugins.rust-tools')
require('plugins.treesitter')

-- Initialize color scheme
vim.cmd 'source ~/.config/nvim/theme.vim'

-- Alias commands
vim.cmd 'source ~/.config/nvim/alias.vim'
