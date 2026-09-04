return {
	plugins = {
		{
			src = 'https://github.com/loctvl842/monokai-pro.nvim',
			version = 'v2.1.1',
		},
		'https://github.com/nvim-mini/mini.icons',
		'https://github.com/nvim-mini/mini.statusline',
	},
	setup = function()
		require('monokai-pro').setup({ filter = 'spectrum' })
		vim.cmd.colorscheme('monokai-pro')
		require('mini.icons').setup()
		require('mini.statusline').setup()
	end,
}
