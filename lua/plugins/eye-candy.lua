return {
	plugins = {
		'https://github.com/sainnhe/sonokai',
		'https://github.com/nvim-mini/mini.icons',
		'https://github.com/nvim-mini/mini.statusline',
	},
	setup = function()
		vim.cmd.colorscheme('sonokai')
		require('mini.icons').setup()
		require('mini.statusline').setup()
	end,
}
