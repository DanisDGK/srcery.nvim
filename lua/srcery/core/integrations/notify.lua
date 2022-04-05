local M = {}

function M.get(cp)
    return {
        NotifyERRORBorder = { fg = cp.red },
        NotifyERRORIcon = { fg = cp.red },
        NotifyERRORTitle = { fg = cp.red, style = "italic" },
        NotifyWARNBorder = { fg = cp.yellow },
        NotifyWARNIcon = { fg = cp.yellow },
        NotifyWARNTitle = { fg = cp.yellow, style = "italic" },
        NotifyINFOBorder = { fg = cp.blue },
        NotifyINFOIcon = { fg = cp.blue },
        NotifyINFOTitle = { fg = cp.blue, style = "italic" },
        NotifyDEBUGBorder = { fg = cp.brightOrange },
        NotifyDEBUGIcon = { fg = cp.brightOrange },
        NotifyDEBUGTitle = { fg = cp.brightOrange, style = "italic" },
        NotifyTRACEBorder = { fg = cp.white },
        NotifyTRACEIcon = { fg = cp.white },
        NotifyTRACETitle = { fg = cp.white, style = "italic" },
    }
end

return M
