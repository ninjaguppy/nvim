require("kernels").setup()

vim.api.nvim_create_user_command("ExportNote", function()
    require("kernels.export").export_current_note()
end, {})


vim.api.nvim_create_user_command("KernelsDailyNote", function()
    require("kernels.daily-notes").open_and_archive()
end, {})


---- Configure snacks-bibtex
--require("snacks-bibtex").setup({
--    -- Path to your master bib file
--    template = "\\cite{%s}",
--})
--
---- Create a wrapper function for the picker with your custom logic
--local function bibtex_picker_with_copy()
--    local local_bib = vim.fn.getcwd() .. "/refs.bib"
--
--    require("snacks-bibtex").bibtex({
--        actions = {
--            confirm = function(picker, item)
--                picker:close()
--
--                -- 1. Extract the Citation Key and Full Entry
--                -- snacks-bibtex items contain the raw bibtex entry in 'item.raw'
--                local cite_key = item.citekey
--                local full_entry = item.raw
--
--                -- 2. Check and Append to local refs.bib
--                if full_entry then
--                    local local_content = ""
--                    if vim.fn.filereadable(local_bib) == 1 then
--                        local_content = table.concat(vim.fn.readfile(local_bib), "\n")
--                    end
--
--                    if not local_content:find(cite_key, 1, true) then
--                        local f = io.open(local_bib, "a")
--                        if f then
--                            f:write("\n" .. full_entry .. "\n")
--                            f:close()
--                            vim.notify("Copied " .. cite_key .. " to local refs.bib")
--                        end
--                    end
--                end
--
--                -- 3. Insert the citation into the document
--                local citation = string.format("\\cite{%s}", cite_key)
--                vim.api.nvim_put({ citation }, "c", true, true)
--            end,
--        },
--    })
--end
--
---- Map it to your preferred key
--vim.keymap.set("n", "<leader>cb", bibtex_picker_with_copy, { desc = "Search Master Bib & Copy Local" })
