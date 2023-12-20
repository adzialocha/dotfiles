local telescope = require('telescope')

local actions = require('telescope.actions')
local layout_strategies = require('telescope.pickers.layout_strategies')
local previewers = require("telescope.previewers")

-- Custom layout with all titles removed
layout_strategies.custom = function(picker, max_columns, max_lines, layout_config)
  local layout = layout_strategies.horizontal(picker, max_columns, max_lines, layout_config)
  layout.results.title = ''
  layout.prompt.title = ''
  layout.preview.title = ''
  return layout
end

-- Custom previewer since we don't want syntax highlighting
local custom_previewer_maker = function(filepath, bufnr, opts)
  opts.use_ft_detect = false
  previewers.buffer_previewer_maker(filepath, bufnr, opts)
end

telescope.setup {
  defaults = {
    layout_strategy = 'custom',
    buffer_previewer_maker = custom_previewer_maker,
    preview = {
      check_mime_type = false,
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

telescope.load_extension('fzf')
