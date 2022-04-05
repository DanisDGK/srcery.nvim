local color_util = require("srcery.utils.colors")
local color_palette = require("srcery.core.color_palette")

local M = {}

local function get_properties()
    local props = {
        termguicolors = true,
        background = "dark",
    }

    if color_util.assert_brightness(color_palette.black) then
        props["background"] = "light"
    end

    return props
end

local function get_base()
    local cp = color_palette
    cp.none = "NONE"

    return {
        Comment = { fg = cp.xgray5, style = cnf.styles.comments }, -- comments like these
        ColorColumn = { bg = cp.black }, -- used for the columns set with 'colorcolumn'
        Conceal = { fg = cp.xgray1 }, -- placeholder characters substituted for concealed text (see 'conceallevel')
        Cursor = { fg = cp.xgray6, bg = cp.white }, -- character under the cursor
        lCursor = { fg = cp.xgray6, bg = cp.white }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
        CursorIM = { fg = cp.xgray6, bg = cp.white }, -- like Cursor, but used when in IME mode |CursorIM|
        CursorColumn = { bg = cp.xgray1 }, -- Screen-column at the cursor, when 'cursorcolumn' is secp.
        CursorLine = { bg = cp.xgray2 }, -- Screen-line at the cursor, when 'cursorline' is secp.  Low-priority if foreground (ctermfg OR guifg) is not secp.
        Directory = { fg = cp.magenta }, -- directory names (and other special names in listings)
        EndOfBuffer = { fg = cp.black }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
        ErrorMsg = { fg = cp.red, style = "bold,italic" }, -- error messages on the command line
        VertSplit = { fg = cp.white }, -- the column separating vertically split windows
        Folded = { fg = cp.blue, bg = cp.xgray4 }, -- line used for closed folds
        FoldColumn = { bg = cp.xgray6, fg = cp.xgray5 }, -- 'foldcolumn'
        SignColumn = { bg = cnf.transparent_background and cp.none or cp.black, fg = cp.xgray4 }, -- column where |signs| are displayed
        SignColumnSB = { bg = cp.black, fg = cp.xgray4 }, -- column where |signs| are displayed
        Substitute = { bg = cp.xgray2, fg = cp.brightMagenta }, -- |:substitute| replacement text highlighting
        LineNr = { fg = cp.xgray5 }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is secp.
        CursorLineNr = { fg = cp.magenta }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line. highlights the number in numberline.
        MatchParen = { fg = cp.brightOrange, style = "bold" }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
        ModeMsg = { fg = cp.white, style = "bold" }, -- 'showmode' message (e.g., "-- INSERT -- ")
        MsgArea = { fg = cp.white }, -- Area for messages and cmdline
        MsgSeparator = {}, -- Separator for scrolled messages, `msgsep` flag of 'display'
        MoreMsg = { fg = cp.blue }, -- |more-prompt|
        NonText = { fg = cp.xgray5 }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
        Normal = { fg = cp.white, bg = cnf.transparent_background and cp.none or cp.black }, -- normal text
        NormalNC = { fg = cp.white, bg = cnf.transparent_background and cp.none or cp.black }, -- normal text in non-current windows
        NormalSB = { fg = cp.white, bg = cp.black }, -- normal text in non-current windows
        NormalFloat = { fg = cp.white, bg = cp.xgray1 }, -- Normal text in floating windows.
        FloatBorder = { fg = cp.magenta },
        Pmenu = { bg = cp.xgray1, fg = cp.xgray6 }, -- Popup menu: normal item.
        PmenuSel = { fg = cp.black, bg = cp.magenta, style = "bold" }, -- Popup menu: selected item.
        PmenuSbar = { bg = cp.xgray2 }, -- Popup menu: scrollbar.
        PmenuThumb = { bg = cp.xgray3 }, -- Popup menu: Thumb of the scrollbar.
        Question = { fg = cp.magenta }, -- |hit-enter| prompt and yes/no questions
        QuickFixLine = { bg = cp.xgray4, style = "bold" }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
        Search = { bg = cp.xgray4, fg = cp.brightMagenta, style = "bold" }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand oucp.
        IncSearch = { bg = cp.brightMagenta, fg = cp.xgray4 }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
        SpecialKey = { fg = cp.white }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
        SpellBad = { sp = cp.red, style = "undercurl" }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
        SpellCap = { sp = cp.yellow, style = "undercurl" }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
        SpellLocal = { sp = cp.blue, style = "undercurl" }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
        SpellRare = { sp = cp.green, style = "undercurl" }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
        StatusLine = { fg = cp.white, bg = cp.xgray1 }, -- status line of current window
        StatusLineNC = { fg = cp.xgray4, bg = cp.xgray1 }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
        TabLine = { bg = cp.xgray1, fg = cp.white }, -- tab pages line, not active tab page label
        TabLineFill = { bg = cp.black }, -- tab pages line, where there are no labels
        TabLineSel = { fg = cp.magenta, bg = cp.xgray4 }, -- tab pages line, active tab page label
        Title = { fg = cp.magenta, style = "bold" }, -- titles for output from ":set all", ":autocmd" etc.
        Visual = { bg = cp.xgray2, style = "bold" }, -- Visual mode selection
        VisualNOS = { bg = cp.xgray2, style = "bold" }, -- Visual mode selection when vim is "Not Owning the Selection".
        WarningMsg = { fg = cp.yellow }, -- warning messages
        Whitespace = { fg = cp.xgray3 }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
        WildMenu = { fg = cp.white, bg = cp.xgray3 }, -- current match in 'wildmenu' completion
        -- These groups are not listed as default vim groups,
        -- but they are defacto standard group names for syntax highlighting.
        -- Grayed out groups should chain up to their "preferred" group by
        -- default,
        -- Uncomment and edit if you want more specific syntax highlighting.

        -- code itself

        Constant = { fg = cp.orange }, -- (preferred) any constant
        String = { fg = cp.brightGreen, style = cnf.styles.strings }, -- a string constant: "this is a string"
        Character = { fg = cp.brightGreen }, --  a character constant: 'c', '\n'
        Number = { fg = cp.brightMagenta }, --   a number constant: 234, 0xff
        Float = { fg = cp.brightMagenta }, --    a floating point constant: 2.3e10
        Boolean = { fg = cp.orange }, --  a boolean constant: TRUE, false
        Identifier = { fg = cp.green, style = cnf.styles.variables }, -- (preferred) any variable name
        Function = { fg = cp.yellow, style = cnf.styles.functions }, -- function name (also: methods for classes)
        Statement = { fg = cp.magenta }, -- (preferred) any statement
        Conditional = { fg = cp.brightRed }, --  if, then, else, endif, switch, etc.
        Repeat = { fg = cp.red }, --   for, do, while, etc.
        Label = { fg = cp.magenta }, --    case, default, etc.
        Operator = { fg = cp.brightWhite }, -- "sizeof", "+", "*", etc.
        Keyword = { fg = cp.brightRed, style = cnf.styles.keywords }, --  any other keyword
        -- Exception     = { }, --  try, catch, throw

        PreProc = { fg = cp.orange }, -- (preferred) generic Preprocessor
        Include = { fg = cp.brightCyan }, --  preprocessor #include
        -- Define        = { }, --   preprocessor #define
        -- Macro         = { }, --    same as Define
        -- PreCondit     = { }, --  preprocessor #if, #else, #endif, etc.

        StorageClass = { fg = cp.yellow }, -- static, register, volatile, etc.
        Structure = { fg = cp.brightMagenta }, --  struct, union, enum, etc.
        Typedef = { fg = cp.brightMagenta }, --  A typedef
        Special = { fg = cp.brightMagenta }, -- (preferred) any special symbol
        Type = { fg = cp.brightMagenta }, -- (preferred) int, long, char, etc.
        -- SpecialChar   = { }, --  special character in a constant
        -- Tag           = { }, --    you can use CTRL-] on this
        -- Delimiter     = { }, --  character that needs attention
        -- Debug         = { }, --    debugging statements

        Underlined = { style = "underline" }, -- (preferred) text that stands out, HTML links
        Bold = { style = "bold" },
        Italic = { style = "italic" },
        -- ("Ignore", below, may be invisible...)
        -- Ignore = { }, -- (preferred) left blank, hidden  |hl-Ignore|

        Error = { fg = cp.red }, -- (preferred) any erroneous construct
        Todo = { bg = cp.yellow, fg = cp.xgray6, style = "bold" }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
        qfLineNr = { fg = cp.yellow },
        qfFileName = { fg = cp.blue },
        htmlH1 = { fg = cp.brightMagenta, style = "bold" },
        htmlH2 = { fg = cp.blue, style = "bold" },
        -- mkdHeading = { fg = cp.brightOrange, style = "bold" },
        -- mkdCode = { bg = cp.terminal_black, fg = cp.white },
        mkdCodeDelimiter = { bg = cp.xgray6, fg = cp.white },
        mkdCodeStart = { fg = cp.white, style = "bold" },
        mkdCodeEnd = { fg = cp.white, style = "bold" },
        -- mkdLink = { fg = cp.blue, style = "underline" },

        -- debugging
        debugPC = { bg = cp.black }, -- used for highlighting the current line in terminal-debug
        debugBreakpoint = { bg = cp.xgray6, fg = cp.xgray5 }, -- used for breakpoint colors in terminal-debug
        -- illuminate
        illuminatedWord = { bg = cp.xgray1 },
        illuminatedCurWord = { bg = cp.xgray1 },
        -- diff
        diffAdded = { fg = cp.green },
        diffRemoved = { fg = cp.red },
        diffChanged = { fg = cp.yellow },
        diffOldFile = { fg = cp.yellow },
        diffNewFile = { fg = cp.brightOrange },
        diffFile = { fg = cp.blue },
        diffLine = { fg = cp.xgray1 },
        diffIndexLine = { fg = cp.brightMagenta },
        DiffAdd = { fg = cp.green, bg = cp.xgray2 }, -- diff mode: Added line |diff.txt|
        DiffChange = { fg = cp.yellow, bg = cp.xgray2 }, -- diff mode: Changed line |diff.txt|
        DiffDelete = { fg = cp.red, bg = cp.xgray2 }, -- diff mode: Deleted line |diff.txt|
        DiffText = { fg = cp.white, bg = cp.xgray2 }, -- diff mode: Changed text within a changed line |diff.txt|
        -- NeoVim
        healthError = { fg = cp.red },
        healthSuccess = { fg = cp.green },
        healthWarning = { fg = cp.yellow },
        -- misc

        -- glyphs
        GlyphPalette1 = { fg = cp.red },
        GlyphPalette2 = { fg = cp.cyan },
        GlyphPalette3 = { fg = cp.yellow },
        GlyphPalette4 = { fg = cp.blue },
        GlyphPalette6 = { fg = cp.cyan },
        GlyphPalette7 = { fg = cp.white },
        GlyphPalette9 = { fg = cp.red },
    }
end

local function get_integrations()
    local integrations = cnf["integrations"]
    local final_integrations = {}

    for integration in pairs(integrations) do
        local cot = false
        if type(integrations[integration]) == "table" then
            if integrations[integration]["enabled"] == true then
                cot = true
            end
        else
            if integrations[integration] == true then
                cot = true
            end
        end

        if cot then
            final_integrations = vim.tbl_deep_extend(
                "force",
                final_integrations,
                require("srcery.core.integrations." .. integration).get(color_palette)
            )
        end
    end

    final_integrations = vim.tbl_deep_extend(
        "force",
        final_integrations,
        require("srcery.core.remaps").get_hig_remaps() or {}
    )
    return final_integrations
end

local function get_terminal()
    return color_palette
end

function M.apply()
    _G.cnf = require("srcery.config").options

    local theme = {}
    theme.properties = get_properties() -- nvim settings
    theme.base = get_base() -- basic hi groups
    theme.integrations = get_integrations() -- plugins
    theme.terminal = get_terminal() -- terminal colors

    -- uninstantiate to avoid polluting global scope and because it's not needed anymore
    _G.cnf = nil

    return theme
end

return M
