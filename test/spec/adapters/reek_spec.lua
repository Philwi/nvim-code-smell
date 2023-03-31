local reek_adapter = require('nvim-code-smell.adapters.reek')

describe("transforming reek output to standard data structure", function()
  before_each(function()
    reek_output_lines = {}
    table.insert(reek_output_lines, "/home/oimelbude/Projects/personal/kook-surf/api/app/actions/spots/index.rb -- 7 warnings:")
    table.insert(reek_output_lines,
      "[39, 40]:DuplicateMethodCall: Spots::Index#fetch_near_spots calls 'input[:contract]' 2 times [https://github.com/troessner/reek/blob/v6.1.3/docs/Duplicate-Method-Call.md]"
    )
  end)

  it('returns correct structure with line number and message', function()
    local expected = {
      {
        line_number = '39',
        message = "DuplicateMethodCall: Spots::Index#fetch_near_spots calls 'input[:contract]' 2 times [https://github.com/troessner/reek/blob/v6.1.3/docs/Duplicate-Method-Call.md]"
      }
    }

    assert.combinators.match(expected, reek_adapter.map(reek_output_lines))
  end)
end)
