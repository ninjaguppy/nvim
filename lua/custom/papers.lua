local snacks = require("snacks")
local yaml = require("yaml_nvim")

local venv_python = vim.fn.expand("~/venvs/mathnotes/bin/python")
local index_file = vim.fn.expand("~/math/notes/paper_notes/paper_index.tsv")
local index_script = vim.fn.expand("~/math/scripts/createPaperDirectory.py")

local M = {}

M.create_index = function()
    --local paper_index = {}
    --yaml.
end

M.search_papers = function()
    -- Run the Python index builder
    vim.fn.jobstart({ venv_python, index_script }, {
        on_exit = function()
            -- After index builds, run fzf
            --
            snacks.picker.pick({
                source = index_file,
                prompt = "Search Papers> ",
                with_nth = "1",
                preview = function(item)
                    local fields = vim.split(item, "\t")
                    local notes_path = fields[#fields]
                    if vim.fn.filereadable(notes_path) == 1 then
                        return vim.fn.systemlist("head -n 40 " .. vim.fn.shellescape(notes_path))
                    else
                        return { "No notes yet." }
                    end
                end,
                actions = {
                    ["default"] = function(selected)
                        if not selected or #selected == 0 then return end
                        local fields = vim.split(selected[1], "\t")
                        local pdf = fields[#fields - 1]
                        local notes = fields[#fields]
                        vim.cmd("edit " .. notes)
                        vim.fn.jobstart({ "open", pdf })
                    end,
                },
            })
        end
    })
end

return M
