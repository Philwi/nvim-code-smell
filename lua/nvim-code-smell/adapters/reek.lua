local REEK_FILE_COMMENT_LINE = 1

local function line_number_from(line)
  return string.match(line, '(%d+)')
end

local function warning_from(line)
  return string.match(line, ':(.*)')
end

local function map(reek_output_lines)
  local reek_output = {}

  for index, line in ipairs(reek_output_lines) do
    if index ~= REEK_FILE_COMMENT_LINE then
      local line_number = line_number_from(line)
      local warning = warning_from(line)

      if line_number == nil or warning == nil then
        print("Fehler bei der Verarbeitung der Zeile: " .. line)
      else
        table.insert(reek_output, {
          line_number = line_number,
          message = warning
        })
      end
    end
  end

  return reek_output
end

return {
  map = map
}
