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
-- Sets tab things
local o = vim.o

o.expandtab = true   -- expand tab input with spaces characters
o.smartindent = true -- syntax aware indentations for newline inserts
o.tabstop = 2        -- num of space characters per tab
o.shiftwidth = 2     -- spaces per indentation level
