vim.opt.exrc = false
vim.opt.modeline = false
-- Use native macOS clipboard tools, including when Neovim runs inside tmux.
if vim.fn.has "macunix" == 1 then
  vim.g.clipboard = {
    name = "macOS",
    copy = { ["+"] = "/usr/bin/pbcopy", ["*"] = "/usr/bin/pbcopy" },
    paste = { ["+"] = "/usr/bin/pbpaste", ["*"] = "/usr/bin/pbpaste" },
    cache_enabled = 0,
  }
end
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.notify("Run bash work-macos/setup-nvim.sh from your dotfiles repository first", vim.log.levels.WARN)
  return
end
vim.opt.rtp:prepend(lazypath)
local lock = vim.json.decode(table.concat(vim.fn.readfile(vim.fn.stdpath "config" .. "/lazy-lock.json"), "\n"))
local specs = {
  { "AstroNvim/AstroNvim", version = "^5", import = "astronvim.plugins",
    opts = { mapleader = " ", maplocalleader = ",", icons_enabled = true, update_notifications = false } },
  { "ggandor/leap.nvim", config = function() require("leap").add_default_mappings() end },
  { import = "plugins" },
}
-- Pin every active plugin from the reviewed lock, including AstroNvim defaults.
for name, revision in pairs(lock) do
  table.insert(specs, { name, optional = true, commit = revision.commit, version = false })
end
require("lazy").setup(specs, {
  local_spec = false,
  install = { missing = vim.env.NVIM_WORK_INSTALL == "1", colorscheme = { "catppuccin", "habamax" } },
  checker = { enabled = false },
  change_detection = { enabled = false },
  rocks = { enabled = false },
  pkg = { enabled = false },
})
