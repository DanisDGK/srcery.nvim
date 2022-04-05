local M = {}

function M.get(cp)
    local transparent_background = require("srcery.config").options.transparent_background
    local bg_highlight = transparent_background and "NONE" or cp.black
    return {
        rainbowcol1 = { bg = bg_highlight, fg = cp.red },
        rainbowcol2 = { bg = bg_highlight, fg = cp.magenta },
        rainbowcol3 = { bg = bg_highlight, fg = cp.orange },
        rainbowcol4 = { bg = bg_highlight, fg = cp.yellow },
        rainbowcol5 = { bg = bg_highlight, fg = cp.green },
        rainbowcol6 = { bg = bg_highlight, fg = cp.blue },
        rainbowcol7 = { bg = bg_highlight, fg = cp.cyan },
    }
end

return M
