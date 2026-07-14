return {
	plugins = { 'https://github.com/neovim/nvim-lspconfig' },
	setup = function()
		local fmt_group = vim.api.nvim_create_augroup('LspFormatting', {})

		local function on_attach_fmt(_, buf)
			vim.api.nvim_clear_autocmds({ group = fmt_group, buffer = buf })
			vim.api.nvim_create_autocmd('BufWritePre', {
				group = fmt_group,
				buffer = buf,
				callback = function() vim.lsp.buf.format({ bufnr = buf }) end,
			})
		end

		for lsp, config in pairs({
			gdscript = {},
			gleam    = { on_attach = on_attach_fmt },
			gopls    = {
				on_attach = on_attach_fmt,
				settings  = { gopls = {
					buildFlags     = { '-tags=integration,api_tests' },
					semanticTokens = false,
				} },
			},
			lua_ls   = { on_attach = on_attach_fmt },
			oxfmt    = { on_attach = on_attach_fmt },
			oxlint   = {},
			pyright  = {},
			ruff     = { on_attach = on_attach_fmt },
			tinymist = { on_attach = on_attach_fmt },
			ts_ls    = {},
			zls      = { on_attach = on_attach_fmt },
		}) do
			vim.lsp.enable(lsp)
			vim.lsp.config(lsp, config)
		end
	end,
}
