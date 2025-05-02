-- YAML / Kubernetes manifests
return {
  {
    'williamboman/mason.nvim',
    opts = function(_, o)
      vim.list_extend(o.ensure_installed, { 'yaml-language-server', 'yamllint', 'yamlfmt' })
    end,
  },
  {
    'neovim/nvim-lspconfig',
    opts = function(_, o)
      o.servers = o.servers or {}
      o.servers.yamlls = {
        settings = {
          yaml = {
            schemas = { kubernetes = '0*.yaml' },
          },
        },
      }
    end,
  },
  {
    'nvimtools/none-ls.nvim',
    optional = true,
    opts = function(_, o)
      local n = require 'null-ls'
      o.sources = o.sources or {}
      vim.list_extend(o.sources, {
        n.builtins.diagnostics.yamllint,
        n.builtins.formatting.yamlfmt,
      })
    end,
  },
}
