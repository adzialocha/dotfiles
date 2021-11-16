local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys after the language
-- server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Do not show inline diagnostics and do not underline them
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    signs = true,
    underline = false,
    update_in_insert = false,
  }
)

-- Default flags
flags = {
  debounce_text_changes = 150,
}

-- rust_analyzer
nvim_lsp.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = flags,
}

-- tsserver
nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = flags,
}

-- eslint
nvim_lsp.eslint.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = flags,
}

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
