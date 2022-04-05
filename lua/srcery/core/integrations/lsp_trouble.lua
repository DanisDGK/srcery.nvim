local M = {}

function M.get(cp)
    return {
        LspTroubleText = { fg = cp.green },
        LspTroubleCount = { fg = cp.brightMagenta, bg = cp.xgray4 },
        LspTroubleNormal = { fg = cp.white, bg = cp.black },
    }
end

return M
