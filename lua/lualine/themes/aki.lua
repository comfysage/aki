local theme = require 'aki.colors'.setup {}

local colors = {
  normal = theme.syntax.constant[1],
  insert = theme.syntax.annotation[1],
  visual = theme.syntax.call[1],

  fg0 = theme.fg0[1],
  fg1 = theme.fg1[1],
  bg0 = theme.bg[1],
  bg1 = theme.bg1[1],
  bg2 = theme.bg2[1],
}

local adachi = {}

adachi.normal = {
  a = { fg = colors.bg0, bg = colors.normal },
  b = { bg = colors.bg0, fg = colors.normal },
  c = { bg = colors.bg1, fg = colors.fg0 },
}

adachi.insert = {
  a = { fg = colors.bg0, bg = colors.insert },
  b = { bg = colors.bg0, fg = colors.insert },
}

adachi.command = adachi.normal

adachi.visual = {
  a = { fg = colors.bg0, bg = colors.visual },
  b = { bg = colors.bg0, fg = colors.visual },
}

adachi.replace = adachi.insert

adachi.inactive = {
  a = { bg = colors.bg1, fg = colors.fg1 },
  b = { bg = colors.bg1, fg = colors.fg1 },
  c = { bg = colors.bg1, fg = colors.fg1 },
}

return adachi
