return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
  config = function()
    local lint = require 'lint'

    -- Keep built-in parser, just tweak args:
    lint.linters.flake8.args = { '--max-line-length=88' }
    lint.linters.flake8.stdin = true
    lint.linters.flake8.ignore_exitcode = true

    lint.linters_by_ft = {
      python = { 'flake8' },
      dockerfile = { 'hadolint' },
      yaml = { 'yamllint' },
      ['yaml.ansible'] = { 'ansible_lint' },
      terraform = { 'tflint' },
    }

    local aug = vim.api.nvim_create_augroup('lint', { clear = true })
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = aug,
      callback = function()
        lint.try_lint()
      end,
    })

    vim.keymap.set('n', '<leader>ll', lint.try_lint, { desc = 'Trigger linting' })
  end,
}
