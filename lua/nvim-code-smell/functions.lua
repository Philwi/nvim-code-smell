local NvimCodeSmell = {}

local function execute_after_save()
  vim.cmd([[autocmd BufWritePost <buffer> lua require('nvim-code-smell').run_diagnostic()]])
end

function NvimCodeSmell.run_diagnostic_on_save()
  execute_after_save()
end

local function execute_after_open()
  vim.cmd([[autocmd BufReadPost <buffer> lua require('nvim-code-smell').run_diagnostic()]])
end

function NvimCodeSmell.run_diagnostic_on_open()
  execute_after_open()
end

local function execute_after_open_and_save()
  execute_after_open()
  execute_after_save()
end

function NvimCodeSmell.run_diagnostic_on_open_and_save()
  execute_after_open_and_save()
end

local function remove_autocmd()
  vim.cmd([[autocmd! BufWritePost <buffer>]])
  vim.cmd([[autocmd! BufReadPost <buffer>]])
end

function NvimCodeSmell.turn_off()
  remove_autocmd()
end

return NvimCodeSmell
