local M = {}

local name = 'aki'

function M.palettte()
  local colors = require 'aki.colors'.colors()
  local data = { paletteName = name, swatches = {} }
  for k, v in pairs(colors) do
    ---@type string
    local _color = v[1]
    local color = string.sub(_color, 2)
    data.swatches[#data.swatches+1] = {
      name = k, color = color,
    }
  end

  return vim.json.encode(data)
end

return M
