local telescope = require('telescope')
local layout_strategies = require('telescope.pickers.layout_strategies')
local actions = require('telescope.actions')

layout_strategies.custom = function(picker, max_columns, max_lines, layout_config)
  local layout = layout_strategies.horizontal(picker, max_columns, max_lines, layout_config)
  layout.results.title = ''
  layout.prompt.title = ''
  layout.preview.title = ''
  return layout
end

telescope.setup {
  defaults = {
    layout_strategy = 'custom',
    preview = {
      check_mime_type = false,
      treesitter = false,
    },
    mappings = {
      i = {
        ['<esc>'] = actions.close
      },
    },
    -- vimgrep_arguments = {
    --   'ag'
    -- },
  },
}

telescope.load_extension('ag')
telescope.load_extension('fzf')
