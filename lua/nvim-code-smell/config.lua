local M = {}

M.namespace = vim.api.nvim_create_namespace("NvimCodeSmell")

local defaults = {
  smell_finders = {
    "reek"
  },
  outputs = {
    "buffer",
    "quickfix"
  },
  keymaps = {
    run_diagnostic = "<leader>q", -- run configured smell_finders
    disable = "<leader>Q", -- disable all diagnostic outputs
  }
}

M.options = {}

function M.setup(options)
  M.options = vim.tbl_deep_extend("force", {}, defaults, options or {})
end

return M
