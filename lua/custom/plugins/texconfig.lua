return {
  'lervag/vimtex',
  ft = 'tex',
  {
    'KeitaNakamura/tex-conceal.vim',
    init = function()
      vim.opt.conceallevel = 1
      vim.g.tex_conceal = 'abdmg'
      -- hi Conceal ctermbg=none
    end,
  },
  {
    'sirver/ultisnips',
    init = function()
      vim.g.UltiSnipsExpandTrigger = '<tab>'
      vim.g.UltiSnipsJumpForwardTrigger = '<tab>'
      vim.g.UltiSnipsJumpBackwardTrigger = '<s-tab>'
    end,
  },
}
