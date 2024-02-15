---@param theme aki.types.theme
---@param config aki.types.config
return function(theme, config)
  return {
    ['@annotation']            = { theme.syntax.annotation },
    ['@attribute']             = { theme.purple },
    ['@boolean']               = { link = 'Boolean' },
    ['@character']             = { link = 'Character' },
    ['@comment']               = { theme.comment, italic = config.style.comment.italic },
    ['@conditional']           = { link = 'Conditional' },
    ['@constant']              = { theme.syntax.constant },
    ['@constant.builtin']      = { link = '@constant' },
    ['@constant.macro']        = { link = '@constant' },
    ['@constructor']           = { theme.green },
    ['@exception']             = { link = 'Exception' },
    ['@field']                 = { theme.syntax.object },
    ['@float']                 = { link = 'Float' },
    ['@function']              = { theme.syntax.call },
    ['@function.call']         = { link = '@function' },
    ['@function.builtin']      = { link = '@constant' },
    ['@function.macro']        = { theme.syntax.macro },
    ['@include']               = { link = 'Include' },
    ['@keyword']               = { theme.syntax.keyword, italic = config.style.keyword.italic },
    ['@keyword.function']      = { link = '@keyword' },
    ['@keyword.operator']      = { theme.fg2 },
    ['@label']                 = { link = 'Label' },
    ['@method']                = { theme.syntax.context },
    ['@method.call']           = { link = '@function.call' },
    ['@namespace']             = { link = '@constant' },
    ['@none']                  = { theme.fg },
    ['@number']                = { link = 'Number' },
    ['@operator']              = { theme.syntax.context },
    ['@parameter']             = { link = '@variable' },
    ['@parameter.reference']   = { link = '@parameter' },
    ['@property']              = { theme.syntax.object },
    ['@punctuation.bracket']   = { theme.syntax.context },
    ['@punctuation.delimiter'] = { theme.syntax.context },
    ['@punctuation.special']   = { theme.syntax.context },
    ['@repeat']                = { link = 'Repeat' },
    ['@storageclass']          = { link = 'StorageClass' },
    ['@string']                = { theme.syntax.string },
    ['@string.escape']         = { theme.yellow },
    ['@string.regex']          = { link = '@string.escape' },
    ['@symbol']                = { theme.fg1 },
    ['@strike']                = { theme.fg2 },
    ['@math']                  = { theme.blue },
    ['@type']                  = { theme.syntax.type, italic = config.style.types.italic },
    ['@type.builtin']          = { link = '@type' },
    ['@type.qualifier']        = { link = '@keyword' },
    ['@uri']                   = { theme.blue },
    ['@variable']              = { theme.syntax.object },
    ['@variable.builtin']      = { link = '@constant' },

    Identifier                 = { link = '@variable' },
    Type                       = { link = '@type' },
    Function                   = { link = '@function' },
    Structure                  = { theme.syntax.type },
    Keyword                    = { link = '@keyword' },
    Statement                  = { link = '@keyword' },
    Constant                   = { link = '@constant' },
    String                     = { link = '@string' },

    Comment                    = { link = '@comment' },
    Special                    = { link = '@punctuation.special' },
    Delimiter                  = { link = '@punctuation.delimiter' },
    MatchParen                 = { theme.orange },
    Operator                   = { link = '@operator' },

    Todo                       = { link = '@comment.todo' },

    PreProc                    = { link = '@annotation' },
    Include                    = { link = '@annotation' },

    Conceal                    = { theme.bg3 },

    -- lsp
    ['@lsp.type.comment']      = { link = '@comment' },
    ['@lsp.type.namespace']    = { link = '@namespace' },
    ['@lsp.type.keyword']      = { link = '@keyword' },

    -- text
    ['@comment.todo']          = { theme.aqua },
    ['@comment.note']          = { theme.blue },
    ['@comment.fix']           = { theme.diagnostic.warn },
    ['@comment.warning']       = { theme.diagnostic.warn },
    ['@comment.error']         = { theme.diagnostic.error },

    ['@nontext']               = { link = 'NonText' },
    ['@text']                  = { theme.fg1 },
    ['@text.emphasis']         = { theme.orange, italic = true },
    ['@markup.strong']         = { theme.orange, bold = true, },
    ['@markup.italic']         = { theme.orange, italic = true, },
    ['@markup.heading']        = { link = '@text.title' },            -- headings, titles (including markers)
    ['@markup.quote']          = { link = '@comment' },               -- block quotes
    ['@markup.math']           = { link = '@markup.quote' },          -- math environments (e.g. `$ ... $` in LaTeX)
    ['@markup.environment']    = { link = '@markup.quote' },          -- environments (e.g. in LaTeX)
    ['@markup.link']           = { link = '@constant' },              -- text references, footnotes, citations, etc.
    ['@markup.link.label']     = { link = '@markup.italic' },         -- link, reference descriptions
    ['@markup.link.url']       = { link = '@nontext' },               -- URL-style links
    ['@markup.raw']            = { link = '@comment' },               -- literal or verbatim text (e.g. inline code)
    ['@markup.raw.block']      = { link = '@comment' },               -- literal or verbatim text as a stand-alone block
    ['@markup.list']           = { link = '@delimiter' },             -- list markers
    ['@markup.list.checked']   = { link = '@string' },                -- checked todo-style list markers
    ['@markup.list.unchecked'] = { link = '@punctuation.delimiter' }, -- unchecked todo-style list markers
    ['@tag']                   = { link = '@punctuation.delimiter' }, -- XML-style tag names (e.g. in XML, HTML, etc.)
    ['@tag.attribute']         = { link = '@attribute' },             -- XML-style tag attributes
    ['@tag.delimiter']         = { link = '@punctuation.delimiter' }, -- XML-style tag delimiters

    ['@text.title.1']          = { theme.purple },
    ['@text.title.2']          = { theme.red },
    ['@text.title.3']          = { theme.green },
    ['@text.title.4']          = { link = '@text.title.1' },
    ['@text.title.5']          = { link = '@text.title.2' },
    ['@text.title.6']          = { link = '@text.title.3' },
    ['@markup.heading.1']      = { link = '@text.title.1' },
    ['@markup.heading.2']      = { link = '@text.title.2' },
    ['@markup.heading.3']      = { link = '@text.title.3' },
    ['@markup.heading.4']      = { link = '@text.title.4' },
    ['@markup.heading.5']      = { link = '@text.title.5' },
    ['@markup.heading.6']      = { link = '@text.title.6' },

    ['@string.special.path']   = { link = '@string.special' }, -- filenames
    ['@string.special.url']    = { link = '@string.special' }, -- URIs (e.g. hyperlinks)

    ['@diff.add']    = { theme.diff.add },
    ['@diff.delete'] = { theme.diff.delete },
    ['@diff.change'] = { theme.diff.change },
    ['@diff.plus']   = { link = "@diff.add" },
    ['@diff.minus']  = { link = "@diff.delete" },
    ['@diff.delta']  = { link = "@diff.change" },
  }
end
