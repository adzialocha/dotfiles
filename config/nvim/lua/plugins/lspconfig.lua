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
      cargo = {
        features = "all",
      },
      check = {
        allTargets = true,
        features = "all",
      },
      hover = {
        memoryLayout = {
          enable = true,
          niches = true,
        },
      },
      imports = {
        merge = {
          glob = false,
        },
      },
      diagnostics = {
        enable = true,
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

-- svelte
nvim_lsp.svelte.setup {
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

-- Rounded borders
local hover = vim.lsp.buf.hover
vim.lsp.buf.hover = function()
    return hover({
        border = "rounded",
        max_width = math.floor(vim.o.columns * 0.5),
        -- max_height = math.floor(vim.o.lines * 0.5),
    })
end

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {} 
  opts.border = opts.border or 'rounded'

  return orig_util_open_floating_preview(contents, syntax, opts, ...) 
end

vim.diagnostic.config({
  -- Do not show inline diagnostics
  virtual_text = false,
  -- Our custom gutter signs.
  signs = {
      text = {
          [vim.diagnostic.severity.ERROR] = '> ',
          [vim.diagnostic.severity.WARN] = '- ',
          [vim.diagnostic.severity.HINT] = '- ',
          [vim.diagnostic.severity.INFO] = '- ',
      },
  },
  -- Do not underline them
  underline = false,
  update_in_insert = false,
})
