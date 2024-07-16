return {
  {                     -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup()

      -- Document existing key chains
      require('which-key').add {
        { "<leader>b",  group = "[B]uffers" },
        { "<leader>b_", hidden = true },
        { "<leader>c",  group = "[C]ode" },
        { "<leader>c_", hidden = true },
        { "<leader>d",  group = "[D]ocument" },
        { "<leader>d_", hidden = true },
        { "<leader>f",  group = "[F]ile" },
        { "<leader>f_", hidden = true },
        { "<leader>h",  group = "Git [H]unk" },
        { "<leader>h_", hidden = true },
        { "<leader>r",  group = "[R]ename" },
        { "<leader>r_", hidden = true },
        { "<leader>s",  group = "[S]earch" },
        { "<leader>s_", hidden = true },
        { "<leader>t",  group = "[T]oggle" },
        { "<leader>t_", hidden = true },
        { "<leader>w",  group = "[W]indow" },
        { "<leader>w_", hidden = true },
      }
      -- visual mode
      require('which-key').add({
        { "<leader>h", desc = "Git [H]unk", mode = "v" },
      })
    end,
  },
}
