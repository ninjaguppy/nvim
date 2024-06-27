--First we input the helper fucnction
--local helpers = require('luasnip-helper-functions')
--local get_visual = helpers.get_visual

--Then we create the local functions
local tex_utils = {}
tex_utils.in_mathzone = function() -- math context detection
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
tex_utils.in_text = function()
  return not tex_utils.in_mathzone()
end
tex_utils.in_comment = function() -- comment detection
  return vim.fn['vimtex#syntax#in_comment']() == 1
end
tex_utils.in_env = function(name) -- generic environment detection
  local is_inside = vim.fn['vimtex#env#is_inside'](name)
  return (is_inside[1] > 0 and is_inside[2] > 0)
end
-- A few concrete environments---adapt as needed
tex_utils.in_equation = function() -- equation environment detection
  return tex_utils.in_env('equation')
end
tex_utils.in_itemize = function() -- itemize environment detection
  return tex_utils.in_env('itemize')
end
tex_utils.in_tikz = function() -- TikZ picture environment detection
  return tex_utils.in_env('tikzpicture')
end


return {
  -- First we set up the greek letters
  s({ trig = "`a", snippetType = "autosnippet" },
    {
      t("\\alpha"),
    },
    { conditions = tex_utils.in_mathzone() }
  ),
  s({ trig = "`b", snippetType = "autosnippet" },
    {
      t("\\beta"),
    },
    { conditions = tex_utils.in_mathzone() }
  ),
  s({
      trig = "`g",
      snippetType = "autosnippet"
    },
    {
      t("\\gamm"),
    },
    { conditions = tex_utils.in_mathzone() }
  ),
  s({ trig = "`G", snippetType = "autosnippet" },
    {
      t("\\Gamma"),
    },
    { conditions = tex_utils.in_mathzone() }
  ),
  -- This snippet makes it so we have 'hh' to add our math mode thing
  --s({
  --trig = "hh",
  ----trigEngine = "pattern",
  --wordTrig = false,
  --snippetType = "autosnippet",
  --},
  --{
  --t("$"),
  --i(1),
  --t("$")
  --}
  --),
}
