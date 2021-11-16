vim.g.lightline = {
  colorscheme = 'seoul256',
  active = {
    left = {{ 'mode', 'paste' }, { 'filename', 'modified' }},
    right = {{ 'lineinfo' }, { 'readonly' }}
  },
  component_type = {
    readonly = 'error',
  },
}

require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'seoul256',
    component_separators = {},
    section_separators = {},
    disabled_filetypes = {},
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {},
    lualine_y = {{"diagnostics", sources = {"nvim_lsp"}}},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
