local to_install = {}
local to_setup = {}

for _, path in ipairs({
	'eye-candy',
	'fzf-lua',
	'gitsigns-nvim',
	'mini-completion',
	'nvim-lspconfig',
	'nvim-treesitter',
	'oil-nvim',
}) do
	local pkg = require('plugins.' .. path)
	vim.list_extend(to_install, pkg.plugins)
	to_setup[#to_setup + 1] = pkg.setup
end

vim.pack.add(to_install)
for _, setup in ipairs(to_setup) do setup() end
