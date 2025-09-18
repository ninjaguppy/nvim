local config = require("kernels.config")

local M = {}

-- Create and open today's daily note at YYYY-MM/YYY-MM-DD.tex
function M.open_daily_note()
    local year  = os.date("%Y")
    local month = os.date("%m")
    local ymd   = os.date("%Y-%m-%d")
    local ym    = os.date("%Y-%m")

    local dir   = config.notes_dir .. "/" .. ym
    local path  = dir .. "/" .. ymd .. ".tex"

    vim.fn.mkdir(dir, "p")
    vim.cmd.edit(path)
end

-- Move notes from past months from YYYY-MM/YYYY-MM-DD.tex ->
-- YYYY/MM/YYYY-MM-DD.tex
function M.archive_past_months()
    local base = vim.fn.expand("~/math/notes")

    -- Current year-month
    local current = os.date("%Y-%m")

    -- Find all YYYY-MM dirs
    local dirs = vim.fn.glob(base .. "/[0-9][0-9][0-9][0-9]-[0-9][0-9]", 0, 1)
    for _, d in ipairs(dirs) do
        local name = vim.fn.fnamemodify(d, ":t") -- e.g. 2025-08
        if name < current then
            local y, m = name:match("(%d%d%d%d)%-(%d%d)")
            local dst_dir = base .. "/" .. y .. "/" .. m
            vim.fn.mkdir(dst_dir, "p")

            -- Move all .tex files
            local files = vim.fn.glob(d .. "/*.tex", 0, 1)
            for _, f in ipairs(files) do
                local fname = vim.fn.fnamemodify(f, ":t")
                local newpath = dst_dir .. "/" .. fname
                vim.fn.rename(f, newpath)
            end

            -- Remove old empty dir
            vim.fn.delete(d, "d")
            print("Archived " .. name .. " → " .. dst_dir)
        end
    end
end

function M.open_and_archive()
    M.archive_past_months()
    M.open_daily_note()
end

return M
