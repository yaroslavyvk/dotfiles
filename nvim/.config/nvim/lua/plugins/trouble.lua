return {
  {
    'folke/trouble.nvim',
    lazy = false,
    cmd = 'TroubleToggle',
    dependencies = { 'nvim-tree/nvim-web-devicons' },

    keys = {
      { '<leader>xx', '<cmd>TroubleToggle<cr>', desc = 'Trouble: Toggle' },
      { '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>', desc = 'Trouble: Workspace Diagnostics' },
      { '<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>', desc = 'Trouble: Document Diagnostics' },
      { '<leader>xl', '<cmd>TroubleToggle loclist<cr>', desc = 'Trouble: Loclist' },
      { '<leader>xq', '<cmd>TroubleToggle quickfix<cr>', desc = 'Trouble: Quickfix' },
      { 'gR', '<cmd>TroubleToggle lsp_references<cr>', desc = 'Trouble: LSP References' },
    },

    opts = {
      use_diagnostic_signs = true,
    },

    config = function(_, opts)
      require('trouble').setup(opts)

      local icons = {
        Error = ' ',
        Warning = ' ',
        Hint = ' ',
        Information = ' ',
      }
      for type, icon in pairs(icons) do
        local hl = 'DiagnosticSign' .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end
    end,
  },
}
