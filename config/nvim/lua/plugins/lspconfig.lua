-- Returns true of the completion menu is open
local function pumvisible()
  return tonumber(vim.fn.pumvisible()) ~= 0
end

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

    -- Disable syntax highlighting as it looks ugly
    client.server_capabilities.semanticTokensProvider = nil

    -- Enable completion on LSP client attach
    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, ev.buf, {
        autotrigger = true,
        convert = function(item)
          return {
            -- Remove parentheses from function/method completion items
            abbr = item.label:gsub("%b()", "")
          }
        end,
      })
    end

    -- Use [Enter] or [Ctrl-Y] to select an item from completion menu
    vim.keymap.set('i', '<cr>', function()
      return pumvisible() and '<C-y>' or '<cr>'
    end, { expr = true })
  end
})

-------------
-- Servers --
-------------

-- rust
vim.lsp.config['rust_analyzer'] = {
  settings = {
    ["rust-analyzer"] = {
      assist = {
        expressionFillDefault = "default",
        preferSelf = true,
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
        granularity = {
          group = "module",
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

vim.lsp.enable('rust_analyzer')
vim.lsp.enable('eslint')
vim.lsp.enable('ts_ls')

-------------
-- Styling --
-------------

local hover = vim.lsp.buf.hover
vim.lsp.buf.hover = function()
  return hover({
    max_width = math.floor(vim.o.columns * 0.5),
    max_height = math.floor(vim.o.lines * 0.5),
  })
end

vim.diagnostic.config({
  severity_sort = true,
  -- Do not show inline diagnostics
  virtual_text = false,
  -- Our custom gutter signs
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
  jump = {
    -- Show diagnostic when jumping to it in hover
    on_jump = function (diagnostic, bufnr)
      if not diagnostic then return end
      vim.diagnostic.open_float({
        bufnr = bufnr,
        namespace = diagnostic.namespace,
        scope = 'cursor',
        focus = false,
      })
    end
  },
})
