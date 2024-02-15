---@class aki.types.Color { [1]: string, [2]: number }

---@alias aki.types.ColorField 'bg0_hard'|'bg0_soft'|'bg0'|'bg1'|'bg2'|'bg3'|'bg4'|'fg0'|'fg1'|'fg2'|'red'|'orange'|'yellow'|'green'|'aqua'|'blue'|'purple'
---@alias aki.types.Colors { [aki.types.ColorField]: aki.types.Color }

---@type aki.types.Colors
_G.aki_colors = {
  bg0_hard = { "#1A1B24", 0 },
  bg0      = { "#22232E", 0 },
  bg0_soft = { "#292A36", 0 },
  bg1      = { "#2C2D39", 8 },
  bg2      = { "#373846", 8 },
  bg3      = { "#454756", 8 },
  bg4      = { "#58596E", 8 },
  fg0      = { "#E4E1DD", 7 },
  fg1      = { "#D1CEC9", 7 },
  fg2      = { "#99A3C2", 7 },
  red      = { "#CA6D73", 1 },
  orange   = { "#E09F87", 11 },
  yellow   = { "#E6C193", 3 },
  green    = { "#B4C7A7", 2 },
  aqua     = { "#9BC2B1", 6 },
  blue     = { "#939DBD", 4 },
  purple   = { "#AD8DBD", 5 },
}

local M = {}

function M.colors()
  return _G.aki_colors
end

---@param config aki.types.Config?
---@return aki.types.Theme
function M.setup(config)
  ---@type aki.types.Config
  config = vim.tbl_extend("force", _G.aki_config, config or {})
  return require 'aki.theme'.setup(M.colors(), config)
end

return M
