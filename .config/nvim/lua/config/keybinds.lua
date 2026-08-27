-- General
vim.g.mapleader = " "
vim.keymap.set("i", "jj", "<Esc>")

-- vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)
vim.keymap.set("n", "<leader>cd", "<cmd>Oil<CR>")

vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>x", ":x<CR>")

-- the keymap under does not work as intended
-- vim.keymap.set("n", "x", "_x") -- erase but don't yank

vim.keymap.set("n", "<C-a>", "gg<S-v>G") -- select all file

vim.keymap.set("n", "<leader>v", ":vsplit<CR>")
vim.keymap.set("n", "<leader>s", ":split<CR>")

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

vim.keymap.set("n", "<leader>ya", ":%y+<CR>")
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv-gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv-gv")

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Python
vim.keymap.set("n", "<leader>R", function()
	vim.cmd("w")
	vim.cmd("!python3 %")
end)

-- Terminal
vim.g.tmux_navigator_no_mappings = 1
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set({ "n", "t" }, "<C-h>", "<Cmd>TmuxNavigateLeft<CR>", { silent = true })
vim.keymap.set({ "n", "t" }, "<C-j>", "<Cmd>TmuxNavigateDown<CR>", { silent = true })
vim.keymap.set({ "n", "t" }, "<C-k>", "<Cmd>TmuxNavigateUp<CR>", { silent = true })
vim.keymap.set({ "n", "t" }, "<C-l>", "<Cmd>TmuxNavigateRight<CR>", { silent = true })

-- Live-server
vim.keymap.set("n", "<leader>ls", ":vsplit term://live-server<CR>", { desc = "Start live-server" })
