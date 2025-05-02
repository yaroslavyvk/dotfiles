-- Global LSP bootstrap: on‑attach, capabilities, Mason‑LSP glue.
return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    { 'williamboman/mason-lspconfig.nvim', config = true },
    'hrsh7th/cmp-nvim-lsp',
  },

  --- Language modules will push into opts.servers
  opts = { servers = {} },

  config = function(_, opts)
    local lsp = require 'lspconfig'
    local mlsp = require 'mason-lspconfig'
    local caps = require('cmp_nvim_lsp').default_capabilities()

    local on_attach = function(_, bufnr)
      local map = function(keys, fn, desc)
        vim.keymap.set('n', keys, fn, { buffer = bufnr, desc = 'LSP: ' .. desc })
      end
      map('gd', vim.lsp.buf.definition, 'Go to definition')
      map('gD', vim.lsp.buf.declaration, 'Go to declaration')
      map('<leader>e', vim.diagnostic.open_float, 'Show diagnostics')
    end

    -- auto‑install any server mentioned by lang modules
    mlsp.setup { ensure_installed = vim.tbl_keys(opts.servers) }

    mlsp.setup_handlers {
      function(server)
        local cfg = vim.tbl_deep_extend('force', {
          capabilities = caps,
          on_attach = on_attach,
        }, opts.servers[server] or {})

        lsp[server].setup(cfg)
      end,
    }
  end,
}
