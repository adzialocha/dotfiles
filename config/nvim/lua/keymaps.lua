-- Helper method to make keybindings non-recursive and create them with given
-- defaults
local map = function(key)
  -- Get the extra options
  local opts = {noremap = true}
  for i, v in pairs(key) do
    if type(i) == 'string' then opts[i] = v end
  end

  -- Basic support for buffer-scoped keybindings
  local buffer = opts.buffer
  opts.buffer = nil

  if buffer then
    vim.api.nvim_buf_set_keymap(0, key[1], key[2], key[3], opts)
  else
    vim.api.nvim_set_keymap(key[1], key[2], key[3], opts)
  end
end

-- Select and sort paragraph
map {'n', '<Leader>i', 'vip:sort<CR>', noremap = false}

-- Switch between current/previous buffer
map {'n', '<C-e>', ':e#<CR>', noremap = false}

-- Move in command line as we know it from the terminal
map {'c', '<C-a>', '<Home>'}
map {'c', '<C-d>', '<Delete>'}
map {'c', '<C-b>', '<S-Left>'}
map {'c', '<C-f>', '<S-Right>'}

-- Window movement shortcuts
map {'', '<C-j>', '<C-W>j', noremap = false}
map {'', '<C-k>', '<C-W>k', noremap = false}
map {'', '<C-h>', '<C-W>h', noremap = false}
map {'', '<C-l>', '<C-W>l', noremap = false}

-- FZF Search
map {'n', ';', ':Buffers<CR>', noremap = false}
map {'n', '<Leader>t', ':Files<CR>', noremap = false}
map {'n', '<Leader>f', ':Files ~<CR>', noremap = false}

-- LSP Saga
map {'n', 'gh', ':Lspsaga lsp_finder<CR>'}
map {'n', 'K', ':Lspsaga hover_doc<CR>'}
map {'n', 'gd', ':Lspsaga preview_definition<CR>', noremap = false}
map {'n', '<C-j>', ':Lspsaga diagnostic_jump_next<CR>', noremap = false}
map {'n', '<C-k>', ':Lspsaga diagnostic_jump_prev<CR>', noremap = false}
map {'n', 'cd', ':Lspsaga show_line_diagnostics<CR>', noremap = false}
