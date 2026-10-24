---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    colorscheme = "catppuccin",
    -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
    highlights = {
      init = {
        -- Normal = { bg = "NONE" },
        -- NormalNC = { bg = "NONE" },
        --
        -- -- Floating windows залишаємо трохи видимими для читабельності
        -- NormalFloat = { bg = "#181825", blend = 15 },
        -- FloatBorder = { bg = "NONE", fg = "#89b4fa" },
        --
        -- -- Neo-tree (бічна панель файлів) залишаємо непрозорою
        -- NeoTreeNormal = { bg = "#181825" },
        -- NeoTreeNormalNC = { bg = "#181825" },
        --
        -- -- Statusline (нижня панель) - залишаємо непрозорою
        -- StatusLine = { bg = "#1e1e2e" },
        -- StatusLineNC = { bg = "#1e1e2e" },
        --
        -- -- Tabline (верхня панель з вкладками)
        -- TabLine = { bg = "#1e1e2e" },
        -- TabLineFill = { bg = "#1e1e2e" },
        -- TabLineSel = { bg = "#313244", bold = true },
        --
        -- -- Додаткові групи для буферної лінії
        -- BufferLineFill = { bg = "#1e1e2e" },
        -- BufferLineBackground = { bg = "#1e1e2e" },
        -- BufferLineTab = { bg = "#1e1e2e" },
        -- BufferLineTabClose = { bg = "#1e1e2e" },
        --
        -- -- ЦЕ КЛЮЧОВИЙ МОМЕНТ - сепаратори для буферної лінії
        -- -- Ці групи відповідають за трикутники між вкладками
        -- BufferLineSeparator = { bg = "#1e1e2e", fg = "#1e1e2e" },
        -- BufferLineSeparatorVisible = { bg = "#1e1e2e", fg = "#1e1e2e" },
        -- BufferLineSeparatorSelected = { bg = "#1e1e2e", fg = "#313244" },
        --
        -- -- Якщо використовується інший варіант назв
        -- BufferLineBufferVisible = { bg = "#1e1e2e" },
        -- BufferLineBufferSelected = { bg = "#313244", bold = true },
        --
        -- -- Групи для Heirline (якщо вони використовуються напряму)
        -- HeirlineNormal = { bg = "#1e1e2e" },
        -- HeirlineInsert = { bg = "#1e1e2e" },
        -- HeirlineVisual = { bg = "#1e1e2e" },
        -- HeirlineReplace = { bg = "#1e1e2e" },
        -- HeirlineCommand = { bg = "#1e1e2e" },
        -- HeirlineInactive = { bg = "#1e1e2e" },
        --
        -- -- WinBar (може з'являтися зверху вікна)
        -- WinBar = { bg = "NONE" },
        -- WinBarNC = { bg = "NONE" },
        --
        -- -- Telescope - робимо прозорим
              },

      ["catppuccin"] = { -- a table of overrides/changes when applying the astrotheme theme
        -- Normal = { bg = "#000000" },
        -- Comment = { italic = true },
        -- TelescopeNormal = { bg = "NONE" },
        -- TelescopeBorder = { bg = "NONE", fg = "#89b4fa" },
        -- TelescopePromptNormal = { bg = "NONE" },
        -- TelescopePromptBorder = { bg = "NONE", fg = "#89b4fa" },
        -- TelescopePromptTitle = { bg = "#89b4fa", fg = "#1e1e2e", bold = true },
        -- TelescopePreviewNormal = { bg = "NONE" },
        -- TelescopePreviewBorder = { bg = "NONE", fg = "#89b4fa" },
        -- TelescopePreviewTitle = { bg = "#a6e3a1", fg = "#1e1e2e", bold = true },
        -- TelescopeResultsNormal = { bg = "NONE" },
        -- TelescopeResultsBorder = { bg = "NONE", fg = "#89b4fa" },
        -- TelescopeResultsTitle = { bg = "#f38ba8", fg = "#1e1e2e", bold = true },
        -- TelescopeSelection = { bg = "#313244" },
        -- TelescopeSelectionCaret = { fg = "#f38ba8", bg = "#313244" },

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
