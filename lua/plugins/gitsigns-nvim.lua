return {
	plugins = { 'https://github.com/lewis6991/gitsigns.nvim' },
	setup = function() require('gitsigns').setup({ current_line_blame = true }) end,
}
