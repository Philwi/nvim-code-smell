local smell_finders = require('nvim-code-smell.smell-finders')

describe("no ruby file is open", function()
   it('returns empty hash', function()
      assert.combinators.match({}, smell_finders.run())
   end)
end)

-- TODO: figure out how to test this
-- describe("ruby file is open", function()
--   before_each(function()
--   end)
--
--    it('returns hash with smell', function()
--       assert.combinators.match({ "smell" }, smell_finders.run())
--    end)
-- end)
