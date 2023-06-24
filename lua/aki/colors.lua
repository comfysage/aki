---@class Color { [1]: string, [2]: number }

---@alias NeutralColor '0_hard' | '0' | '0_soft' | '1' | '2' | '3' | '4'
---@alias NeutralColors { [NeutralColor]: Color }

---@alias AccentColor '0' | '1' | '2' | '3'
---@alias AccentColors { [AccentColor]: Color }

---@class AkiColors
---@field bg NeutralColors
---@field fg NeutralColors
---@field sakura AccentColors
---@field ike AccentColors
---@field kumo AccentColors

---@type AkiColors
_G.aki_colors = {
  bg = {
    ['0_hard'] = { '#2A2A38', 0 },
    ['0_soft'] = { '#1C1D34', 0 },
    ['0']      = { '#252531', 0 },
    ['1'] = { '#353547', 8 },
    ['2'] = { '#414257', 8 },
    ['3'] = { '#4B4C66', 8 },
  },
  fg = {
    ['0'] = { '#EBEBE3', 0 },
    ['1'] = { '#E6E6DD', 8 },
    ['2'] = { '#DFDFD5', 8 },
  },
  sakura = {
    ['0'] = { '#E6B87F', 0 },
    ['1'] = { '#E69E87', 13 },
    ['2'] = { '#CA797E', 0 },
    ['3'] = { '#C982B4', 0 },
  },
  ike = {
    ['0'] = { '#9AB7D2', 0 },
    ['1'] = { '#ABD0D0', 12 },
    ['2'] = { '#A7D0C1', 0 },
    ['3'] = { '#9FD5AB', 0 },
  },
  kumo = {
    ['0'] = { '#A1C3CC', 0 },
    ['1'] = { '#ABADD0', 0 },
    ['2'] = { '#AD8DBD', 0 },
    ['3'] = { '#AF6672', 0 },
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
