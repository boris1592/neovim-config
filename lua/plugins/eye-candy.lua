return {
	plugins = {
		'https://github.com/EdenEast/nightfox.nvim',
		'https://github.com/nvim-mini/mini.icons',
		'https://github.com/nvim-mini/mini.statusline',
	},
	setup = function()
		vim.cmd.colorscheme('carbonfox')
		require('mini.icons').setup()
		require('mini.statusline').setup()
	end,
}
