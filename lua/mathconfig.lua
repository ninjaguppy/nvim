require("kernels").setup()

vim.api.nvim_create_user_command("ExportNote", function()
    require("kernels.export").export_current_note()
end, {})


vim.api.nvim_create_user_command("KernelsDailyNote", function()
    require("kernels.daily-notes").open_and_archive()
end, {})
