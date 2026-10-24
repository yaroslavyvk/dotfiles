return {
  "karb94/neoscroll.nvim",
  event = "WinScrolled",
  config = function()
    require("neoscroll").setup({
      easing_function = "quadratic",
      hide_cursor = true,
      stop_eof = true,
    })
  end,
}
