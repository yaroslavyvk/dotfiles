-- Shell scripts: format with shfmt
return {
  {
    'williamboman/mason.nvim',
    opts = function(_, o)
      table.insert(o.ensure_installed, 'shfmt')
    end,
  },
  {
    'nvimtools/none-ls.nvim',
    optional = true,
    opts = function(_, o)
      local n = require 'null-ls'
      o.sources = o.sources or {}
      table.insert(o.sources, n.builtins.formatting.shfmt.with { extra_args = { '-i', '2' } })
    end,
  },
}
