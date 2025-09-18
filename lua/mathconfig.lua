require("kernels").setup()

vim.api.nvim_create_user_command("ExportNote", function()
    require("kernels.export").export_current_note()
end, {})
