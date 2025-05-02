-- Docker & Compose
return {
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, o)
      o.ensure_installed = o.ensure_installed or {}
      table.insert(o.ensure_installed, 'dockerfile')
    end,
  },
  {
    'williamboman/mason.nvim',
    opts = function(_, o)
      vim.list_extend(o.ensure_installed, {
        'dockerfile-language-server',
        'docker-compose-language-service',
        'hadolint',
      })
    end,
  },
  {
    'neovim/nvim-lspconfig',
    opts = function(_, o)
      o.servers = o.servers or {}
      o.servers.dockerls = {}
      o.servers.docker_compose_language_service = {}
    end,
  },
  {
    'nvimtools/none-ls.nvim',
    optional = true,
    opts = function(_, o)
      local n = require 'null-ls'
      o.sources = o.sources or {}
      table.insert(o.sources, n.builtins.diagnostics.hadolint)
    end,
  },
}
