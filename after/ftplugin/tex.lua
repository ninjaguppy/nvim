vim.opt.conceallevel = 1
vim.opt.formatoptions = 'tcqjpw'
vim.g.tex_conceal = 'abdgm'
vim.opt.wrap = true

-- disables vimtex from fucking with my shortcuts
vim.g.vimtex_imaps_enabled = false

vim.g.tex_conceal = 'abdmg'
vim.cmd.hi "Conceal ctermbg=none"

-- Ensures that luasnip loads correctly
local ls = require("luasnip")
ls.setup({
	enable_autosnippets = true,

	store_selection_keys = "<Tab>",
})
--require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/custom/luasnippets/" }
