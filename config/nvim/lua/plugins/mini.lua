return {
	{ "echasnovski/mini.nvim", version = false },
	{
		"echasnovski/mini.comment",
		version = false,
		config = function()
			require("mini.comment").setup()
		end
	},
}

