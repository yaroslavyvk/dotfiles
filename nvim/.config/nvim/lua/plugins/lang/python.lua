-- Python: LSP / formatter / linter
return {
  {
    'williamboman/mason.nvim',
    opts = function(_, o)
      vim.list_extend(o.ensure_installed, { 'pyright', 'black', 'isort', 'flake8' })
    end,
  },
  {
    'neovim/nvim-lspconfig',
    opts = function(_, o)
      o.servers = o.servers or {}
      o.servers.pyright = {}
    end,
  },
  {
    'nvimtools/none-ls.nvim',
    optional = true,
    opts = function(_, o)
      local n = require 'null-ls'
      o.sources = o.sources or {}
      vim.list_extend(o.sources, {
        n.builtins.formatting.black,
        n.builtins.formatting.isort,
        n.builtins.diagnostics.flake8,
      })
    end,
  },
}
