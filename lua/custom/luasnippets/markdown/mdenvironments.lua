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
local line_begin = require("luasnip.extras.expand_conditions").line_begin


return {

  -- generic environment
  s({ trig = "env", snippetType = "autosnippet" },
    fmta(
      [[
        \begin{<>}
            <>
        \end{<>}
      ]],
      {
        i(1),
        i(2),
        rep(1)
      }
    )
  ),

  -- (labeled) equation
  s({ trig = "eq", dscr = "begin equation" },
    fmta(
      [[
      \begin{equation}
          <>
      \end{equation}
      ]],
      { i(0) }
    ),
    { condition = line_begin }
  ),

  -- align environment
  s({ trig = "ali", snippetType = "autosnippet" },
    fmta(
      [[
        \begin{align*}
            <>
        \end{align*}
      ]],
      {
        i(1),
      }
    ),
    { condition = line_begin }
  ),

  -- generic display math
  s({
      trig = "dm",
      snippetType = "autosnippet",
    },
    fmta(
      [[
      \[
          <>
      \]
      ]],
      { i(0) }
    ),
    { condition = line_begin }
  ),

  --inline math env
  s({
      trig = "([^%a])hh",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
    },
    fmta(
      "<>$<>$",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    ),
    { condition = tex_utils.in_text }
  ),

  --inline math at beginning of line
  s({
      trig = "hh",
      snippetType = "autosnippet",
    },
    fmta(
      "$<>$",
      { i(0) }
    ),
    { condition = line_begin }
  ),
}
