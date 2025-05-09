return {
  "rmagatti/auto-session",
  config = function()
    -- ← ensure this is set first
    vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

    require("auto-session").setup({
      log_level = "error",
      post_restore_cmds = { "silent !kill -s SIGWINCH $PPID" },
      pre_save_cmds = { close_all_floating_windows, "cclose" },
      session_lens = { load_on_setup = false },
    })
  end,
}
