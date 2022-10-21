local nvim_lsp = require('lspconfig')
local utils = require('utils')

-- Default on_attach function
local on_attach = function(client, bufnr)
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
nvim_lsp.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = flags,
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        features = "all"
        -- WebAssembly development
        -- target = "wasm32-unknown-unknown"
      }
    }
  }
}

-- tsserver
nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = flags,
}

-- eslint
nvim_lsp.eslint.setup {
  on_attach = function(client, bufnr)
    utils.map { buffer = bufnr, 'n', 'gf', '<cmd>EslintFixAll<CR>' }
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
  flags = flags,
}

-- python
nvim_lsp.pylsp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = flags,
}

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
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    signs = true,
    underline = false,
    update_in_insert = false,
  }
)
