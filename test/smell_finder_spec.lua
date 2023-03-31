local smell_finders = require('nvim-code-smell.smell-finders')

describe("getting some return values", function()
   it('works!', function()
      assert.combinators.match("Hello Gabo", smell_finders.run())
   end)
end)
