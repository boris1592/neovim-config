return {
	plugins = { 'https://github.com/ibhagwan/fzf-lua' },
	setup = function()
		require('fzf-lua').setup({
			keymap = {
				fzf = {
					-- alt-.. bindings on a mac are a massive pain
					['ctrl-y'] = 'toggle-all',
				},
			},
		})
	end,
}
