local has_catppuccin, catppuccin_bufferline = pcall(require, "catppuccin.groups.integrations.bufferline")

-- Fallback palette (mocha) if you haven’t upgraded Catppuccin
local C = {
  mantle = "#1e1e2e",
  -- surface0 = "#313244",
  -- overlay1 = "#7f849c",
  -- text = "#cdd6f4",
  -- pink = "#f5c2e7",
}

return {
  "akinsho/bufferline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "catppuccin/nvim", -- optional, for real integration
  },
  -- Load this *after* catppuccin so the module exists
  after = "catppuccin",
  opts = {
    options = {
      mode = "buffers",
      separator_style = { left = "", right = "" },
      -- other valid strings:
      --   "slant"        – tight diagonal cut
      --   "padded_slant" – diagonal with a little padding (most rounded feel)
      --   "thick"        – chunky full-height lines
      --   "thin"         – single-line separators
      show_buffer_close_icons = false,
      show_close_icon = false,
      always_show_bufferline = true,
      diagnostics = "nvim_lsp",
      offsets = {
        {
          filetype = "neo-tree",
          text = "📁 Explorer",
          text_align = "left",
        },
      },
    },
    highlights = has_catppuccin and catppuccin_bufferline.get() or {
      fill = { bg = C.mantle }, -- the bar background
    },
  },
}
