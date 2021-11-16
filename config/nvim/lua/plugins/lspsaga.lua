local saga = require 'lspsaga'

saga.init_lsp_saga {
  error_sign = '>>',
  warn_sign = '--',
  hint_sign = '--',
  infor_sign = '--',
  finder_definition_icon = '➤  ',
  finder_reference_icon = '➤  ',
  code_action_icon = '◆ ',
  definition_preview_icon = '◆  ',
  dianostic_header_icon = '◆  ',
  border_style = 'single',
}
