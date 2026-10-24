return {
  "HiPhish/rainbow-delimiters.nvim",
  event = "VeryLazy",
  config = function()
    local rd = require "rainbow-delimiters"
    vim.g.rainbow_delimiters = {
      strategy = {
        [""] = rd.strategy["global"],
        vim = rd.strategy["local"],
      },
      query = {
        [""] = "rainbow-delimiters",
        lua = "rainbow-blocks",
      },
      highlight = {
        "RainbowDelimiterRed",
        "RainbowDelimiterYellow",
        "RainbowDelimiterBlue",
        "RainbowDelimiterOrange",
        "RainbowDelimiterGreen",
        "RainbowDelimiterViolet",
        "RainbowDelimiterCyan",
      },
    }
  end,
}
