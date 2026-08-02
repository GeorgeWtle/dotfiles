return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    {
      "mason-org/mason.nvim",
      opts = {
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      },
    },
    "neovim/nvim-lspconfig",
    "saghen/blink.cmp",
  },
  opts = {
    ensure_installed = {
      "lua_ls",
      "pyright",
      "ruff",
      "bashls",
    },
  },

  config = function(_, opts)
    vim.lsp.config('lua_ls', {
      root_markers = { '.luarc.json', '.luarc.jsonc', '.git' },
      settings = {
	Lua = {
	  diagnostics = {
	    globals = { 'vim' },
	  },
	},
      },
    })

    vim.lsp.config('pyright', {
      settings = {
	python = {
	  analysis = {
	    typeCheckingMode = "off", -- or "off"
	  },
	},
      },
    })

    local capabilities = require("blink.cmp").get_lsp_capabilities()
    vim.lsp.config("*", {
      capabilities = capabilities,
    })

    require("mason-lspconfig").setup(opts)
  end,
}

