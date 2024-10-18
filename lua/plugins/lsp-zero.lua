return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v4.x',
  config = function()
    local lsp_zero = require('lsp-zero')

    -- The only reason for using this plugin is that I'm
    -- too lazy to type all the keybindings manually...
    lsp_zero.extend_lspconfig({
      lsp_attach = function(_, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })
      end,
    })

    lsp_zero.setup_servers({
      'lua_ls',
      'ts_ls',
      'deno',
      'eslint',
      'gopls',
      'clangd',
      'rust_analyzer',
      'typst_lsp',
    })

    lsp_zero.use('typst_lsp', {
      -- Very weird that an LSP does this by default
      settings = { exportPdf = 'never' },
    })
  end,
}
