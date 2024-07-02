------Delete the old maps----------
--<leader> ws no longer invokes lsp nonsense

-- Navigating files
vim.keymap.set("n", "<leader>fs", [[<cmd>w<cr>]], { desc = "[F]ile [S]ave" })

--Navigating Buffers
vim.keymap.set("n", "<leader>bb", [[<cmd>Neotree toggle show buffers<cr>]], { desc = "View [B]uffers" })
vim.keymap.set("n", "<leader>`", [[<cmd>b#<cr>]], { desc = "Switch to previous buffer" })
vim.keymap.set("n", "<leader>bk", [[<cmd>bp<bar>sp<bar>bn<bar>bd<cr>]], { desc = "[K]ill buffer and window" })

-- Navigating the Windows
vim.keymap.set("n", "<leader>wv", [[<C-w>v]], { desc = "Split [V]ertically" })
vim.keymap.set("n", "<leader>ws", [[<C-w>s]], { desc = "[S]plit Horizontally" })
vim.keymap.set("n", "<leader>wm", [[<C-w>h]], { desc = "Focus Right" })
vim.keymap.set("n", "<leader>wn", [[<C-w>j]], { desc = "Focus [D]own" })
vim.keymap.set("n", "<leader>we", [[<C-w>k]], { desc = "Focus Up" })
vim.keymap.set("n", "<leader>wi", [[<C-w>l]], { desc = "Focus Left" })
vim.keymap.set("n", "<leader>wq", [[<C-w>c]], { desc = "[Q]uit Window" })
vim.keymap.set("n", "<leader>wk", [[<cmd>bdelete<cr>]], { desc = "[K]ill buffer and window" })

-- Search Obsidian
vim.keymap.set("n", "<leader>ss", [[<cmd>ObsidianSearch<cr>]], { desc = "[S]earch [S]tacks" })

-- This allows us to use <leader>L to reload the snippets at any time
vim.keymap.set('n', '<Leader>L',
  '<Cmd>lua require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/custom/luasnippets/"})<CR>',
  { desc = "Reload [L]uasnip" })
