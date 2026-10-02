-- Basic options
vim.api.nvim_set_hl(0, "Normal", { bg = "none" }) -- enable transparency if the terminal is transparent
vim.opt.number = true -- show number
vim.opt.relativenumber = true -- show relative number line
vim.opt.cursorline = true -- show current line
vim.opt.shiftwidth = 2 -- shoudl be 4?
vim.smartindent = true -- ?? not sure
vim.opt.conceallevel = 2
vim.opt.scrolloff = 10
vim.api.nvim_set_hl(0, "CursorLineNr", {
	fg = "#f38ba8", -- change color of current line number
	bold = false,
})

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
})

-- Insert markdown templates
vim.api.nvim_create_user_command("Template", function()
	local template_dir = vim.fn.expand("~/Documents/my_obsidian/Templates/")

	local templates = vim.fn.glob(template_dir .. "/*.md", false, true)

	if #templates == 0 then
		print("No Markdown templates found")
		return
	end

	local names = {}
	for _, path in ipairs(templates) do
		table.insert(names, vim.fn.fnamemodify(path, ":t"))
	end

	vim.ui.select(names, {
		prompt = "Choose a Markdown template:",
	}, function(choice)
		if not choice then
			return
		end

		local template = template_dir .. "/" .. choice

		vim.cmd("read " .. vim.fn.fnameescape(template))
	end)
end, {})

-- Markdown
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.opt_local.linebreak = true
		vim.opt_local.breakindent = true
	end,
})

-- LSP related
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("telescope-lsp-attach", { clear = true }),
	callback = function(ev)
		-- Buffer local mappings
		local opts = { buffer = ev.buf, silent = true }

		-- Keymaps
		opts.desc = "Show LSP references"
		vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

		opts.desc = "Go to declaration"
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

		opts.desc = "Show LSP definitions"
		vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

		opts.desc = "Show LSP implementations"
		vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

		opts.desc = "Show LSP type definitions"
		vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

		opts.desc = "See available code actions"
		vim.keymap.set({ "n", "v" }, "<leader>vca", function()
			vim.lsp.buf.code_action()
		end, opts)

		opts.desc = "Smart rename"
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

		opts.desc = "Show buffer diagnostics"
		vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

		opts.desc = "Show line diagnostics"
		vim.keymap.set("n", "df", function()
			vim.diagnostic.open_float()
		end, opts)

		opts.desc = "Show documentation for what is under cursor"
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

		opts.desc = "Show signature help"
		vim.keymap.set("i", "<C-h>", function()
			vim.lsp.buf.signature_help()
		end, opts)
	end,
})
