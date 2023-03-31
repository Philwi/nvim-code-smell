local api = vim.api

local function add_warning_to_buffer(warning_line, warning_msg)
  local bufnr = api.nvim_get_current_buf()
  api.nvim_buf_set_virtual_text(bufnr, -1, warning_line - 1, {{warning_msg, 'WarningMsg'}}, {})
end

return {
  add_warning = add_warning_to_buffer
}
