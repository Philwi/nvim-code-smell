local api = vim.api

local Buffer = {}

local function add_warning_to_buffer(warning_line, warning_msg)
  local bufnr = api.nvim_get_current_buf()
  api.nvim_buf_set_virtual_text(bufnr, -1, warning_line - 1, {{warning_msg, 'WarningMsg'}}, {})
end

function Buffer.add_warning(smells)
  for _, smell in ipairs(smells) do
    add_warning_to_buffer(smell.line_number, smell.message)
  end

  api.nvim_command('redraw')
end

function Buffer.clear()
  local bufnr = api.nvim_get_current_buf()
  api.nvim_buf_clear_namespace(bufnr, -1, 0, -1)
end

return Buffer
