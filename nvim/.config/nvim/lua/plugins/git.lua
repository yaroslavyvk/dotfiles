return {
  {
    "NeogitOrg/neogit",
    cmd = "Neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = true,
  },
  "tpope/vim-fugitive",
  "lewis6991/gitsigns.nvim",
  {
    "ThePrimeagen/git-worktree.nvim",
    dependencies = "nvim-lua/plenary.nvim",
  },
}
