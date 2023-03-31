local Utils = {}

function Utils.include(table, value)
  if table == nil then
    return false
  end

  for _, v in pairs(table) do
    if v == value then
      return true
    end
  end
  return false
end

return Utils
