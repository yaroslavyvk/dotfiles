return {
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    dependencies = {
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        enabled = vim.fn.executable 'make' == 1,
      },
      { 'nvim-lua/plenary.nvim' },
      { 'crispgm/telescope-heading.nvim' },
    },
    keys = {
      {
        '<leader>sf',
        function()
          require('telescope.builtin').find_files()
        end,
        desc = 'Find Files',
      },
      {
        '<leader>sF',
        function()
          require('telescope.builtin').find_files { hidden = true, no_ignore = true }
        end,
        desc = 'Find All Files',
      },
      {
        '<leader>sr',
        '<cmd>Telescope oldfiles<cr>',
        desc = 'Find Recent',
      },
      -------
      {
        '<leader>sb',
        '<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>',
        desc = 'Find Buffers',
      },
      {
        '<leader>sbc',
        '<cmd>Telescope current_buffer_fuzzy_find<cr>',
        desc = 'Find in Current Buffer',
      },
      {
        '<leader>sh',
        '<cmd>Telescope command_history<cr>',
        desc = 'Command History',
      },
      {
        '<leader>sk',
        '<cmd>Telescope keymaps<cr>',
        desc = 'Key Maps',
      },
      {
        '<leader>sw',
        function()
          require('telescope.builtin').live_grep()
        end,
        desc = 'Live Grep',
      },
      {
        '<leader>sW',
        function()
          require('telescope.builtin').live_grep {
            additional_args = function(args)
              return vim.list_extend(args, { '--hidden', '--no-ignore' })
            end,
          }
        end,
        desc = 'Live Grep (all)',
      },
    },
    opts = function()
      local actions = require 'telescope.actions'

      local open_with_trouble = require('trouble.sources.telescope').open

      return {
        defaults = {
          prompt_prefix = ' ',
          selection_caret = ' ',
          get_selection_window = function()
            local wins = vim.api.nvim_list_wins()
            table.insert(wins, 1, vim.api.nvim_get_current_win())
            for _, win in ipairs(wins) do
              local buf = vim.api.nvim_win_get_buf(win)
              if vim.bo[buf].buftype == '' then
                return win
              end
            end
            return 0
          end,
          mappings = {
            i = {
              ['<c-t>'] = open_with_trouble,
              ['<C-Down>'] = actions.cycle_history_next,
              ['<C-Up>'] = actions.cycle_history_prev,
              ['<C-f>'] = actions.preview_scrolling_down,
              ['<C-b>'] = actions.preview_scrolling_up,
            },
            n = {
              ['<c-t>'] = open_with_trouble,
              ['q'] = actions.close,
            },
          },
          extensions = {
            heading = {
              treesitter = true,
            },
          },
        },
      }
    end,
  },
  {
    'crispgm/telescope-heading.nvim',
  },
}
