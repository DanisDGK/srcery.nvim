local cp = require("srcery.core.color_palette")
local srcery = {}

srcery.normal = {
    a = { bg = cp.green, fg = cp.xgray2, gui = "bold" },
    b = { bg = cp.xgray2, fg = cp.white },
    c = { bg = cp.xgray2, fg = cp.white },
}

srcery.insert = {
    a = { bg = cp.orange, fg = cp.xgray2, gui = "bold" },
}

srcery.command = {
    a = { bg = cp.magenta, fg = cp.xgray2, gui = "bold" },
}

srcery.visual = {
    a = { bg = cp.brightCyan, fg = cp.xgray2, gui = "bold" },
}

srcery.replace = {
    a = { bg = cp.brightBlue, fg = cp.xgray2, gui = "bold" },
}

srcery.terminal = {
    a = { bg = cp.magenta, fg = cp.xgray2, gui = "bold" },
}

srcery.inactive = {
    a = { bg = cp.xgray1, fg = cp.white },
    b = { bg = cp.xgray1, fg = cp.hardBlack, gui = "bold" },
    c = { bg = cp.xgray1, fg = cp.xgray5 },
}

return srcery
