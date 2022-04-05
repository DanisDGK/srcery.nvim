local M = {}

function M.get(cp)
    return {
        NeogitBranch = { fg = cp.brightMagenta },
        NeogitRemote = { fg = cp.brightMagenta },
        NeogitHunkHeader = { bg = cp.blue, fg = cp.white },
        NeogitHunkHeaderHighlight = { bg = cp.xgray2, fg = cp.blue },
        NeogitDiffContextHighlight = { bg = cp.xgray1, fg = cp.xgray6 },
        NeogitDiffDeleteHighlight = { bg = cp.xgray1, fg = cp.red },
        NeogitDiffAddHighlight = { bg = cp.xgray1, fg = cp.green },
    }
end

return M
