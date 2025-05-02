return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
    integrations = {
        bufferline = true,
      },
    })
    vim.cmd.colorscheme "catppuccin"
  end,
}
