return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function ()
    local configs = require('nvim-treesitter.configs')

    configs.setup({
      ensure_installed = {
        'vim',
        'lua',
        'typescript',
        'javascript',
        'json',
        'rust',
        'go',
        'cpp',
        'typst',
      },
      sync_install = false,
      highlight = { enable = true },
    })
  end,
}
