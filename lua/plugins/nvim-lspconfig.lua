return {
	plugins = { 'https://github.com/neovim/nvim-lspconfig' },
	setup = function()
		local formatting_group = vim.api.nvim_create_augroup('LspFormatting', {})

		local function enable_lsp_formatting(_, buf)
			vim.api.nvim_clear_autocmds({ group = formatting_group, buffer = buf })
			vim.api.nvim_create_autocmd('BufWritePre', {
				group = formatting_group,
				buffer = buf,
				callback = function() vim.lsp.buf.format({ bufnr = buf }) end,
			})
		end

		for lsp, config in pairs({
			gdscript      = {},
			gopls         = {
				on_attach = enable_lsp_formatting,
				settings = { gopls = {
					buildFlags = { '-tags=integration,api_tests,wireinject' },
					semanticTokens = false,
				} },
			},
			lua_ls        = { on_attach = enable_lsp_formatting },
			oxfmt         = { on_attach = enable_lsp_formatting },
			oxlint        = {},
			pyright       = {},
			ruff          = { on_attach = enable_lsp_formatting },
			rust_analyzer = { on_attach = enable_lsp_formatting },
			tinymist      = { on_attach = enable_lsp_formatting },
			ts_ls         = {},
			zls           = { on_attach = enable_lsp_formatting },
		}) do
			vim.lsp.enable(lsp)
			vim.lsp.config(lsp, config)
		end
	end,
}
