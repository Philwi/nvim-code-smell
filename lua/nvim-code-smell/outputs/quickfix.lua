local Quickfix = {}

function Quickfix.clear()
  vim.fn.setqflist({})
  vim.api.nvim_command("cclose")
end

function Quickfix.add_warning(smells)
  local quickfix_list = {}
  Quickfix.clear()

  local bufnr = vim.api.nvim_get_current_buf()

  for _, smell in ipairs(smells) do
    table.insert(quickfix_list, {
      bufnr = bufnr,
      lnum = smell.line_number,
      col = 1,
      text = smell.message
    })
  end

  if #quickfix_list == 0 then
    table.insert(quickfix_list, {
      bufnr = 1,
      lnum = 1,
      col = 1,
      text = "No smells found"
    })
  end

  vim.fn.setqflist(quickfix_list)
  vim.api.nvim_set_var("nvim_code_smell_quickfix_enabled", true)
  vim.api.nvim_command("copen")
end

function Quickfix.disable()
  local is_enabled = vim.api.nvim_get_var("nvim_code_smell_quickfix_enabled")

  if is_enabled then
    vim.api.nvim_set_var("nvim_code_smell_quickfix_enabled", false)
    Quickfix.clear()
  else
    vim.api.nvim_set_var("nvim_code_smell_quickfix_enabled", true)
  end
end

return Quickfix
