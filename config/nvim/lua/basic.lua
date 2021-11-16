local set = vim.opt

-- Use system clipboard
set.clipboard = 'unnamedplus'

-- UTF8 everywhere
set.encoding = 'utf8'

-- Disable showmode as we have `lightline` for this (default)
set.showmode = false

-- Show line numbers
set.number = true

-- Reload automatically on file changes (default)
set.autoread = true

-- Preserve state (undo, marks, etc) in non visible buffers
set.hidden = true

-- Enable mouse support in all modes
set.mouse = 'a'

-- Disable .swp and backup files
set.swapfile = false
set.backup = false

-- Always leave gutter open
set.signcolumn = 'yes'

--
-- Color and syntax
--

-- Use dark theme
set.background = 'dark'

-- Enable syntax highlight
vim.cmd('syntax enable')

--
-- Searching
--

-- Enable incremental search
set.incsearch = true

-- Ignore the case during search
set.smartcase = true
set.ignorecase = true

--
-- Indentation and display
--

-- Set tab to two spaces
set.tabstop = 2
set.shiftwidth = 2

-- Insert spaces for tabs
set.expandtab = true

-- Break long lines by word, not character
set.linebreak = true

-- Make autoindent use same chars as previous line
set.copyindent = true

--
-- Scrolling
--

set.scroll = 4
set.scrolloff = 15
