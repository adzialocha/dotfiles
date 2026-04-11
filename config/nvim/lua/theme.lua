-- Workaround to continue using colors from terminal instead of new neovim
-- 0.10.0 default theme
vim.cmd('colorscheme vim')

-- Use similar line colors like our zsh prompt
vim.api.nvim_set_hl(0, 'LineNr', { ctermfg = 'Grey' })

-- Change the gutter color to something less strong
vim.api.nvim_set_hl(0, 'SignColumn', {})

-- Show trailing whitespace
vim.api.nvim_set_hl(0, 'Whitespace', { ctermfg = 'Grey' })

-- Make match visible
vim.api.nvim_set_hl(0, 'MatchParen', { underline = true,  ctermfg = 'Blue' })

-- Nice looking search highlighting
vim.api.nvim_set_hl(0, 'Search', { ctermfg = 'Black', ctermbg = 'Yellow' })

-- Adjust floating windows to look like the rest
vim.api.nvim_set_hl(0, 'FloatBorder', { ctermfg = 'DarkGrey', ctermbg = 'Black' })
vim.api.nvim_set_hl(0, 'NormalFloat', { ctermfg = 'LightGrey', ctermbg = 'Black' })

-- Make telescope look like like the rest
vim.api.nvim_set_hl(0, 'TelescopeBorder', { ctermfg = 'DarkGrey' })
vim.api.nvim_set_hl(0, 'TelescopeMatching', { ctermfg = 'Black', ctermbg = 'Yellow' })
vim.api.nvim_set_hl(0, 'TelescopePreviewLine', { ctermfg = 'Black', ctermbg = 'LightGrey' })
vim.api.nvim_set_hl(0, 'TelescopePreviewMatch', { ctermfg = 'Black', ctermbg = 'Yellow' })
vim.api.nvim_set_hl(0, 'TelescopePromptCounter', { ctermfg = 'DarkGrey' })
vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', { ctermfg = 'DarkGrey' })
vim.api.nvim_set_hl(0, 'TelescopeSelection', { ctermfg = 'Black', ctermbg = 'LightGrey' })

-- Completion Popup
vim.api.nvim_set_hl(0, 'Pmenu', { ctermfg = 'LightGrey', ctermbg = 'DarkGrey' })
vim.api.nvim_set_hl(0, 'PmenuSel', { ctermfg = 'LightGrey', ctermbg = 'Blue' })
