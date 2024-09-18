--First we input the helper fucnction
local helpers = require('luasnip-helper-functions')
local get_visual = helpers.get_visual

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
  ----------- INSERT `\text__{ * } THINGS -------------
  --- Normal Text
  s({
      trig = "([^%a])tt",
      desc = "Expands 'tt' into '\text}'",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
    },
    fmta(
      "<>\\text{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        i(1)
      }
    ),
    {
      condition = tex_utils.in_mathzone
    }
  ),

  -- ITALIC i.e. \textit
  s({
      trig = "([^%a])tii",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet"
    },
    fmta(
      "<>\\textit{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    )
  ),

  -- BOLD i.e. \textbf
  s({
      trig = "tbb",
      snippetType = "autosnippet"
    },
    fmta(
      "\\textbf{<>}",
      {
        d(1, get_visual),
      }
    )
  ),

  -------------- \math__{ * } AND SIMILAR

  -- Math Roman i.e. \mathrm
  s({
      trig = "([%a])rmm",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet"
    },
    fmta(
      "\\mathrm{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
      }
    )
  ),

  -- Math Caligraphy i.e. \mathcal
  s({
      trig = "([%a])mcc",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet"
    },
    fmta(
      "\\mathcal{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
      }
    )
  ),

  -- Math Fraktor i.e. \mathfrak
  s({
      trig = "([%a])mfr",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet"
    },
    fmta(
      "\\mathfrak{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
      }
    )
  ),
  -- Math Blackboard i.e. \mathbb
  s({
      trig = "([%a])mbb",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet"
    },
    fmta(
      "\\mathbb{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
      }
    )
  ),

  -- Math Script i.e. \mathscr
  s({
      trig = "([%a])mscr",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet"
    },
    fmta(
      "\\mathscr{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
      }
    )
  ),

  --------- \RR, \CC, \HH, AND THE LIKE ----------

  s({
      trig = "RR",
      snippetType = "autosnippet",
    },
    {
      t("\\RR"),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "CC",
      snippetType = "autosnippet",
    },
    {
      t("\\CC"),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "HH",
      snippetType = "autosnippet",
    },
    {
      t("\\HH"),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "EE",
      snippetType = "autosnippet",
    },
    {
      t("\\EE"),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "DD",
      snippetType = "autosnippet",
    },
    {
      t("\\DD"),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({ trig = "lmod" }, { t("$L$-module ") }),
  s({ trig = "lmods" }, { t("$L$-modules ") }),
}
