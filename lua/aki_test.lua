local aki = R 'aki'
aki.setup {
    transparent_background = false,
    theme = 'medium',
    style = {
        tabline = { reverse = true, color = "purple" },
        search = { reverse = false, inc_reverse = true },
        types = { italic = true },
        keyword = { italic = false },
        comment = { italic = true },
    },
}
aki.load {}

-- [NOTE] is needed to reload lualine
vim.api.nvim_exec_autocmds('ColorScheme', {})

-- vim.o.termguicolors = false
