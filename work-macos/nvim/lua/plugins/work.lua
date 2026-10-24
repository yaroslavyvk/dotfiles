return {
  { "andweeb/presence.nvim", enabled = false },
  { "williamboman/mason.nvim", enabled = false },
  { "williamboman/mason-lspconfig.nvim", enabled = false },
  { "jay-babu/mason-null-ls.nvim", enabled = false },
  { "jay-babu/mason-nvim-dap.nvim", enabled = false },
  { "WhoIsSethDaniel/mason-tool-installer.nvim", enabled = false },
  { "mfussenegger/nvim-dap", enabled = false },
  { "rcarriga/nvim-dap-ui", enabled = false },
  { "folke/neoconf.nvim", enabled = false },
  {
    "AstroNvim/astrocore",
    opts = {
      options = { opt = { clipboard = "unnamedplus" } },
      sessions = { autosave = { last = false, cwd = false } },
    },
  },
  { "Saghen/blink.cmp", build = false, opts = { fuzzy = { implementation = "lua" } } },
  { "L3MON4D3/LuaSnip", build = false },
  { "max397574/better-escape.nvim", enabled = false },
  {
    "nvim-treesitter/nvim-treesitter",
    build = false,
    opts = function(_, opts)
      opts.ensure_installed = {}
      opts.auto_install = false
    end,
  },
  {
    "AstroNvim/astrolsp",
    opts = function(_, opts)
      opts.servers = { "lua_ls", "pyright", "ruff" }
      opts.formatting = { format_on_save = { enabled = false } }
      opts.config = {
        lua_ls = { settings = { Lua = { diagnostics = { globals = { "vim" } }, telemetry = { enable = false } } } },
        pyright = { settings = { python = { analysis = { typeCheckingMode = "basic" } } } },
      }
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      opts.debug = false
      opts.sources = { require("null-ls").builtins.formatting.stylua }
    end,
  },
}
