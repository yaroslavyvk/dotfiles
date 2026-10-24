-- lazy.nvim plugin spec
return {
  {
    "towolf/vim-helm",
    ft = { "helm", "yaml" }, -- load on yaml too; filetype will switch to helm below
  },
}
