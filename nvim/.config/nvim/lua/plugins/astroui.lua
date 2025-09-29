---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    colorscheme = "catppuccin",
    -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
    highlights = {
      init = {
        Normal = { bg = "none" },
        NormalNC = { bg = "none" },
        NormalFloat = { bg = "none" },
        FloatBorder = { bg = "none" },
        SignColumn = { bg = "none" },
        StatusLine = { bg = "none" },
        StatusLineNC = { bg = "none" },
        -- top bars
        WinBar = { bg = "NONE" },
        WinBarNC = { bg = "NONE" },
        TabLine = { bg = "NONE" },
        TabLineFill = { bg = "NONE" },
        TabLineSel = { bg = "NONE" },
        NeoTreeNormal = { bg = "NONE" },
        NeoTreeNormalNC = { bg = "NONE" },
        NeoTreeWinSeparator = { fg = "NONE", bg = "NONE" },
        NeoTreeTabSeparator = { bg = "NONE" },
        NeoTreeTabline = { bg = "NONE" },
      },

      ["catppuccin"] = { -- a table of overrides/changes when applying the astrotheme theme
        -- Normal = { bg = "#000000" },
        Comment = { italic = true },
      },
    },

    status = {
      colors = {
        git_branch_fg = "#89b4fa",
        treesitter_fg = "#a6e3a1",
        lsp_fg = "#f9e2af",
      },
      attributes = {
        git_branch = { bold = true },
        file_info = { bold = true },
      },
      separators = {
        left = { "", " " },
        right = { " ", "" },
      },
      icon_highlights = {
        file_icon = { statusline = true },
      },
    },
    -- Icons can be configured throughout the interface
    icons = {
      -- configure the loading of the lsp in the status line
      LSPLoading1 = "⠋",
      LSPLoading2 = "⠙",
      LSPLoading3 = "⠹",
      LSPLoading4 = "⠸",
      LSPLoading5 = "⠼",
      LSPLoading6 = "⠴",
      LSPLoading7 = "⠦",
      LSPLoading8 = "⠧",
      LSPLoading9 = "⠇",
      LSPLoading10 = "⠏",
    },
  },
}
