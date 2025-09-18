local M = {
    template = vim.fn.expand("~/math/notes/templates/template.tex"),
    pdf_output_dir = vim.fn.expand("~/math/notes/exports"),
    notes_dir = vim.fn.expand("~/math/notes")
}

function M.setup(opts)
    M.template = opts.template or M.template
    M.pdf_output_dir = opts.pdf_output_dir or M.pdf_output_dir
    M.notes_dir = opts.notes_dir or M.notes_dir
end

return M
