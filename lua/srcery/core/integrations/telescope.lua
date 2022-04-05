local M = {}

function M.get(cp)
    return {
        TelescopeBorder = { fg = cp.magenta },
        TelescopeSelectionCaret = { fg = cp.brightMagenta },
        TelescopeSelection = { fg = cp.white, bg = cp.xgray3, style = "bold" },
        TelescopeMatching = { fg = cp.magenta },
    }
end

return M
