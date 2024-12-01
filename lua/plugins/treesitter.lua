return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    local configs = require('nvim-treesitter.configs')

    configs.setup({
      ensure_installed = {
        'vim',
        'lua',
        'typescript',
        'javascript',
        'tsx',
        'json',
        'typst',
        'go',
        'cpp',
        'rust',
        'zig',
      },
      sync_install = false,
      highlight = { enable = true },
    })
  end,
}
