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

  -- Smart and powerful comment plugin for neovim. Supports treesitter, dot
  -- repeat, left-right/up-down motions, hooks, and more 
  use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }

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

  -- Highly extendable fuzzy finder over lists.
  use {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = {
      'nvim-lua/plenary.nvim',
    },
  }

  -- fzf-native is a c port of fzf. It only covers the algorithm and implements
  -- few functions to support calculating the score.
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
  }

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
    },
  }

  -- VSCode(LSP)'s snippet feature in vim.
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/cmp-vsnip'
end)
