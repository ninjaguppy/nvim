return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = {
      enabled = true

    },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  keys = {

    -- Top Pickers & Explorer
    { "<leader><space>", function() Snacks.picker.smart() end,                                   desc = "Smart Find Files" },
    { "<leader>,",       function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
    { "<leader>/",       function() Snacks.picker.grep() end,                                    desc = "Grep" },
    { "<leader>:",       function() Snacks.picker.command_history() end,                         desc = "Command History" },
    { "<leader>e",       function() Snacks.explorer() end,                                       desc = "File Explorer" },

    -- find
    { "<leader>fb",      function() Snacks.picker.buffers() end,                                 desc = "[B]uffers" },
    { "<leader>fc",      function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "[F]ind [C]onfig File" },
    { "<leader>ff",      function() Snacks.picker.files() end,                                   desc = "[F]ind [F]iles" },
    { "<leader>fg",      function() Snacks.picker.git_files() end,                               desc = "[F]ind [G]it Files" },
    { "<leader>fp",      function() Snacks.picker.projects() end,                                desc = "[P]rojects" },
    { "<leader>fr",      function() Snacks.picker.recent() end,                                  desc = "[R]ecent" },

    -- git
    { "<leader>gb",      function() Snacks.picker.git_branches() end,                            desc = "[G]it [B]ranches" },
    { "<leader>gl",      function() Snacks.picker.git_log() end,                                 desc = "[G]it [l]og" },
    { "<leader>gL",      function() Snacks.picker.git_log_line() end,                            desc = "[G]it [L]og Line" },
    { "<leader>gs",      function() Snacks.picker.git_status() end,                              desc = "[G]it [s]tatus" },
    { "<leader>gS",      function() Snacks.picker.git_stash() end,                               desc = "[G]it [S]tash" },
    { "<leader>gd",      function() Snacks.picker.git_diff() end,                                desc = "[G]it [D]iff (Hunks)" },
    { "<leader>gf",      function() Snacks.picker.git_log_file() end,                            desc = "[G]it Log [F]ile" },

    -- Grep
    { "<leader>sb",      function() Snacks.picker.lines() end,                                   desc = "[b]uffer Lines" },
    { "<leader>sB",      function() Snacks.picker.grep_buffers() end,                            desc = "Grep Open [B]uffers" },
    { "<leader>sg",      function() Snacks.picker.grep() end,                                    desc = "[G]rep" },
    { "<leader>sw",      function() Snacks.picker.grep_word() end,                               desc = "Visual selection or [w]ord", mode = { "n", "x" } },

    -- search
    { '<leader>s"',      function() Snacks.picker.registers() end,                               desc = "Registers" },
    { '<leader>s/',      function() Snacks.picker.search_history() end,                          desc = "Search History" },
    { "<leader>sa",      function() Snacks.picker.autocmds() end,                                desc = "[A]utocmds" },
    { "<leader>sb",      function() Snacks.picker.lines() end,                                   desc = "[B]uffer Lines" },
    { "<leader>sc",      function() Snacks.picker.command_history() end,                         desc = "[c]ommand History" },
    { "<leader>sC",      function() Snacks.picker.commands() end,                                desc = "[C]ommands" },
    { "<leader>sd",      function() Snacks.picker.diagnostics() end,                             desc = "[D]iagnostics" },
    { "<leader>sD",      function() Snacks.picker.diagnostics_buffer() end,                      desc = "Buffer [D]iagnostics" },
    { "<leader>sh",      function() Snacks.picker.help() end,                                    desc = "[H]elp Pages" },
    { "<leader>sH",      function() Snacks.picker.highlights() end,                              desc = "[H]ighlights" },
    { "<leader>si",      function() Snacks.picker.icons() end,                                   desc = "[I]cons" },
    { "<leader>sj",      function() Snacks.picker.jumps() end,                                   desc = "[J]umps" },
    { "<leader>sk",      function() Snacks.picker.keymaps() end,                                 desc = "[K]eymaps" },
    { "<leader>sl",      function() Snacks.picker.loclist() end,                                 desc = "[L]ocation List" },
    { "<leader>sm",      function() Snacks.picker.marks() end,                                   desc = "[M]arks" },
    { "<leader>sn",      function() Snacks.picker.notifications() end,                           desc = "[N]otification History" },
    { "<leader>sM",      function() Snacks.picker.man() end,                                     desc = "[M]an Pages" },
    { "<leader>sp",      function() Snacks.picker.lazy() end,                                    desc = "Search for [P]lugin Spec" },
    { "<leader>sq",      function() Snacks.picker.qflist() end,                                  desc = "[Q]uickfix List" },
    { "<leader>sR",      function() Snacks.picker.resume() end,                                  desc = "[R]esume" },
    { "<leader>su",      function() Snacks.picker.undo() end,                                    desc = "[U]ndo History" },
    { "<leader>uC",      function() Snacks.picker.colorschemes() end,                            desc = "[C]olorschemes" },

    -- LSP
    { "gd",              function() Snacks.picker.lsp_definitions() end,                         desc = "[G]oto [D]efinition" },
    { "gD",              function() Snacks.picker.lsp_declarations() end,                        desc = "[G]oto Declaration" },
    { "gr",              function() Snacks.picker.lsp_references() end,                          nowait = true,                       desc = "[R]eferences" },
    { "gI",              function() Snacks.picker.lsp_implementations() end,                     desc = "[G]oto Implementation" },
    { "gy",              function() Snacks.picker.lsp_type_definitions() end,                    desc = "[G]oto T[y]pe Definition" },
    { "<leader>ss",      function() Snacks.picker.lsp_symbols() end,                             desc = "LSP [s]ymbols" },
    { "<leader>sS",      function() Snacks.picker.lsp_workspace_symbols() end,                   desc = "LSP Workspace [S]ymbols" },
  },
}
