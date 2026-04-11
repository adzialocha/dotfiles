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
    lualine_c = {
      'filename',
      {
        'lsp_status',
        symbols = {
          spinner = { '∙∙∙' },
          done = '',
        },
        show_name = false,
      },
    },
    lualine_x = {},
    lualine_y = {
      { 'diagnostics', sources = { 'nvim_diagnostic' } }
    },
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
