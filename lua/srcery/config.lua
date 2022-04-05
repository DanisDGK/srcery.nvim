---@class Config
local config = {}

config.options = {
    transparent_background = false,
    term_colors = true,
    styles = {
        comments = "italic",
        functions = "italic",
        keywords = "italic",
        strings = "NONE",
        variables = "NONE",
    },
    integrations = {
        gitgutter = false,
        gitsigns = false,
        indent_blankline = {
            enabled = false,
            colored_indent_levels = false,
        },
        lsp_saga = false,
        lsp_trouble = false,
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = "italic",
                hints = "italic",
                warnings = "italic",
                information = "italic",
            },
            underlines = {
                errors = "underline",
                hints = "underline",
                warnings = "underline",
                information = "underline",
            },
        },
        neogit = false,
        notify = false,
        telescope = false,
        treesitter = true,
        ts_rainbow = false,
        which_key = false,
    },
}

function config.set_options(opts)
    opts = opts or {}
    config.options = vim.tbl_deep_extend("force", config.options, opts)
end

return config
