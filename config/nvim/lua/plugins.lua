-- Bootstrap "packer" on new systems.
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function()
  -- The vim package manager `packer` can manage itself.
  use 'wbthomason/packer.nvim'

  -- A collection of common configurations for Neovim's built-in language
  -- server client.
  use 'neovim/nvim-lspconfig'

  -- Surround.vim is all about "surroundings": parentheses, brackets, quotes,
  -- XML tags, and more. The plugin provides mappings to easily delete, change
  -- and add such surroundings in pairs.
  use 'tpope/vim-surround'

  -- If you've ever tried using the . command after a plugin map, you were
  -- likely disappointed to discover it only repeated the last native command
  -- inside that map, rather than the map as a whole. That disappointment ends
  -- today.
  use 'tpope/vim-repeat'

  -- Comment text in and out, written in lua. Supports commenting out the
  -- current line, a visual selection and a motion.
  use 'b3nj5m1n/kommentary'

  -- Support projects .editorconfig files automatically.
  use 'editorconfig/editorconfig-vim'

  -- Provides automatic closing of quotes, parenthesis, brackets, etc., besides
  -- some other related features that should make your time in insert mode a
  -- little bit easier, like syntax awareness (will not insert the closing
  -- delimiter in comments and other configurable regions), and expansions (off
  -- by default), and some more.
  use 'Raimondi/delimitMate'

  -- Fast and easy to configure neovim statusline written in pure lua.
  use 'hoob3rt/lualine.nvim'

  -- Things you can do with fzf and Vim.
  use { 'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
  use { 'junegunn/fzf.vim' }

  -- The goal of nvim-treesitter is both to provide a simple and easy way to
  -- use the interface for tree-sitter in Neovim and to provide some basic
  -- functionality such as highlighting based on it.
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- A completion engine plugin for neovim written in Lua. Completion sources
  -- are installed from external repositories and "sourced".
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
    }
  }

  -- VSCode(LSP)'s snippet feature in vim.
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/cmp-vsnip'
end)
