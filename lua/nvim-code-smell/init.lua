local smell_finders = require('nvim-code-smell.smell-finders')
local outputs = require('nvim-code-smell.outputs')
local config = require('nvim-code-smell.config')
local functions = require('nvim-code-smell.functions')

local NvimCodeSmell = functions

local function add_keymaps()
  local api = vim.api
  local opts = { noremap = true, silent = true }

  local keymaps = config.options.keymaps
  local run_diagnostic = keymaps.run_diagnostic
  api.nvim_set_keymap('n', run_diagnostic, ':RunDiagnostic<CR>', opts)
end

function NvimCodeSmell.setup(options)
  config.setup(options)

  add_keymaps()
end

local function clear()
  outputs.clear()
end

function NvimCodeSmell.run_diagnostic()
  clear()

  local smells = smell_finders.run()
  outputs.add_warning(smells)
end

vim.cmd([[command! RunDiagnostic lua require('nvim-code-smell').run_diagnostic()]])
-- FIXME: Doesn't work yet
-- vim.cmd([[command! RunDiagnosticOnSave lua require('nvim-code-smell').run_diagnostic_on_save()]])
-- vim.cmd([[command! RunDiagnosticOnOpen lua require('nvim-code-smell').run_diagnostic_on_open()]])
-- vim.cmd([[command! RunDiagnosticOnOpenAndSave lua require('nvim-code-smell').run_diagnostic_on_open_and_save()]])

return NvimCodeSmell
