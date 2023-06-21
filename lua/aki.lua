local aki = {}

---@class AkiConfig
---@field transparent_background boolean
---@field contrast_dark 'high'|'mid'|'soft'
---@field override_terminal boolean
---@field style { [styleField]: styleValue }
---@field overrides HLGroups

---@type AkiConfig
aki.default_config = {
    transparent_background = false,
    contrast_dark = 'mid',
    override_terminal = true,
    style = {
        search = { reverse = true },
    },
    overrides = {},
}

_G.aki_config = _G.aki_config or aki.default_config

function aki.setup(config)
    _G.aki_config = vim.tbl_deep_extend("force", _G.aki_config, config or {})
end

---@param group string
---@param colors ColorSpec
local function set_hi(group, colors)
    if not vim.tbl_isempty(colors) then
        colors.fg = colors[1] and colors[1][1] or 'NONE'
        colors.bg = colors[2] and colors[2][1] or 'NONE'
        colors.ctermfg = colors[1] and colors[1][2] or 'NONE'
        colors.ctermbg = colors[2] and colors[2][2] or 'NONE'
        colors[1] = nil
        colors[2] = nil
        vim.api.nvim_set_hl(0, group, colors)
    end
end

---@param hlgroups HLGroups
local function set_highlights(hlgroups)
    vim.cmd("highlight Normal guifg=" .. hlgroups.Normal[1][1] .. " guibg=" .. hlgroups.Normal[2][1])
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

    if vim.o.background == 'light' then
        _G.aki_config.theme = 'light'
    elseif vim.o.background == 'dark' then
        _G.aki_config.theme = 'default'
    end

    local theme = require 'aki.colors'.setup()
    local hlgroups = require 'aki.hl.init'.setup(theme, _G.aki_config)

    set_highlights(hlgroups)
end

function aki.colors()
    require 'aki.colors'
    return _G.aki_colors
end

return aki
