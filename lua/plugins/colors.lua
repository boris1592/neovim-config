return {
	plugins = { 'https://github.com/loctvl842/monokai-pro.nvim' },
	setup = function()
		require('monokai-pro').setup()
		vim.cmd.colorscheme('monokai-pro-spectrum')
	end,
}
