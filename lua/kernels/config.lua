local M = {
    template = vim.fn.expand("~/math/notes/templates/template.tex"),
    pdf_output_dir = vim.fn.expand("~/math/notes/exports")
}

function M.setup(opts)
    M.template = opts.template or M.template
    M.pdf_output_dir = opts.pdf_output_dir or M.pdf_output_dir
end

return M
