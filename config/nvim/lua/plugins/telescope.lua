local telescope = require('telescope')

local actions = require('telescope.actions')
local previewers = require("telescope.previewers")

-- Custom previewer since we don't want syntax highlighting
local custom_previewer_maker = function(filepath, bufnr, opts)
  opts.use_ft_detect = false
  previewers.buffer_previewer_maker(filepath, bufnr, opts)
end

telescope.setup {
  defaults = {
    results_title = false,
    dynamic_preview_title = true,
    prompt_title = false,
    buffer_previewer_maker = custom_previewer_maker,
    preview = {
      check_mime_type = false,
      treesitter = false,
    },
    mappings = {
      i = {
        -- We don't want to press ESC twice to exit in insert-mode
        ['<esc>'] = actions.close
      },
    },
    file_ignore_patterns = {
      '.git/',
    },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden', -- Add hidden files to ripgrep selection
    }
  },
}

-- FZF sorter for telescope written in c
telescope.load_extension('fzf')
