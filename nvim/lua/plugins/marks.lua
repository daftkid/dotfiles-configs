return {
  "chentoast/marks.nvim",
  event = "VeryLazy",
  config = function()
    local p = require 'marks'
    local config = {
      builtin_marks = { ".", "<", ">", "^", "'" },
    }

    p.setup(config)
  end,
}
