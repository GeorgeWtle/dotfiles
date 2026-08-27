-- Basic options
vim.loader.enable()
vim.opt.termguicolors = true
vim.g.have_nerd_font = false
vim.api.nvim_set_hl(0, "Normal", { bg = "none" }) -- enable transparency if the terminal is transparent
vim.opt.number = true -- show number
vim.opt.relativenumber = true -- show relative number line
vim.opt.cursorline = true -- show current line
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.smartindent = true -- ?? not sure
vim.opt.breakindent = true
vim.opt.signcolumn = 'yes'
vim.opt.cmdheight = 0
vim.opt.showcmd = true
vim.opt.scrolloff = 10
vim.opt.backspace = {"start", "eol", "indent"}
vim.api.nvim_set_hl(
  0, "CursorLineNr",
  {
    fg = "#f38ba8", -- change color of current line number
    bold = false,
  }
)

-- Clipboard
vim.opt.clipboard = "unnamed" -- ?? not sure
vim.opt.clipboard = "unnamedplus" -- copy to + clipboard

-- Autocommands
-- Highligh yanking
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank({ higroup = 'Visual', timeout = 150}) end,
})

-- Terminal
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = "*",
  callback = function()
    if vim.bo.buftype == "terminal" then
      vim.cmd("startinsert") -- enter terminal in insert mode
    end
  end,
  }
)

-- For writing
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "html", "text" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.textwidth = 80
    vim.opt_local.formatoptions:append("t")
  end,
})
