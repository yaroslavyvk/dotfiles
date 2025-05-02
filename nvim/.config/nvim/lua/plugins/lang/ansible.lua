-- Ansible playbooks / roles
return {
  {
    'williamboman/mason.nvim',
    opts = function(_, o)
      vim.list_extend(o.ensure_installed, { 'ansible-language-server', 'ansible-lint' })
    end,
  },
  {
    'neovim/nvim-lspconfig',
    opts = function(_, o)
      o.servers = o.servers or {}
      o.servers.ansiblels = {}
    end,
  },
  {
    'nvimtools/none-ls.nvim',
    optional = true,
    opts = function(_, o)
      local n = require 'null-ls'
      o.sources = o.sources or {}
      table.insert(o.sources, n.builtins.diagnostics.ansible_lint)
    end,
  },
}
