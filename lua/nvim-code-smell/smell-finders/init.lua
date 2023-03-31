local config = require('nvim-code-smell.config')
local utils = require('nvim-code-smell.utils')
local reek = require('nvim-code-smell.smell-finders.reek')
local reek_adapter = require('nvim-code-smell.adapters.reek')

local function adapt_reek_output()
  local smells = {}

  if utils.include(config.options.smell_finders, 'reek') then
    local reek_output_lines = reek.run()
    smells = reek_adapter.map(reek_output_lines)
  end

  return smells
end

return {
  run = adapt_reek_output
}
