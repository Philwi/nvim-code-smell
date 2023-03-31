local api = vim.api
local Reek = {}

local function is_ruby_file(filename)
  local extension = vim.fn.fnamemodify(filename, ':e')
  return extension == 'rb'
end

local function run_reek()
  local bufnr = api.nvim_get_current_buf()
  local filename = api.nvim_buf_get_name(bufnr)

  if not is_ruby_file(filename) then
    print("Datei ist keine Ruby-Datei")
    return table
  end

  print("Führe Reek für Datei " .. filename .. " aus")
  local reek_output = vim.fn.system('reek ' .. filename)
  local lines = vim.split(reek_output, '\n')

  local reek_output_lines = {}
  for _, line in ipairs(lines) do
    if line ~= '' then
      table.insert(reek_output_lines, line)
    end
  end

  return reek_output_lines
end

local function reek_installed()
  local reek_output = vim.fn.system('reek --version')

  if reek_output == '' then
    return false
  end

  return true
end

function Reek.run()
  if not reek_installed() then
    print('Reek ist nicht installiert. Bitte installieren Sie es mit "gem install reek"')
    return table
  end

  return run_reek()
end

return Reek

