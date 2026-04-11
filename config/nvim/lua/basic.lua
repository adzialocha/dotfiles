-- Use system clipboard
vim.opt.clipboard = 'unnamedplus'

-- Show line numbers
vim.opt.number = true

-- Disable .swp files
vim.opt.swapfile = false

-- Always leave gutter open
vim.opt.signcolumn = 'yes:1'

-- Ignore the case during search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Use "cterm" attributes to force terminal colors
vim.opt.termguicolors = false

-- Set tab to two spaces
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- Insert spaces for tabs
vim.opt.expandtab = true

-- Break long lines by word, not character
vim.opt.linebreak = true

-- Make autoindent use same space as previous line
vim.opt.copyindent = true

-- Scrolling behavior
vim.opt.scroll = 4
vim.opt.scrolloff = 15

-- Show trailing whitespace
vim.opt.list = true
vim.opt.listchars = 'trail:.'

-- Rounded borders everywhere
vim.opt.winborder = "rounded"

-- Native insert-mode completion
-- o = omnifunc (language server)
-- . = scan the current buffer (max. 3)
vim.opt.complete = 'o,.^3'
vim.opt.completeopt = { 'menuone', 'noinsert', 'noselect', 'popup' }
vim.opt.autocomplete = true
vim.opt.autocompletedelay = 100

-- Maximum number of items to show in the completion popup menu
vim.opt.pumheight = 10
vim.opt.pummaxwidth = 60
