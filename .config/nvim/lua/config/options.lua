-- Basic options
vim.api.nvim_set_hl(0, "Normal", { bg = "none" }) -- enable transparency if the terminal is transparent
vim.opt.number = true -- show number
vim.opt.relativenumber = true -- show relative number line
vim.opt.cursorline = true -- show current line
vim.opt.shiftwidth = 2 -- shoudl be 4?
vim.smartindent = true -- ?? not sure
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

