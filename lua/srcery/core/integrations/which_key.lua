local M = {}

function M.get(cp)
    return {
        WhichKey = { fg = cp.brightMagenta },
        WhichKeyGroup = { fg = cp.magenta },
        WhichKeyDesc = { fg = cp.brightMagenta },
        WhichKeySeparator = { fg = cp.xgray3 },
        WhichKeyFloat = { bg = cp.black },
        WhichKeyValue = { fg = cp.xgray5 },
    }
end

return M
