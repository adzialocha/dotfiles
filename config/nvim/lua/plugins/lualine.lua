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
        'lsp_progress',
        display_components = { 'lsp_client_name' },
        progress_enddelay = 0,
        lsp_client_name_enddelay = 0,
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
