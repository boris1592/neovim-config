vim.keymap.set('n', '<leader><leader>', '<c-^>')
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y')
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p')
vim.keymap.set('n', '<c-j>', '<cmd>cnext<cr>')
vim.keymap.set('n', '<c-k>', '<cmd>cprev<cr>')
-- ah, yes, the 'sane' defaults that make you press gr.. for every LSP action,
-- except the most common one, for which you need to press CTRL-]
vim.keymap.set('n', 'grd', vim.lsp.buf.definition)

vim.keymap.set('n', '<leader>f', FzfLua.files)
vim.keymap.set('n', '<leader>/', FzfLua.live_grep)
vim.keymap.set('n', '<leader>b', FzfLua.buffers)

vim.keymap.set('n', '-', '<cmd>Oil<cr>')
