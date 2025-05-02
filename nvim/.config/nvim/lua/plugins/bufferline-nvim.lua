return {
  "akinsho/bufferline.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    options = {
      separator_style       = "thin",
      show_buffer_close_icons = true,
      show_close_icon         = true,
      always_show_bufferline  = true,
      diagnostics             = "nvim_lsp",
      offsets = {
        { filetype = "neo-tree", text = "📁 Explorer", text_align = "left" }
      },
    }
  }
}
