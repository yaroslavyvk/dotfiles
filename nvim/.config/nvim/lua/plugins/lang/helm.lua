-- Helm charts (YAML but with templates)
return {
  { 'towolf/vim-helm', ft = 'helm' },

  {
    'williamboman/mason.nvim',
    opts = function(_, o)
      vim.list_extend(o.ensure_installed, { 'helm-ls' })
    end,
  },
  {
    'neovim/nvim-lspconfig',
    opts = function(_, o)
      o.servers = o.servers or {}
      o.servers.helm_ls = {
        settings = { ['helm-ls'] = { yamlls = { path = 'yaml-language-server' } } },
      }
    end,
  },
}
