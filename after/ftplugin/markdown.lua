vim.opt.formatoptions = 'tcqjnpw'
--vim.g.mkdp_combine_preview = 1
--vim.g.mkdp_combine_preview_auto_refresh = 1
vim.g.vim_markdown_folding_disabled = 1
--vim.keymap.set('n', '<leader>mp', [[<cmd>MarkdownPreview<cr>]])


--plays nice with latex
vim.g.vim_markdown_math = 1
vim.opt.conceallevel = 1
vim.g.vim_markdown_frontmatter = 1
--vim.g.tex_conceal = 'abdgm'
--let g:vim_markdown_folding_disabled = 1



-- This is pasted from ./tex.lua
--vim.opt.formatoptions = 'tcqjpw'
--vim.opt.wrap = true

-- disables vimtex from fucking with my shortcuts
--vim.g.vimtex_imaps_enabled = false

-- Ensures that luasnip loads correctly
local ls = require("luasnip")
ls.setup({
	enable_autosnippets = true,

	store_selection_keys = "<Tab>",
})
