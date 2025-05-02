local map = vim.keymap.set

-- Insert mode: 'jj' to escape
map("i", "jj", "<Esc>", { noremap = false, desc = "Exit insert with jj" })

-- Twilight toggle
map("n", "tw", ":Twilight<CR>", { noremap = false, desc = "Toggle Twilight" })

-- Buffer navigation
map("n", "tk", ":blast<CR>", { noremap = false, desc = "Go to last buffer" })
map("n", "tj", ":bfirst<CR>", { noremap = false, desc = "Go to first buffer" })
map("n", "th", ":bprev<CR>", { noremap = false, desc = "Prev buffer" })
map("n", "tl", ":bnext<CR>", { noremap = false, desc = "Next buffer" })
map("n", "td", ":bdelete<CR>", { noremap = false, desc = "Delete buffer" })

-- File commands
map("n", "QQ", ":q!<CR>", { noremap = false, desc = "Force quit" })
map("n", "WW", ":w!<CR>", { noremap = false, desc = "Force write" })
map("n", "E", "$", { noremap = false, desc = "Move to end of line" })
map("n", "B", "^", { noremap = false, desc = "Move to beginning of line" })
map("n", "TT", ":TransparentToggle<CR>", { noremap = true, desc = "Toggle transparency" })
map("n", "ss", ":noh<CR>", { noremap = true, desc = "Clear search highlight" })

-- Resize splits
map("n", "<C-w>,", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-w>.", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Split management
map("n", "<leader>sv", ":vsplit<CR>", { noremap = true, silent = true, desc = "Vertical split" })
map("n", "<leader>qq", ":q<CR>", { silent = true, noremap = true, desc = "Close split" })

-- Disable space in normal & visual mode (for leader key)
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Smart j/k for wrapped lines
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = "Move up (smart)" })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = "Move down (smart)" })

-- Noice dismiss
map("n", "<leader>nn", ":Noice dismiss<CR>", { noremap = true, desc = "Dismiss Noice notifications" })
