return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  lazy = false,
  opts = {
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    transparent_background = false,
    term_colors = true,
    integrations = {
      cmp = true,
      gitsigns = true,
      treesitter = true,
      telescope = { enabled = true },
      neotree = true,
      which_key = true,
      lsp_trouble = true,
      native_lsp = { enabled = true, inlay_hints = { background = true } },
      dap = { enabled = true, enable_ui = true },
    },
  },
}
-- return {
--   "rose-pine/neovim",
--   name = "rose-pine",
--   lazy = false,
--   priority = 1000,
--   opts = {
--     variant = "moon", -- "auto", "main", "moon", "dawn"
--     dark_variant = "main",
--   },
-- }
