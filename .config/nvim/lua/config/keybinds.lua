-- General
vim.g.mapleader = " "
vim.keymap.set("i", "jj", "<Esc>")

-- vim.keymap.set("n", "<leader>cd", vim.cmd.Ex)
vim.keymap.set("n", "<leader>cd", vim.cmd.Oil)

vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>x", ":x<CR>")

vim.keymap.set("n", "<leader>v", ":vsplit<CR>")
vim.keymap.set("n", "<leader>s", ":split<CR>")

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("n", "<leader>ya", ":%y+<CR>")
vim.keymap.set("n", "<Esc>", ":noh<CR>", { silent = true })

vim.keymap.set("n", "<Tab>", ":bnext<CR>")
vim.keymap.set("n", "<C-Tab>", ":bprev<CR>")

-- Python
vim.keymap.set(
    "n", "<leader>R",
    function()
	vim.cmd("w")
	vim.cmd("!python3 %")
    end
)

-- Terminal
vim.g.tmux_navigator_no_mappings = 1
vim.keymap.set({ "n", "t" }, "<C-h>", "<Cmd>TmuxNavigateLeft<CR>",  { silent = true })
vim.keymap.set({ "n", "t" }, "<C-j>", "<Cmd>TmuxNavigateDown<CR>",  { silent = true })
vim.keymap.set({ "n", "t" }, "<C-k>", "<Cmd>TmuxNavigateUp<CR>",    { silent = true })
vim.keymap.set({ "n", "t" }, "<C-l>", "<Cmd>TmuxNavigateRight<CR>", { silent = true })
