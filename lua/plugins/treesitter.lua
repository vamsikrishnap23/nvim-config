return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false, -- The new rewrite strictly forbids lazy loading
	build = ":TSUpdate",
	config = function()
		-- 1. Install parsers using the new API
		require("nvim-treesitter").install({
			"lua",
			"go",
			"javascript",
			"c",
			"cpp",
			"python",
			"typescript",
			"java",
			"rust",
			"markdown",
			"ruby",
		})

		-- 2. Enable Highlighting and Indentation via Autocommands
		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"lua",
				"go",
				"javascript",
				"c",
				"cpp",
				"python",
				"typescript",
				"java",
				"rust",
				"markdown",
				"ruby",
			},
			callback = function()
				-- Start highlighting
				vim.treesitter.start()
				-- Start indentation
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
