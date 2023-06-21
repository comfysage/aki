---@alias styleField 'search'
---@alias styleValue { reverse: boolean }

---@class AkiTheme
---@field none Color
---@field colors AkiColors
---@field bg Color
---@field fg Color
---@field bg0 Color
---@field bg1 Color
---@field bg2 Color
---@field bg3 Color
---@field bg4 Color
---@field fg0 Color
---@field fg1 Color
---@field fg2 Color
---@field fg3 Color
---@field fg4 Color
---@field sakura  Color
---@field sage    Color
---@field sukai   Color
---@field shinme  Color
---@field sakaeru Color
---@field seiun   Color
---@field ike     Color
---@field syntax { keyword: Color, object: Color, type: Color, context: Color, constant: Color, call: Color }
---@field style { [styleField]: styleValue }
---@field comment Color

local M = {}

---@param colors AkiColors
---@param config AkiConfig
---@return AkiTheme
function M.setup(colors, config)
  local theme   = {}

  theme.none    = { 'NONE', 0 }
  theme.colors  = colors

  theme.bg      = theme.none
  if not config.transparent_background then
    theme.bg = colors.bg['0']
    if config.contrast_dark == 'high' then
      theme.bg = colors.bg['0_hard']
    end
    if config.contrast_dark == 'soft' then
      theme.bg = colors.bg['0_soft']
    end
  end
  theme.fg      = colors.fg['0']

  theme.bg0     = colors.bg['0']
  theme.bg1     = colors.bg['1']
  theme.bg2     = colors.bg['2']
  theme.bg3     = colors.bg['3']
  theme.bg4     = colors.bg['4']

  theme.fg0     = colors.fg['0']
  theme.fg1     = colors.fg['1']
  theme.fg2     = colors.fg['2']
  theme.fg3     = colors.fg['3']
  theme.fg4     = colors.fg['4']

  theme.comment = theme.bg3

  theme.sakura  = colors.sakura['1']
  theme.sage    = colors.sage['1']
  theme.sukai   = colors.sukai['1']
  theme.shinme  = colors.shinme['1']
  theme.sakaeru = colors.sakaeru['1']
  theme.seiun   = colors.seiun['1']
  theme.ike   = colors.ike['1']

  theme.syntax  = {
    keyword = theme.seiun,
    object = theme.fg1,
    type = theme.sakaeru,
    context = theme.bg3,
    constant = theme.seiun,
    call = theme.ike,
  }

  theme.style = {
    search = { reverse = true }
  }
  theme.style = vim.tbl_deep_extend('force', theme.style, config.style)

  return theme
end

return M
