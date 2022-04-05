local M = {}

function M.get(cp)
    local delimiters = cp.white
    local operators = cp.brightMagenta
    local cl = cp.brightRed -- conditionals, loops
    local keywords = cp.red

    local math_logic = cp.magenta
    return {
        -- These groups are for the neovim tree-sitter highlights.
        -- As of writing, tree-sitter support is a WIP, group names may change.
        -- By default, most of these groups link to an appropriate Vim group,
        -- TSError -> Error for example, so you do not have to define these unless
        -- you explicitly want to support Treesitter's improved syntax awareness.
        TSField = { fg = cp.green }, -- For fields.
        TSProperty = { fg = cp.green, style = "italic" }, -- Same as TSField.
        TSInclude = { fg = cp.brightCyan, style = "italic" }, -- For includes: #include in C, use or extern crate in Rust, or require in Lua.
        TSOperator = { fg = operators, style = "bold" }, -- For any operator: +, but also -> and * in cp.
        TSKeywordOperator = { fg = operators, style = "bold" }, -- For new keyword operator
        TSPunctSpecial = { fg = cp.brightMagenta, style = "bold" }, -- For special punctutation that does not fall in the categories before.

        TSFloat = { fg = math_logic, style = "italic" }, -- For floats.
        TSNumber = { fg = math_logic, style = "italic" }, -- For all numbers
        TSBoolean = { fg = math_logic, style = "italic" }, -- For booleans.

        TSConstructor = { fg = cp.orange }, -- For constructor calls and definitions: = { } in Lua, and Java constructors.
        TSConstant = { fg = cp.orange }, -- For constants
        TSConditional = { fg = cl }, -- For keywords related to conditionnals.
        TSRepeat = { fg = cl }, -- For keywords related to loops.
        TSException = { fg = cp.cyan, style = cnf.styles.keywords }, -- For exception related keywords.

        -- builtin
        TSConstBuiltin = { fg = cp.brightMagenta, style = cnf.styles.keywords }, -- For constant that are built in the language: nil in Lua.
        TSFuncBuiltin = { fg = cp.yellow, style = "italic" }, -- For builtin functions: table.insert in Lua.
        TSTypeBuiltin = { fg = cp.brightMagenta, style = "italic" }, -- For builtin types.
        TSVariableBuiltin = { fg = cp.cyan, style = "italic" }, -- Variable names that are defined by the languages, like this or self.

        TSFunction = { fg = cp.yellow, style = cnf.styles.functions }, -- For function (calls and definitions).
        TSFuncMacro = { fg = cp.brightCyan }, -- For macro defined functions (calls and definitions): each macro_rules in Ruscp.
        TSParameter = { fg = cp.cyan, style = "italic" }, -- For parameters of a function.
        TSKeywordFunction = { fg = cp.keywords, style = cnf.styles.keywords }, -- For keywords used to define a function.
        TSKeyword = { fg = keywords, style = cnf.styles.keywords }, -- For keywords that don't fall in previous categories.
        TSKeywordReturn = { fg = cp.red },
        -- TSAnnotation        = { };    -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
        -- TSAttribute         = { };    -- (unstable) TODO: docs
        -- TSCharacter         = { };    -- For characters.
        -- TSComment           = { };    -- For line comments and comment blocks.
        -- TSNote = { fg = cp.xgray2, bg = cp.blue },
        TSWarning = { fg = cp.xgray2, bg = cp.yellow },
        TSDanger = { fg = cp.xgray2, bg = cp.red },
        -- TSConstMacro        = { };    -- For constants that are defined by macros: NULL in cp.
        -- TSError = { fg = cp.red }, -- For syntax/parser errors.
        TSLabel = { fg = cp.magenta }, -- For labels: label: in C and :label: in Lua.
        TSMethod = { fg = cp.orange, style = "italic" }, -- For method calls and definitions.
        TSNamespace = { fg = cp.white, style = "italic" }, -- For identifiers referring to modules and namespaces.
        -- TSNone              = { };    -- TODO: docs
        -- TSParameterReference= { };    -- For references to parameters of a function.
        tomlTSProperty = { fg = cp.blue }, -- Differentiates between string and properties
        TSPunctDelimiter = { fg = delimiters }, -- For delimiters ie: .
        TSPunctBracket = { fg = delimiters }, -- For brackets and parenthesis.
        TSString = { fg = cp.brightGreen }, -- For strings.
        TSStringRegex = { fg = cp.yellow, style = cnf.styles.strings }, -- For regexes.
        -- TSSymbol            = { };    -- For identifiers referring to symbols or atoms.
        TSType = { fg = cp.brightMagenta }, -- For types.
        TSVariable = { fg = cp.white, style = cnf.styles.variables }, -- Any variable name that does not have another highlighcp.
        TSTagAttribute = { fg = cp.magenta, style = "italic" }, -- Tags like html tag names.
        -- TSTag               = { fg = cp.peach }, -- Tags like html tag names.
        -- TSTagDelimiter      = { fg = cp.maroon }, -- Tag delimiter like < > /
        -- TSText              = { fg = cp.white }, -- For strings considerated text in a markup language.
        -- TSEmphasis          = { };    -- For text to be represented with emphasis.
        -- TSUnderline         = { };    -- For text to be represented with an underline.
        -- TSStrike            = { };    -- For strikethrough texcp.
        -- TSTitle             = { };    -- Text that is part of a title.
        -- TSLiteral           = { };    -- Literal texcp.
        -- TSURI               = { };    -- Any URI like a link or email.
        --
        -- Markdown tresitter parser support
        TSURI = { fg = cp.magenta, style = "italic,underline" }, -- urls, links and emails
        TSLiteral = { fg = cp.green, style = "italic" }, -- used for inline code in markdown and for doc in python (""")
        TSTextReference = { fg = cp.cyan, style = "bold" }, -- references
        TSTitle = { fg = cp.magenta, style = "bold" }, -- titles like: # Example
        TSEmphasis = { fg = cp.magenta, style = "italic" }, -- bold
        TSStrong = { fg = cp.magenta, style = "bold" }, -- italic
        TSStringEscape = { fg = cp.green, style = cnf.styles.strings }, -- For escape characters within a string.

        -- bash
        bashTSParameter = { fg = cp.yellow, style = "italic" },
        bashTSVariable = { fg = cp.green, style = "bold" },

        -- java
        javaTSConstant = { fg = cp.brightMagenta },

        -- typescript
        typescriptTSProperty = { fg = cp.brightBlue, style = "italic" }, -- Same as TSField.
    }
end

return M
