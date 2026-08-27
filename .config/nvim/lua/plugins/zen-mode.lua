return {
    "folke/zen-mode.nvim",
    opts = {
	window = {
	    width = 0.70,
	    height = 0.80,
	    options = {
		-- number = false,
		-- relativenumber = false,
		-- signcolumn = "no"
	    },
	}
    },
    keys = {
	{ "<leader>z", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" }
    }
}
