return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000, -- load before other plugins
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      transparent_background = true,
      integrations = {
	cmp = true,
	gitsigns = true,
	nvimtree = true,
	treesitter = true,
	telescope = true,
      },
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
