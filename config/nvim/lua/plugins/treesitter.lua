require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'html',
    'javascript',
    'jsdoc',
    'json',
    'markdown',
    'python',
    'rust',
    'scss',
    'toml',
    'tsx',
    'typescript',
    'yaml',
  },
  highlight = {
    enable = true,
  },
}

local parser_config = require 'nvim-treesitter.parsers'.get_parser_configs()
parser_config.tsx.filetype_to_parsername = {'javascript', 'typescript.tsx'}
