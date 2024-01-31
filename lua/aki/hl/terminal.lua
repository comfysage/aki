---@param theme aki.types.Theme
---@param _ aki.types.Colors
return function(theme, _)
  vim.g.terminal_color_0  = theme.bg0[1]
  vim.g.terminal_color_8  = theme.bg2[1]
  vim.g.terminal_color_1  = theme.red[1]
  vim.g.terminal_color_9  = theme.red[1]
  vim.g.terminal_color_2 = theme.green[1]
  vim.g.terminal_color_10  = theme.green[1]
  vim.g.terminal_color_3 = theme.yellow[1]
  vim.g.terminal_color_11  = theme.orange[1]
  vim.g.terminal_color_4 = theme.blue[1]
  vim.g.terminal_color_12  = theme.blue[1]
  vim.g.terminal_color_5 = theme.purple[1]
  vim.g.terminal_color_13  = theme.purple[1]
  vim.g.terminal_color_6 = theme.aqua[1]
  vim.g.terminal_color_14  = theme.aqua[1]
  vim.g.terminal_color_7 = theme.fg0[1]
  vim.g.terminal_color_15  = theme.fg2[1]
end
