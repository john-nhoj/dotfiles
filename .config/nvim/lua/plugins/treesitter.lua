-- NOTE: Takes care of showing my code with some nice colors

return {
    'nvim-treesitter/nvim-treesitter',
	-- NOTE: Only activated when you open or create a new file
    event = { "BufReadPre", "BufNewFile" },
	-- NOTE: Ensure that all the language parsers are up-to-date
	build = ":TSUpdate",
	cmd = {
		'TSInstall',
		'TSUninstall',
		'TSUpdate',
		'TSUpdateSync',
		'TSInstallInfo',
		'TSInstallSync',
		'TSInstallFromGrammar',
  },
	config = function()
		local treesitter = require("nvim-treesitter.configs")
		treesitter.setup({
			highlight = {
				enable = true,
			},
			indent = { enable = true },
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
				"python",
				"http",
				"markdown",
				"markdown_inline",
				"lua",
				"bash",
				"vim",
				"dockerfile",
				"gitignore",
				"vue",
			},
		})
	end
}
