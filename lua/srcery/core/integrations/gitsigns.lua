local M = {}

function M.get(cp)
    return {
        GitSignsAdd = { fg = cp.green, bg = cnf.transparent_background and cp.none or cp.black }, -- diff mode: Added line |diff.txt|
        GitSignsChange = { fg = cp.yellow, bg = cnf.transparent_background and cp.none or cp.black }, -- diff mode: Changed line |diff.txt|
        GitSignsDelete = { fg = cp.red, bg = cnf.transparent_background and cp.none or cp.black }, -- diff mode: Deleted line |diff.txt|
    }
end

return M
