local config = require('nvim-code-smell.config')
local utils = require('nvim-code-smell.utils')
local buffer = require('nvim-code-smell.outputs.buffer')
local quickfix = require('nvim-code-smell.outputs.quickfix')

local Outputs = {}

function Outputs.add_warning(smells)
  if utils.include(config.options.outputs, 'buffer') then
    buffer.add_warning(smells)
  end

  if utils.include(config.options.outputs, 'quickfix') then
    quickfix.add_warning(smells)
  end
end

function Outputs.clear()
  if utils.include(config.options.outputs, 'buffer') then
    buffer.clear()
  end

  if utils.include(config.options.outputs, 'quickfix') then
    quickfix.clear()
  end
end

return Outputs
