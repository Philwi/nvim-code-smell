-- Laden von Neovim API
local api = vim.api
local smell_finders = require('nvim-code-smell.smell-finders')
local outputs = require('nvim-code-smell.outputs')

-- Funktion, um die Auswertung auszuführen und die Ergebnisse anzuzeigen
local function run_diagnostic()
  local reek_output_lines = smell_finders.run()

  for _, line in ipairs(reek_output_lines) do
    local line_number = string.match(line, '(%d+)')
    local warning = string.match(line, '(.*)')

    if line_number == nil or warning == nil then
      print("Fehler bei der Verarbeitung der Zeile: " .. line)
    else
      outputs.add_warning(line_number, warning)
    end
  end

  api.nvim_command('redraw')
end


-- Kommando, um die Diagnose auszuführen
vim.cmd([[command! RunDiagnostic lua require('nvim-code-smell').run_diagnostic()]])

-- Rückgabe der Funktion, um sie in anderen Modulen verwenden zu können
return {
  run_diagnostic = run_diagnostic
}
