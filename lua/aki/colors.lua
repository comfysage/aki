---@class Color { [1]: string, [2]: number }

---@alias NeutralColor '0_hard' | '0' | '0_soft' | '1' | '2' | '3' | '4'
---@alias NeutralColors { [NeutralColor]: Color }

---@alias MapColor 'red' | 'green' | 'yellow' | 'purple' | 'orange' | 'blue' | 'aqua'
---@alias MapColors { [MapColor]: Color }

---@class AkiColors
---@field bg NeutralColors
---@field fg NeutralColors
---@field sakura NeutralColors
---@field sage NeutralColors
---@field sukai NeutralColors
---@field shinme NeutralColors
---@field sakaeru NeutralColors
---@field seiun NeutralColors
---@field ike NeutralColors

---@type AkiColors
_G.aki_colors = {
  bg = {
    ['0'] = { '#17171F', 0 },
    ['1'] = { '#26273E', 8 },
    ['2'] = { '#343A55', 8 },
    ['3'] = { '#61688C', 8 },
    ['4'] = { '#7980A3', 8 },
  },
  sakura = {
    ['0'] = { '#FBE3EB', 0 },
    ['1'] = { '#EBBED4', 13 },
    ['2'] = { '#D7A8C8', 0 },
  },
  sage = {
    ['0'] = { '#EBE7F4', 0 },
    ['1'] = { '#C4CEE1', 14 },
    ['2'] = { '#AEB8D1', 0 },
  },
  sukai = {
    ['0'] = { '#E7EDF1', 0 },
    ['1'] = { '#BADAEA', 12 },
    ['2'] = { '#A2C3D2', 0 },
  },
  shinme = {
    ['0'] = { '#ECF4E3', 7 },
    ['1'] = { '#B8E3B3', 10 },
    ['2'] = { '#B2D2B6', 0 },
  },
  sakaeru = {
    ['0'] = { '#F4F3E3', 0 },
    ['1'] = { '#E6DEB6', 11 },
    ['2'] = { '#D8D2A7', 0 },
  },
  seiun = {
    ['0'] = { '#FBE3F4', 0 },
    ['1'] = { '#EBBEE4', 13 },
    ['2'] = { '#D0A7D6', 0 },
  },
  ike = {
    ['0'] = { '#E8F3EB', 0 },
    ['1'] = { '#BDE1CE', 12 },
    ['2'] = { '#A2CDBC', 0 },
  },
}

local M = {}

function M.colors()
  return _G.aki_colors
end

---@param config AkiConfig?
---@return AkiTheme
function M.setup(config)
  ---@type AkiConfig
  config = vim.tbl_extend("force", _G.aki_config, config or {})
  return require 'aki.theme'.setup(M.colors(), config)
end

return M
