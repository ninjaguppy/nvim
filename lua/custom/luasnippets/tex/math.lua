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
  ------ Inserting text in math mode -------
  s({
      trig = "which",
      snippetType = "autosnippet"
    },
    {
      t("\\text{ for which } "),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "all",
      snippetType = "autosnippet"
    },
    {
      t("\\text{ for all } "),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "and",
      snippetType = "autosnippet"
    },
    {
      t("\\text{ and }"),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "forall",
      snippetType = "autosnippet"
    },
    {
      t("\\text{ for all } "),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "inff",
      snippetType = "autosnippet"
    },
    {
      t("\\infty"),
    },
    { condition = tex_utils.in_mathzone }
  ),
  -- SUPERSCRIPT
  s({
      trig = '([%w%)%]%}])"',
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet"
    },
    fmta(
      "<>^{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),

  --------- SUBSCIPTS, SUPERSCRIPTS AND SIMILAR--------
  -- Subscript
  s({
      trig = "([%w%)%]%}]):",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet"
    },
    fmta(
      "<>_{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),
  -- SUBSCRIPT AND SUPERSCRIPT
  s({
      trig = "([%w%)%]%}])__",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet"
    },
    fmta(
      "<>^{<>}_{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        i(1),
        i(2),
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),

  -- Text Subscript
  s({
      trig = 'sd',
      snippetType = "autosnippet",
      wordTrig = false
    },
    fmta(
      "_{\\mathrm{<>}}",
      { d(1, get_visual) }
    ),
    { condition = tex_utils.in_mathzone }
  ),

  -- Superscript Shortcut
  -- Places the first alphanumeric character after the trigger into a superscript.
  s({
      trig = "([%w%)%]%}])'([%w])",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet"
    },
    fmta(
      "<>^{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        f(function(_, snip) return snip.captures[2] end),
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),

  -- Subscript Shortcut
  -- Places the first alphanumeric character after the trigger into a subscript.
  s({
      trig = '([%w%)%]%}]);([%w])',
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet"
    },
    fmta(
      "<>_{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        f(function(_, snip) return snip.captures[2] end),
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),

  -- Zero Subscript Shortcut
  s({
      trig = '([%a%)%]%}])00',
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet"
    },
    fmta(
      "<>_{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        t("0")
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),

  -- i Subscript Shortcut
  s({
      trig = '([%a%)%]%}])ii',
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet"
    },
    fmta(
      "<>_{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        t("i")
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),

  -- j Subscript Shortcut
  s({
      trig = '([%a%)%]%}])jj',
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet"
    },
    fmta(
      "<>_{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        t("j")
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),

  -- k Subscript Shortcut
  s({
      trig = '([%a%)%]%}])kk',
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet"
    },
    fmta(
      "<>_{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        t("k")
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),

  -- m Subscript Shortcut
  s({
      trig = '([%a%)%]%}])mm',
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet"
    },
    fmta(
      "<>_{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        t("m")
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),

  -- n Subscript Shortcut
  s({
      trig = '([%a%)%]%}])nn',
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet"
    },
    fmta(
      "<>_{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        t("n")
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),

  ------------ CALCULUS AND SIMILAR ----------------
  -- TODO: Derivatives

  --Integrals
  s({ trig = "iint", snippetType = "autosnippet" },
    {
      t("\\int"),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({ trig = "int" },
    fmta(
      "\\int_{<>}^{<>}",
      {
        i(1, "-\\infty"),
        i(2, "\\infty"),
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),

  s({ trig = "oint", snippetType = "autosnippet" },
    {
      t("\\oint"),
    },
    { condition = tex_utils.in_mathzone }
  ),

  -- SUM with lower limit
  s({
      trig = "([^%a])sM",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet"
    },
    fmta(
      "<>\\sum_{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        i(1),
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),
  -- SUM with upper and lower limit
  s({
      trig = "([^%a])smm",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet"
    },
    fmta(
      "<>\\sum_{<>}^{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        i(1),
        i(2),
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),
  -- TODO: Figure out how to do sum/sin/log/cos, etc. Might just need to grab
  -- ultisnips for this and fractions.

  ---------------SYMBOLS---------------

  -- Divides
  s({ trig = "||", snippetType = "autosnippet" },
    {
      t("\\mid"),
    },
    { condition = tex_utils.in_mathzone }
  ),

  -- Cdots, i.e. \cdots
  s({ trig = "cdd", snippetType = "autosnippet" },
    {
      t("\\cdots"),
    },
    { condition = tex_utils.in_mathzone }
  ),

  -- Ddots, i.e. \ddots
  s({ trig = "ddd", snippetType = "autosnippet" },
    {
      t("\\ddots"),
    },
    { condition = tex_utils.in_mathzone }
  ),

  -- Ldots, i.e. \ldots
  s({ trig = "...", snippetType = "autosnippet" },
    {
      t("\\ldots"),
    }
  ),

  -- SETMINUS, i.e. \setminus
  s({ trig = "`-", snippetType = "autosnippet" },
    {
      t("\\setminus "),
    },
    { condition = tex_utils.in_mathzone }
  ),

  -- SUBSET, i.e. \subset
  s({ trig = "cc", snippetType = "autosnippet" },
    {
      t("\\subset "),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({ trig = "xx", snippetType = "autosnippet", priority = 1000 },
    {
      t("\\times "),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({ trig = "opp", snippetType = "autosnippet" },
    {
      t("\\oplus "),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({ trig = "oxx", snippetType = "autosnippet" },
    {
      t("\\otimes "),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({ trig = "->", snippetType = "autosnippet" },
    {
      t("\\to "),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({ trig = "!>", snippetType = "autosnippet", wordTrig = false },
    {
      t("\\mapsto "),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({ trig = "=>", snippetType = "autosnippet" },
    {
      t("\\implies "),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({ trig = "=<", snippetType = "autosnippet" },
    {
      t("\\impliedby "),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({ trig = ">=", snippetType = "autosnippet" },
    {
      t("\\geq "),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({ trig = "<=", snippetType = "autosnippet" },
    {
      t("\\leq "),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({ trig = "!=", snippetType = "autosnippet" },
    {
      t("\\neq "),
    },
    { condition = tex_utils.in_mathzone }
  ),

  ---- Modifiers + Similar
  -- set
  s({
      trig = "set",
      snippetType = "autosnippet",
    },
    fmta(
      "\\{<>\\}<>",
      {
        i(1),
        i(0)
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),


  -- squared
  s({
      trig = "sr",
      snippetType = "autosnippet",
      wordTrig = false
    },
    {
      t("^2 "),
    },
    { condition = tex_utils.in_mathzone }
  ),

  -- cubed
  s({
      trig = "cb",
      snippetType = "autosnippet",
      wordTrig = false
    },
    {
      t("^3 "),
    },
    { condition = tex_utils.in_mathzone }
  ),

  -- SQUARE ROOT
  s({
      trig = "([^%\\])sq",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet"
    },
    fmta(
      "<>\\sqrt{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),

  -- ABSOLUTE VALUE
  s({
      trig = "([^%a])aa",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet"
    },
    fmta(
      "<>\\abs{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "inn",
      snippetType = "autosnippet",
      priority = 1500
    },
    { t("\\in ") },
    { condition = tex_utils.in_mathzone }
  ),
  -- MATRICES
  s({
      trig = "bmat",
      snippetType = "autosnippet",
    },
    fmta(
      [[
        \begin{bmatrix}
            <>
        \end{bmatrix}
      ]],
      {
        i(0)
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "pmat",
      snippetType = "autosnippet",
    },
    fmta(
      [[
        \begin{pmatrix}
            <>
        \end{pmatrix}
      ]],
      {
        i(0)
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "2mat",
    },
    fmta(
      "\\begin{bmatrix} <> & <> \\\\ <> & <> \\end{bmatrix}<>",
      {
        i(1),
        i(2),
        i(3),
        i(4),
        i(0),
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "3mat",
    },
    fmta(
      "\\begin{bmatrix} <> & <> & <> \\\\ <> & <> & <> \\\\ <> & <> & <> \\end{bmatrix}<>",
      {
        i(1),
        i(2),
        i(3),
        i(4),
        i(5),
        i(6),
        i(7),
        i(8),
        i(9),
        i(0),
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),
  -- Whatever
  s({ trig = "gll" },
    {
      t("\\mathfrak{gl}(V)"),
    },
    { condition = tex_utils.in_mathzone }
  ),
}
