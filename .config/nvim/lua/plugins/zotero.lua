return {
    "jalvesaq/zotcite",
    dependencies = {
	"nvim-treesitter/nvim-treesitter",
	"nvim-telescope/telescope.nvim",
    },
    config = function ()
	require("zotcite").setup({
	    zotero_sqlite_path = "/Users/georgewhittle/Zotero/zotero.sqlite"
	})
    end
}
