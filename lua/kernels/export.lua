local config = require("kernels.config")


------ HELPERS ------

-- Helper: reads file at path and returns the contents as a string
local function read_file(path)
    local f = assert(io.open(path, "r"))
    local content = f:read("*a")
    f:close()
    return (content)
end

-- Helper: Writes `content` to a file at `path`
local function write_file(path, content)
    local f = assert(io.open(path, "w"))
    f:write(content)
    f:close()
end

------ PRIVATE FUNCTIONS ------

-- Gets contents of currents buffer
local function get_current_buffer_content()
    local buf = vim.api.nvim_get_current_buf()
    local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
    return table.concat(lines, "\n")
end

-- Promts user for title of export
local function ask_export_title(next)
    vim.ui.input({ prompt = "Enter export title: " }, function(input)
        if not input or input == "" then
            vim.notify("Export Cancelled", vim.log.levels.WARN)
            return
        end
        next(input)
    end)
end

-- Builds standalone tex file in the output directory.
-- Returns the path to the temporary tex file
local function build_tex(title, template_path, note_content)
    -- get template
    local template = read_file(template_path)

    -- substitute strings into template
    local tex_document = string.format(template, title, title, note_content)

    local output_tex_path = config.pdf_output_dir .. "/tex/" .. title .. os.date("%y%m%d") .. ".tex"
    write_file(output_tex_path, tex_document)
    return (output_tex_path)
end

-- Generate PDF and clean outputs if successful
local function compile_tex(tex_path, pdf_dir)
    local cmd = {
        "latexmk",
        "--pdf",
        "--interaction=nonstopmode",
        "--output-directory=" .. pdf_dir,
        tex_path
    }

    --run cmd
    vim.fn.jobstart(cmd, {
        stdout_buffered = true,
        stderr_buffered = true,
        on_exit = function(_, code)
            if code == 0 then --if successful
                vim.notify("PDF generated!", vim.log.levels.INFO)

                --cleanup aux files
                local cleanup_cmd = {
                    "latexmk",
                    "-c",
                    "--output-directory=" .. pdf_dir,
                    tex_path
                }
                vim.fn.jobstart(cleanup_cmd, {
                    on_exit = function()
                        vim.notify("Auxiliary files cleaned", vim.log.levels.INFO)
                    end
                })
            else
                vim.notify("latexmk failed with code " .. code, vim.log.levels.ERROR)
            end
        end
    })
end




------ PUBLIC FUNCTIONS ------

local M = {}

-- Assumes that the current buffer is a TeX document *without* a header. This
-- function prompts the user for a title and then creates a pdf with the given
-- title and the content of the current buffer.
function M.export_current_note()
    ask_export_title(function(title)
        local note_content = get_current_buffer_content()
        local tex_path = build_tex(title, config.template, note_content)
        compile_tex(tex_path, config.pdf_output_dir)
    end)
end

return M
