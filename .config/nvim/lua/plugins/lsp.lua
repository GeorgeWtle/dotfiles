vim.diagnostic.config({
    virtual_text = true,
})

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('telescope-lsp-attach', { clear = true }),
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
	vim.keymap.set({ "n", "v" }, "<leader>vca", function() vim.lsp.buf.code_action() end, opts)

	opts.desc = "Smart rename"
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

	opts.desc = "Show buffer diagnostics"
	vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

	opts.desc = "Show line diagnostics"
	vim.keymap.set("n", "df", function() vim.diagnostic.open_float() end, opts)

	opts.desc = "Show documentation for what is under cursor"
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

	opts.desc = "Show signature help"
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    end,
})

return {
    'neovim/nvim-lspconfig',
    dependencies = {
	{ 'mason-org/mason.nvim', opts = {} },
	'mason-org/mason-lspconfig.nvim',
	'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    config = function()
	local servers = {
	    clangd = {},
	    html = {},
	    cssls = {},
	    ts_ls = {},
	    pyright = {},
	    rust_analyzer = {},
	    stylua = {}, -- Used to format Lua code
	    roslyn_ls = {},
	    emmet_language_server = {
		filetypes = { "html", "css", "javascriptreact", "typescriptreact", "javascript", "typescript" },
	    },
	    lua_ls = {
		on_init = function(client)
		    client.server_capabilities.documentFormattingProvider = false
		    if client.workspace_folders then
			local path = client.workspace_folders[1].name
			if path ~= vim.fn.stdpath 'config'
			    and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc')) then
			    return
			end
		    end
		    local current_settings = client.config.settings
		    client.config.settings.Lua = vim.tbl_deep_extend('force', current_settings.Lua, {
			runtime = {
			    version = 'LuaJIT',
			    path = { 'lua/?.lua', 'lua/?/init.lua' },
			},
			workspace = {
			    checkThirdParty = false,
			    library = vim.tbl_extend('force', vim.api.nvim_get_runtime_file('', true), {
				'${3rd}/luv/library',
				'${3rd}/busted/library',
			    }),
			},
		    })
		end,
		settings = {
		    Lua = {
			format = { enable = false },
		    },
		},
	    },
	}

	require('mason').setup ({
	    registries = {
		"github:mason-org/mason-registry",
		"github:Crashdummyy/mason-registry",
	    },
	})
	require('mason-lspconfig').setup {
	    automatic_enable = false,
	}

	local ensure_installed = vim.tbl_keys(servers or {})
	vim.list_extend(ensure_installed, {})
	require('mason-tool-installer').setup { ensure_installed = ensure_installed }

	for name, server in pairs(servers) do
	    vim.lsp.config(name, server)
	    vim.lsp.enable(name)
	end
    end,
}
