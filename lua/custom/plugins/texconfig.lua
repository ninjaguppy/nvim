return {
  {
    'lervag/vimtex',
    --    ft = { 'markdown', 'tex' }
    lazy = false
  },
  {
    --'KeitaNakamura/tex-conceal.vim',
    --init = function()
    --vim.opt.conceallevel = 1
    --vim.g.tex_conceal = 'abdmg'
    -- hi Conceal ctermbg=none
    --end,
  },
  {
    "krissen/snacks-bibtex.nvim",
    dependencies = { "folke/snacks.nvim" },
    opts = {

      -- optional overrides (see below)
      global_files = { "~/math/main.bib" },
      format = "\\cite{%s}",
      display = {
        preview_fields = { "author", "year", "title" },
        preview_fields_separator = " • ", -- customize the separator between fields
      }
    },
    keys = {
      {
        "<leader>lc",
        function()
          require("snacks-bibtex").bibtex()
        end,
        desc = "BibTeX citations (Snacks)",
      },
    },
  },


  {
    'micangl/cmp-vimtex',
    config = function()
      require('cmp').setup({
        sources = {
          { name = 'vimtex', },
        },
      })
    end
  }
}
