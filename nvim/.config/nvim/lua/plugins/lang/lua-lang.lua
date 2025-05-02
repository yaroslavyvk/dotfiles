-- Lua support: LSP + formatter
return {
  {
    'williamboman/mason.nvim',
    opts = function(_, o)
      vim.list_extend(o.ensure_installed, { 'lua-language-server', 'stylua' })
    end,
  },
  {
    'neovim/nvim-lspconfig',
    opts = function(_, o)
      o.servers = o.servers or {}
      o.servers.lua_ls = { -- lua-language-server in lspconfig renamed to lua_ls
        settings = { Lua = { diagnostics = { globals = { 'vim' } } } },
      }
    end,
  },
}
