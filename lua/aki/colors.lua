---@class aki.types.Color { [1]: string, [2]: number }

---@alias aki.types.ColorField 'bg0_hard'|'bg0_soft'|'bg0'|'bg1'|'bg2'|'bg3'|'bg4'|'bg5'|'bg_visual'|'bg_red'|'bg_green'|'bg_blue'|'bg_yellow'|'fg0'|'fg1'|'fg2'|'red'|'orange'|'yellow'|'green'|'aqua'|'blue'|'purple'
---@alias aki.types.Colors { [aki.types.ColorField]: aki.types.Color }

---@type aki.types.Colors
_G.aki_colors = {
  bg0_hard = { "#161720", 0 },
  bg0      = { "#1D1E28", 0 },
  bg0_soft = { "#252731", 0 },
  bg1      = { "#2C2E39", 8 },
  bg2      = { "#373946", 8 },
  bg3      = { "#454856", 8 },
  bg4      = { "#585B6E", 8 },
  bg5      = { "#797EA3", 8 },
  fg0      = { "#DADDEB", 7 },
  fg1      = { "#CCD0E3", 7 },
  fg2      = { "#A3ADD1", 7 },
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
