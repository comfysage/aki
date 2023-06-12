local M = {}

---@alias ColorSpec { [1]: Color, [2]: Color, link: string, reverse: boolean }

---@param theme AkiTheme
---@param config AkiConfig
function M.setup(theme, config)
  ---@type { [string]: ColorSpec }
  local hl_groups = {
    Normal = { theme.fg, theme.bg },
    Statement = { theme.syntax.keyword },
    Identifier = { theme.syntax.object },
    Type = { theme.syntax.type },
    Function = { theme.shinme },
    Structure = { theme.ike },

    Comment = { theme.comment },

    Special = { theme.syntax.context },
    Delimiter = { theme.syntax.context },
    Operator = { theme.bg3 },
    MatchParen = { theme.sukai },

    Constant = { theme.syntax.constant },
    String = { theme.shinme },

    LineNr = { theme.bg2 },
    CursorLineNr = { theme.bg3 },
    SignColumn = { theme.none, theme.bg },
    VertSplit = { theme.bg3 },
    TabLineSel = { theme.bg, theme.seiun },
    TabLine = { theme.bg3, theme.bg },
    TabLineFill = { link = 'TabLine' },
    Title = { theme.bg2 },
    NonText = { theme.bg2, theme.none },
    Folded = { theme.bg4 },
    FoldColumn = { theme.bg1 },

    Search = { theme.sakaeru },

    Error = { theme.sakura },
    ErrorMsg = { link = "Error" },
    WarningMsg = { link = "Error" },
    MoreMsg = { theme.bg3 },
    ModeMsg = { theme.bg2, theme.none },

    ColorColumn = { theme.none, theme.bg1 },

    Todo = { theme.bg, theme.shinme },

    PreProc = { theme.shinme },

    Directory = { link = "Constant" },

    Underlined = { theme.none, theme.none },

    -- Treesitter
    --[[ TSStrong    = { theme.none, theme.none, bold = theme.bold.general },
    TSEmphasis  = { theme.none, theme.none, italic = theme.italic.general },
    TSUnderline = { theme.none, theme.none, underline = theme.underline.general },
    TSNote      = { theme.blue, theme.bg0, bold = theme.bold.general },
    TSWarning   = { theme.yellow, theme.bg0, bold = theme.bold.general },
    TSDanger    = { theme.red, theme.bg0, bold = theme.bold.general }, ]]

    TSAnnotation         = { theme.seiun },
    TSAttribute          = { theme.seiun },
    TSBoolean            = { link = "Boolean" },
    TSCharacter          = { link = "Character" },
    TSComment            = { link = "Comment" },
    TSConditional        = { link = "Conditional" },
    TSConstBuiltin       = { link = "Constant" },
    TSConstMacro         = { link = "Constant" },
    TSConstant           = { link = "Constant" },
    TSConstructor        = { theme.shinme },
    TSException          = { link = "Exception" },
    TSField              = { theme.syntax.object },
    TSFloat              = { link = "Float" },
    TSFuncBuiltin        = { link = "Constant" },
    TSFuncMacro          = { link = "Constant" },
    TSFunction           = { link = "Function" },
    TSInclude            = { link = "Include" },
    TSKeyword            = { link = "Keyword" },
    TSKeywordFunction    = { link = "Keyword" },
    TSKeywordOperator    = { theme.sakaeru },
    TSLabel              = { link = "Label" },
    TSMethod             = { theme.syntax.context },
    TSNamespace          = { link = "Constant" },
    TSNone               = { link = "Normal" },
    TSNumber             = { link = "Number" },
    TSOperator           = { link = "Operator" },
    TSParameter          = { link = "Identifier" },
    TSParameterReference = { link = "TSParameter" },
    TSProperty           = { theme.syntax.object },
    TSPunctBracket       = { theme.bg4 },
    TSPunctDelimiter     = { link = "Delimiter" },
    TSPunctSpecial       = { link = "Special" },
    TSRepeat             = { link = "Repeat" },
    TSStorageClass       = { link = "StorageClass" },
    TSString             = { link = "String" },
    TSStringEscape       = { theme.sakaeru },
    TSStringRegex        = { theme.sakaeru },
    TSSymbol             = { theme.fg1 },
    TSTag                = { link = "Tag" },
    TSTagDelimiter       = { theme.fg1 },
    TSText               = { theme.fg1 },
    TSStrike             = { theme.bg4 },
    TSMath               = { theme.sukai },
    TSType               = { link = "Type" },
    TSTypeBuiltin        = { link = "Type" },
    TSURI                = { link = "markdownUrl" },
    TSVariable           = { link = "Identifier" },
    TSVariableBuiltin    = { link = "Constant" },

    -- Completion Menu
    Pmenu = { theme.fg1, theme.bg2 },
    PmenuSel = { theme.bg2, theme.shinme, reverse = theme.style.search.reverse },
    PmenuSbar = { theme.none, theme.bg2 },
    PmenuThumb = { theme.none, theme.bg4 },

    -- Diffs
    DiffDelete = { theme.sakura, theme.bg0 },
    DiffAdd = { theme.shinme, theme.bg0 },
    DiffChange = { theme.sage, theme.bg0 },
    DiffText = { theme.fg, theme.bg0 },

    -- Spell
    SpellCap   = { theme.shinme },
    SpellBad   = { theme.sage },
    SpellLocal = { theme.sage },
    SpellRare  = { theme.seiun },

    -- Diagnostics
    DiagnosticFloatingError              = { link = "ErrorFloat" },
    DiagnosticFloatingWarn               = { link = "WarningFloat" },
    DiagnosticFloatingInfo               = { link = "InfoFloat" },
    DiagnosticFloatingHint               = { link = "HintFloat" },
    --[[ DiagnosticError                      = { link = "AdachiRedDark" },
    DiagnosticWarn                       = { link = "AdachiYellowDark" },
    DiagnosticInfo                       = { link = "AdachiAquaDark" }, ]]
    -- DiagnosticHint                       = { link = "AdachiAquaDark" },
    DiagnosticError = { theme.sakura },
    DiagnosticWarn = { theme.sakaeru },
    DiagnosticInfo = { theme.sage },
    DiagnosticHint = { theme.sukai },
    DiagnosticVirtualTextError           = { link = "DiagnosticError" },
    DiagnosticVirtualTextWarn            = { link = "DiagnosticWarn" },
    DiagnosticVirtualTextInfo            = { link = "DiagnosticInfo" },
    DiagnosticVirtualTextHint            = { link = "DiagnosticHint" },
    DiagnosticUnderlineError             = { link = "ErrorText" },
    DiagnosticUnderlineWarn              = { link = "WarningText" },
    DiagnosticUnderlineInfo              = { link = "InfoText" },
    DiagnosticUnderlineHint              = { link = "HintText" },
    DiagnosticSignError                  = { link = "AdachiRedSign" },
    DiagnosticSignWarn                   = { link = "AdachiYellowSign" },
    DiagnosticSignInfo                   = { link = "AdachiBlueSign" },
    DiagnosticSignHint                   = { link = "AdachiGreenSign" },
    LspDiagnosticsFloatingError          = { link = "DiagnosticFloatingError" },
    LspDiagnosticsFloatingWarning        = { link = "DiagnosticFloatingWarn" },
    LspDiagnosticsFloatingInformation    = { link = "DiagnosticFloatingInfo" },
    LspDiagnosticsFloatingHint           = { link = "DiagnosticFloatingHint" },
    LspDiagnosticsDefaultError           = { link = "DiagnosticError" },
    LspDiagnosticsDefaultWarning         = { link = "DiagnosticWarn" },
    LspDiagnosticsDefaultInformation     = { link = "DiagnosticInfo" },
    LspDiagnosticsDefaultHint            = { link = "DiagnosticHint" },
    LspDiagnosticsVirtualTextError       = { link = "DiagnosticVirtualTextError" },
    LspDiagnosticsVirtualTextWarning     = { link = "DiagnosticVirtualTextWarn" },
    LspDiagnosticsVirtualTextInformation = { link = "DiagnosticVirtualTextInfo" },
    LspDiagnosticsVirtualTextHint        = { link = "DiagnosticVirtualTextHint" },
    LspDiagnosticsUnderlineError         = { link = "DiagnosticUnderlineError" },
    LspDiagnosticsUnderlineWarning       = { link = "DiagnosticUnderlineWarn" },
    LspDiagnosticsUnderlineInformation   = { link = "DiagnosticUnderlineInfo" },
    LspDiagnosticsUnderlineHint          = { link = "DiagnosticUnderlineHint" },
    LspDiagnosticsSignError              = { link = "DiagnosticSignError" },
    LspDiagnosticsSignWarning            = { link = "DiagnosticSignWarn" },
    LspDiagnosticsSignInformation        = { link = "DiagnosticSignInfo" },
    LspDiagnosticsSignHint               = { link = "DiagnosticSignHint" },
    LspReferenceText                     = { link = "CurrentWord" },
    LspReferenceRead                     = { link = "CurrentWord" },
    LspReferenceWrite                    = { link = "CurrentWord" },
    LspCodeLens                          = { link = "VirtualTextInfo" },
    LspCodeLensSeparator                 = { link = "VirtualTextHint" },
    LspSignatureActiveParameter          = { link = "Search" },
    healthError                          = { link = "DiagnosticError" },
    healthSuccess                        = { link = "AdachiGreenDark" },
    healthWarning                        = { link = "DiagnosticWarn" },
  }

  if vim.fn.has('nvim-0.8.0') then
    hl_groups['@annotation']            = { link = "TSAnnotation" }
    hl_groups['@attribute']             = { link = "TSAttribute" }
    hl_groups['@boolean']               = { link = "TSBoolean" }
    hl_groups['@character']             = { link = "TSCharacter" }
    hl_groups['@comment']               = { link = "TSComment" }
    hl_groups['@conditional']           = { link = "TSConditional" }
    hl_groups['@constant']              = { link = "TSConstant" }
    hl_groups['@constant.builtin']      = { link = "TSConstBuiltin" }
    hl_groups['@constant.macro']        = { link = "TSConstMacro" }
    hl_groups['@constructor']           = { link = "TSConstructor" }
    hl_groups['@exception']             = { link = "TSException" }
    hl_groups['@field']                 = { link = "TSField" }
    hl_groups['@float']                 = { link = "TSFloat" }
    hl_groups['@function']              = { link = "TSFunction" }
    hl_groups['@function.call']         = { link = "TSFunction" }
    hl_groups['@function.builtin']      = { link = "TSFuncBuiltin" }
    hl_groups['@function.macro']        = { link = "TSFuncMacro" }
    hl_groups['@include']               = { link = "TSInclude" }
    hl_groups['@keyword']               = { link = "TSKeyword" }
    hl_groups['@keyword.function']      = { link = "TSKeywordFunction" }
    hl_groups['@keyword.operator']      = { link = "TSKeywordOperator" }
    hl_groups['@label']                 = { link = "TSLabel" }
    hl_groups['@method']                = { link = "TSMethod" }
    hl_groups['@method.call']           = { link = "@function.call" }
    hl_groups['@namespace']             = { link = "TSNamespace" }
    hl_groups['@none']                  = { link = "TSNone" }
    hl_groups['@number']                = { link = "TSNumber" }
    hl_groups['@operator']              = { link = "TSOperator" }
    hl_groups['@parameter']             = { link = "TSParameter" }
    hl_groups['@parameter.reference']   = { link = "TSParameterReference" }
    hl_groups['@property']              = { link = "TSProperty" }
    hl_groups['@punctuation.bracket']   = { link = "TSPunctBracket" }
    hl_groups['@punctuation.delimiter'] = { link = "TSPunctDelimiter" }
    hl_groups['@punctuation.special']   = { link = "TSPunctSpecial" }
    hl_groups['@repeat']                = { link = "TSRepeat" }
    hl_groups['@storageclass']          = { link = "TSStorageClass" }
    hl_groups['@string']                = { link = "TSString" }
    hl_groups['@string.escape']         = { link = "TSStringEscape" }
    hl_groups['@string.regex']          = { link = "TSStringRegex" }
    hl_groups['@symbol']                = { link = "TSSymbol" }
    hl_groups['@tag']                   = { link = "TSTag" }
    hl_groups['@tag.delimiter']         = { link = "TSTagDelimiter" }
    hl_groups['@text']                  = { link = "TSText" }
    hl_groups['@strike']                = { link = "TSStrike" }
    hl_groups['@math']                  = { link = "TSMath" }
    hl_groups['@type']                  = { link = "TSType" }
    hl_groups['@type.builtin']          = { link = "TSTypeBuiltin" }
    hl_groups['@type.qualifier']        = { link = "TSKeyword" }
    hl_groups['@uri']                   = { link = "TSURI" }
    hl_groups['@variable']              = { link = "TSVariable" }
    hl_groups['@variable.builtin']      = { link = "TSVariableBuiltin" }

    --[[ local captures = require 'adachi.hl.treesitter'.captures(theme)
    for l_name, higroups in pairs(captures) do
      for capture_name, higroup in pairs(higroups) do
        hlGroups[capture_name .. '.' .. l_name] = higroup
      end
    end ]]
  end

  -- lsp
  hl_groups['@lsp.type.namespace'] = { link = "TSNamespace" }

  -- Telescope
  hl_groups['TelescopeMatching']       = { link = "Search" }
  hl_groups['TelescopeSelection']      = { link = "Identifier" }
  hl_groups['TelescopePromptPrefix']   = { link = "Constant" }
  hl_groups['TelescopeNormal']         = { theme.bg4 }
  hl_groups['TelescopeSelectionCaret'] = { link = "TelescopeNormal" }

  hl_groups['TelescopeBorder']        = { theme.bg2 }
  hl_groups['TelescopePromptBorder']  = { link = "TelescopeBorder" }
  hl_groups['TelescopeResultsBorder'] = { link = "TelescopeBorder" }
  hl_groups['TelescopePreviewBorder'] = { link = "TelescopeBorder" }

  if config.override_terminal then
    require 'aki.hl.terminal'(theme, theme.colors)
  end

  return hl_groups
end

return M
