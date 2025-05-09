return {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
		local builtin = require('telescope.builtin')
		-- builtin.find_files({
			-- hidden = true,
		-- })
    end
}
