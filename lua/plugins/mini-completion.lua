return {
	plugins = { 'https://github.com/nvim-mini/mini.completion' },
	setup = function()
		require('mini.completion').setup()
		vim.lsp.config('*', { capabilities = MiniCompletion.get_lsp_capabilities() })
	end,
}
