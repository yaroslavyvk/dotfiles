---@type LazySpec
return {
  "rainbowhxch/accelerated-jk.nvim",
  event = "VeryLazy",
  opts = {
    mode = "time_driven",
    enable_deceleration = true,
    acceleration_motions = { "j", "k" },
    acceleration_table = { 3, 6, 9, 12, 15 },
  },
  config = function(_, opts)
    require("accelerated-jk").setup(opts)
    vim.keymap.set("n", "j", "<Plug>(accelerated_jk_gj)", { silent = true })
    vim.keymap.set("n", "k", "<Plug>(accelerated_jk_gk)", { silent = true })
  end,
}
