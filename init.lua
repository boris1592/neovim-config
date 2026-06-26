vim.o.nu = true
vim.o.rnu = true
vim.o.scrolloff = 8
vim.o.hlsearch = false

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

vim.g.mapleader = ' '
vim.o.swapfile = false
vim.diagnostic.config({ virtual_text = true })

vim.pack.add({
  'https://github.com/EdenEast/nightfox.nvim',
  'https://github.com/lewis6991/gitsigns.nvim',
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/nvim-mini/mini.completion', -- should probably try out builtin completions
  'https://github.com/nvim-mini/mini.icons',
  'https://github.com/nvim-mini/mini.pick',
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/tpope/vim-sleuth',
})

vim.cmd.colorscheme('carbonfox')

require('gitsigns').setup({ current_line_blame = true })

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
    settings = { gopls = { buildFlags = { '-tags=integration,api_tests' } } },
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

require('mini.completion').setup()
vim.lsp.config('*', { capabilities = MiniCompletion.get_lsp_capabilities() })

require('mini.icons').setup()

require('mini.pick').setup({
  window = {
    config = function()
      local height = math.ceil(0.75 * vim.o.lines)
      local width = math.ceil(0.75 * vim.o.columns)
      return {
        anchor = 'NW',
        height = height,
        width = width,
        row = 0,
        col = math.floor(0.5 * (vim.o.columns - width)),
      }
    end
  },
})

local languages = {
  'gdscript',
  'gleam',
  'go',
  'javascript',
  'lua',
  'python',
  'sql',
  'typescript',
  'typst',
  'zig',
}

require('nvim-treesitter').install(languages)
vim.api.nvim_create_autocmd('FileType', {
  pattern = languages,
  callback = function() vim.treesitter.start() end,
})

vim.keymap.set('n', '<leader><leader>', '<C-^>')
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y')
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', '-', ':Ex<CR>')

vim.keymap.set('n', '<leader>f', MiniPick.builtin.files)
vim.keymap.set('n', '<leader>/', MiniPick.builtin.grep_live)
vim.keymap.set('n', '<leader>b', MiniPick.builtin.buffers)
