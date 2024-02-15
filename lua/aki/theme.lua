---@class aki.types.StyleConfig
---@field tabline { reverse: boolean, color: aki.types.ColorField }
---@field search { reverse: boolean, inc_reverse: boolean }
---@field types { italic: boolean }
---@field keyword { italic: boolean }
---@field comment { italic: boolean }

---@class aki.types.Theme
---@field none aki.types.Color
---@field colors aki.types.Colors
---@field base { fg: aki.types.Color, bg: aki.types.Color }
---@field bg aki.types.Color
---@field fg aki.types.Color
---@field bg0 aki.types.Color
---@field bg1 aki.types.Color
---@field bg2 aki.types.Color
---@field bg3 aki.types.Color
---@field fg0 aki.types.Color
---@field fg1 aki.types.Color
---@field fg2 aki.types.Color
---@field red  aki.types.Color
---@field yellow aki.types.Color
---@field orange aki.types.Color
---@field green aki.types.Color
---@field aqua aki.types.Color
---@field blue aki.types.Color
---@field purple aki.types.Color
---@field syntax aki.types.Syntax
---@field diagnostic { ['ok'|'error'|'warn'|'info'|'hint']: aki.types.Color }
---@field diff { ['add'|'delete'|'change']: aki.types.Color }
---@field style aki.types.StyleConfig
---@field sign aki.types.Color
---@field comment aki.types.Color
---@field bg_accent aki.types.Color

---@class aki.types.Syntax
---@field keyword aki.types.Color
---@field object aki.types.Color
---@field field aki.types.Color
---@field type aki.types.Color
---@field context aki.types.Color
---@field bracket aki.types.Color
---@field constant aki.types.Color
---@field call aki.types.Color
---@field string aki.types.Color
---@field macro aki.types.Color
---@field annotation aki.types.Color

local M = {}

---@param colors aki.types.Colors
---@param config aki.types.Config
---@return aki.types.Theme
function M.setup(colors, config)
  local theme = {}

  theme.none = { 'NONE', 0 }
  theme.colors = colors

  theme.bg = theme.none
  local bg_c = {
    hard = colors.bg0_hard,
    medium = colors.bg0,
    soft = colors.bg0_soft,
  }
  if not config.transparent_background then
    theme.bg = bg_c[config.theme] or colors.bg0
  end
  theme.base = { fg = colors.bg0, bg = theme.bg }
  theme.fg = colors.fg0

  theme.bg0 = colors.bg0
  theme.bg1 = colors.bg1
  theme.bg2 = colors.bg2
  theme.bg3 = colors.bg3

  theme.fg0 = colors.fg0
  theme.fg1 = colors.fg1
  theme.fg2 = colors.fg2

  local sign_colors = { dawn = theme.bg3 }
  theme.sign = sign_colors[config.theme] or theme.none
  theme.comment = colors.bg4
  theme.bg_accent = theme.bg2

  theme.red = colors.red
  theme.orange = colors.orange
  theme.yellow = colors.yellow
  theme.green = colors.green
  theme.aqua = colors.aqua
  theme.blue = colors.blue
  theme.purple = colors.purple

  theme.syntax = {
    keyword = theme.red,
    object = theme.fg1,
    field = theme.fg1,
    type = theme.orange,
    context = theme.bg3,
    bracket = theme.fg2,
    constant = theme.purple,
    call = theme.aqua,
    string = theme.green,
    macro = theme.orange,
    annotation = theme.orange,
  }
  theme.diagnostic = {
    ok = theme.green,
    error = theme.red,
    warn = theme.yellow,
    info = theme.aqua,
    hint = theme.blue,
  }
  theme.diff = {
    add = theme.green,
    delete = theme.red,
    change = theme.aqua,
  }

  theme.style = {
    search = { reverse = true },
  }
  theme.style = vim.tbl_deep_extend('force', theme.style, config.style)

  return theme
end

return M
