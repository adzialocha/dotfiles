local gh = function(suffix)
  return 'https://github.com/' .. suffix
end

vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    if ev.data.spec.name == 'telescope-fzf-native.nvim' then
      vim.system({ 'make' }, { cwd = ev.data.path })
    end
  end,
})

vim.pack.add({
  -- All the lua functions I don't want to write twice.
  gh('nvim-lua/plenary.nvim'),

  -- A collection of common configurations for Neovim's built-in language
  -- server client.
  gh('neovim/nvim-lspconfig'),

  -- Fast and easy to configure neovim statusline written in pure lua.
  gh('hoob3rt/lualine.nvim'),

  -- fzf-native is a c port of fzf. It only covers the algorithm and implements
  -- few functions to support calculating the score.
  gh('nvim-telescope/telescope-fzf-native.nvim'),

  -- Highly extendable fuzzy finder over lists.
  {
    src = gh('nvim-telescope/telescope.nvim'),
    version = 'v0.2.2',
  },
})
