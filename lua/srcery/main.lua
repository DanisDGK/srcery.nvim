local M = {}

local utils = require("srcery.utils.util")

local function load()
    local srcery = require("srcery")

    if srcery.before_loading ~= nil then
        srcery.before_loading()
    end

    -- colorscheme gets evaluated from mapper.lua
    local theme = require("srcery.core.mapper").apply()
    utils.load(theme)

    if srcery.after_loading ~= nil then
        srcery.after_loading()
    end
end

local function clear()
    vim.cmd("hi clear")
end

function M.main(option)
    option = option or "load"

    if option == "load" then
        load()
    elseif option == "clear" then
        clear()
    else
        print("srcery: option was not recognized")
    end
end

return M
