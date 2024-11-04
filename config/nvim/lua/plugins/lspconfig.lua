local utils = require('utils')

-- Default on_attach function
local on_attach = function(client, bufnr)
  -- Disable syntax highlighting as it looks ugly
  client.server_capabilities.semanticTokensProvider = nil

  -- Enable completion triggered by <c-x><c-o>
  utils.map { buffer = bufnr, 'n', 'omnifunc', 'v:lua.vim.lsp.omnifunc' }
end

-- Default capabilities with nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Default flags
local flags = {
  debounce_text_changes = 150,
}

-------------
-- Servers --
-------------

-- rust_analyzer
vim.lsp.config['rust_analyzer'] = {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = flags,
  settings = {
    ["rust-analyzer"] = {
      assist = {
        expressionFillDefault = "default",
      },
      semanticHighlighting = {
        doc = {
          comment = {
            inject = {
              enable = false,
            },
          },
        },
      },
      hover = {
        memoryLayout = {
          niches = true,
        },
      },
      diagnostics = {
        styleLints = {
          enable = true,
        },
      },
      checkOnSave = true,
    }
  }
}

-- tsserver
vim.lsp.config['ts_ls'] = {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = flags,
}

-- eslint
vim.lsp.config['eslint'] = {
  on_attach = function(client, bufnr)
    utils.map { buffer = bufnr, 'n', 'gf', '<cmd>EslintFixAll<CR>' }
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
  flags = flags,
}

-- svelte
vim.lsp.config['svelte'] = {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = flags,
}

-- python
vim.lsp.config['pylsp'] = {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = flags,
}

vim.lsp.enable('rust_analyzer')
vim.lsp.enable('ts_ls')
vim.lsp.enable('eslint')

-------------
-- Styling --
-------------

-- Change gutter signs
local signs = { Error = "> ", Warn = "- ", Hint = "- ", Info = "- " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Make floating window styling consistent
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or 'single'
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- Do not show inline diagnostics and do not underline them
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = false,
  update_in_insert = false,
})
