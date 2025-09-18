local M = {}

function M.setup(opts)
    -- load defaults or apply user config
    require("kernels.config").setup(opts or {})
end

return M
