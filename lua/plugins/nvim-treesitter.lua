return {
	plugins = { 'https://github.com/nvim-treesitter/nvim-treesitter' },
	setup = function()
		local languages = {
			'gdscript',
			'go',
			'javascript',
			'lua',
			'python',
			'rust',
			'sql',
			'typescript',
			'typst',
			'zig',
		}

		require('nvim-treesitter').install(languages)

		vim.api.nvim_create_autocmd('FileType', {
			pattern = languages,
			callback = function()
				vim.treesitter.start()
				vim.bo.indentexpr = 'v:lua.require\'nvim-treesitter\'.indentexpr()'
			end,
		})
	end,
}
