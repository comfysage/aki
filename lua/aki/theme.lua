---@class aki.types.styleconfig
---@field tabline { reverse: boolean, color: aki.types.colorfield }
---@field search { reverse: boolean, inc_reverse: boolean }
---@field types { italic: boolean }
---@field keyword { italic: boolean }
---@field comment { italic: boolean }

---@class aki.types.theme
---@field none aki.types.color
---@field colors aki.types.colors
---@field base { fg: aki.types.color, bg: aki.types.color }
---@field bg aki.types.color
---@field fg aki.types.color
---@field bg0 aki.types.color
---@field bg1 aki.types.color
---@field bg2 aki.types.color
---@field bg3 aki.types.color
---@field fg0 aki.types.color
---@field fg1 aki.types.color
---@field fg2 aki.types.color
---@field red  aki.types.color
---@field yellow aki.types.color
---@field orange aki.types.color
---@field green aki.types.color
---@field aqua aki.types.color
---@field blue aki.types.color
---@field purple aki.types.color
---@field syntax aki.types.Syntax
---@field diagnostic { ['ok'|'error'|'warn'|'info'|'hint']: aki.types.color }
---@field diff { ['add'|'delete'|'change']: aki.types.color }
---@field style aki.types.styleconfig
---@field sign aki.types.color
---@field comment aki.types.color
---@field bg_accent aki.types.color

---@class aki.types.Syntax
---@field keyword aki.types.color
---@field object aki.types.color
---@field field aki.types.color
---@field type aki.types.color
---@field context aki.types.color
---@field bracket aki.types.color
---@field constant aki.types.color
---@field call aki.types.color
---@field string aki.types.color
---@field macro aki.types.color
---@field annotation aki.types.color

local M = {}

---@param colors aki.types.colors
---@param config aki.types.config
---@return aki.types.theme
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

  local sign_colors = { soft = theme.bg3 }
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
