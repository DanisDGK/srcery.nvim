local M = {}

function M.get(cp)
    local hi = {
        IndentBlanklineChar = { fg = cp.xgray2 },
        IndentBlanklineContextChar = { fg = cp.white },
    }

    if cnf.integrations.indent_blankline.colored_indent_levels then
        hi["IndentBlanklineIndent6"] = { blend = "nocombine", fg = cp.cyan }
        hi["IndentBlanklineIndent5"] = { blend = "nocombine", fg = cp.blue }
        hi["IndentBlanklineIndent4"] = { blend = "nocombine", fg = cp.green }
        hi["IndentBlanklineIndent3"] = { blend = "nocombine", fg = cp.yellow }
        hi["IndentBlanklineIndent2"] = { blend = "nocombine", fg = cp.magenta }
        hi["IndentBlanklineIndent1"] = { blend = "nocombine", fg = cp.red }
    end

    return hi
end

return M
