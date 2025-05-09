-- Global LSP bootstrap: on‑attach, capabilities, Mason‑LSP glue.
return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    -- ← drop `config = true` here
    { "williamboman/mason-lspconfig.nvim" },
    "hrsh7th/cmp-nvim-lsp",
  },
  opts = {
    servers = {
      dockerls = {},
      helm_ls = {},
      lua_ls = {},
      pyright = {},
      terraformls = {},
      yamlls = {},
    },
  },
  config = function(_, opts)
    local lsp = require("lspconfig")
    local mlsp = require("mason-lspconfig")
    local caps = require("cmp_nvim_lsp").default_capabilities()

    local on_attach = function(_, bufnr)
      local map = function(keys, fn, desc)
        vim.keymap.set("n", keys, fn, { buffer = bufnr, desc = "LSP: " .. desc })
      end
      map("gd", vim.lsp.buf.definition, "Go to definition")
      map("gD", vim.lsp.buf.declaration, "Go to declaration")
      map("<leader>e", vim.diagnostic.open_float, "Show diagnostics")
    end

    mlsp.setup({
      ensure_installed = vim.tbl_keys(opts.servers),
      automatic_enable = false,
    })

    for server, server_opts in pairs(opts.servers) do
      local cfg = vim.tbl_deep_extend("force", {
        capabilities = caps,
        on_attach = on_attach,
      }, server_opts)

      lsp[server].setup(cfg)
    end
  end,
}
