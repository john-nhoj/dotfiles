-- plugins/colors.lua

return {
    -- Set the color theme of neovim
    {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	config = function()
	    vim.cmd.colorscheme "catppuccin-mocha"
	end
    },
    {
	"nvim-lualine/lualine.nvim",
	dependencies = {
	    "nvim-tree/nvim-web-devicons",
	},
	opts = {}
    },
}
