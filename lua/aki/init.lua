local aki = {}

---@class aki.types.Config
---@field transparent_background boolean
---@field theme 'hard'|'medium'|'soft'
---@field override_terminal boolean
---@field style aki.types.StyleConfig
---@field overrides aki.types.HLGroups

---@type aki.types.Config
aki.default_config = {
    transparent_background = false,
    theme = 'medium',
    override_terminal = true,
    style = {
        tabline = { reverse = true, color = 'purple' },
        search = { reverse = false, inc_reverse = true },
        types = { italic = true },
        keyword = { italic = true },
        comment = { italic = false },
    },
    overrides = {},
}

---@type aki.types.Config
_G.aki_config = vim.tbl_deep_extend("force", aki.default_config, _G.aki_config or {})

---@param config aki.types.Config|table
function aki.setup(config)
    _G.aki_config = vim.tbl_deep_extend("force", _G.aki_config, config or {})
end

---@param group string
---@param colors aki.types.ColorSpec
local function set_hi(group, colors)
    if not vim.tbl_isempty(colors) then
        ---@type vim.api.keyset.highlight
        local color = colors
        color.fg = colors[1] and colors[1][1] or 'NONE'
        color.bg = colors[2] and colors[2][1] or 'NONE'
        color.ctermfg = colors[1] and colors[1][2] or 'NONE'
        color.ctermbg = colors[2] and colors[2][2] or 'NONE'
        color[1] = nil
        color[2] = nil
        vim.api.nvim_set_hl(0, group, color)
    end
end

---@param hlgroups aki.types.HLGroups
local function set_highlights(hlgroups)
    vim.cmd("highlight Normal guifg=" .. hlgroups.Normal[1][1] .. " guibg=" .. hlgroups.Normal[2][1].. " ctermfg=" .. hlgroups.Normal[1][2] .. " ctermbg=" .. hlgroups.Normal[2][2])
    hlgroups.Normal = nil
    for group, colors in pairs(hlgroups) do
        set_hi(group, colors)
    end
end

function aki.load(_)
    if vim.g.colors_name then
        vim.cmd('hi clear')
    end

    vim.g.colors_name = 'aki'
    vim.o.termguicolors = true

    -- if vim.o.background == 'light' then
    --     _G.aki_config.theme = 'light'
    -- elseif vim.o.background == 'dark' then
    --     _G.aki_config.theme = 'default'
    -- end

    local theme = require 'aki.colors'.setup()
    local hlgroups = require 'aki.hl.init'.setup(theme, _G.aki_config)

    set_highlights(hlgroups)
end

function aki.colors()
    return require 'aki.colors'.colors()
end

return aki
