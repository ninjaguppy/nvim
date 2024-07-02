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
  -- Lowercase Greek Letters
  s({
      trig = "`a",
      snippetType = "autosnippet",
      wordTrig = false,
    },
    {
      t("\\alpha"),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "`b",
      snippetType = "autosnippet",
      wordTrig = false,
    },
    {
      t("\\beta"),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "`c",
      snippetType = "autosnippet",
      wordTrig = false,
    },
    {
      t("\\chi"),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "`d",
      snippetType = "autosnippet",
      wordTrig = false,
    },
    {
      t("\\delta"),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "`D",
      snippetType = "autosnippet",
      wordTrig = false,
    },
    {
      t("\\Delta"),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "`e",
      snippetType = "autosnippet",
      wordTrig = false,
    },
    {
      t("\\varepsilon"),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "`ve",
      snippetType = "autosnippet",
      wordTrig = false,
    },
    {
      t("\\epsilon"),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "`f",
      snippetType = "autosnippet",
      wordTrig = false,
    },
    {
      t("\\phi"),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "`f",
      snippetType = "autosnippet",
      wordTrig = false,
    },
    {
      t("\\phi"),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "`vf",
      snippetType = "autosnippet",
      wordTrig = false,
    },
    {
      t("\\varphi"),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "`F",
      snippetType = "autosnippet",
      wordTrig = false,
    },
    {
      t("\\Phi"),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "`g",
      snippetType = "autosnippet",
      wordTrig = false,
    },
    {
      t("\\gamma")
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "`G",
      snippetType = "autosnippet",
      wordTrig = false,
    },
    {
      t("\\Gamma"),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "`h",
      snippetType = "autosnippet",
      wordTrig = false,
    },
    {
      t("\\eta"),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "`k",
      snippetType = "autosnippet",
      wordTrig = false,
    },
    {
      t("\\kappa"),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "`l",
      snippetType = "autosnippet",
      wordTrig = false,
    },
    {
      t("\\lambda"),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "`L",
      snippetType = "autosnippet",
      wordTrig = false,
    },
    {
      t("\\Lambda"),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "`m",
      snippetType = "autosnippet",
      wordTrig = false,
    },
    {
      t("\\mu"),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "`n",
      snippetType = "autosnippet",
      wordTrig = false,
    },
    {
      t("\\nu"),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "`o",
      snippetType = "autosnippet",
      wordTrig = false,
    },
    {
      t("\\omega"),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "`O",
      snippetType = "autosnippet",
      wordTrig = false,
    },
    {
      t("\\Omega"),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "`p",
      snippetType = "autosnippet",
      wordTrig = false,
    },
    {
      t("\\pi"),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "`P",
      snippetType = "autosnippet",
      wordTrig = false,
    },
    {
      t("\\Bi"),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "`q",
      snippetType = "autosnippet",
      wordTrig = false,
    },
    {
      t("\\theta"),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "`Q",
      snippetType = "autosnippet",
      wordTrig = false,
    },
    {
      t("\\Theta"),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "`r",
      snippetType = "autosnippet",
      wordTrig = false,
    },
    {
      t("\\rho"),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "`s",
      snippetType = "autosnippet",
      wordTrig = false,
    },
    {
      t("\\sigma"),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "`S",
      snippetType = "autosnippet",
      wordTrig = false,
    },
    {
      t("\\Sigma"),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "`t",
      snippetType = "autosnippet",
      wordTrig = false,
    },
    {
      t("\\tau"),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "`u",
      snippetType = "autosnippet",
      wordTrig = false,
    },
    {
      t("\\upsilon"),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "`U",
      snippetType = "autosnippet",
      wordTrig = false,
    },
    {
      t("\\Upsilon"),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "`vv",
      snippetType = "autosnippet",
      wordTrig = false,
    },
    {
      t("\\vee"),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "`x",
      snippetType = "autosnippet",
      wordTrig = false,
    },
    {
      t("\\xi"),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "`X",
      snippetType = "autosnippet",
      wordTrig = false,
    },
    {
      t("\\Xi"),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "`y",
      snippetType = "autosnippet",
      wordTrig = false,
    },
    {
      t("\\psi"),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "`Y",
      snippetType = "autosnippet",
      wordTrig = false,
    },
    {
      t("\\Psi"),
    },
    { condition = tex_utils.in_mathzone }
  ),

  s({
      trig = "`z",
      snippetType = "autosnippet",
      wordTrig = false,
    },
    {
      t("\\zeta"),
    },
    { condition = tex_utils.in_mathzone }
  ),

}
