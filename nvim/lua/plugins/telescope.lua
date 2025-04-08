return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      'nvim-telescope/telescope-fzf-native.nvim'
    },
    config = function()
      local actions = require 'telescope.actions'
      local config = {
        defaults = {
          layout_strategy = "horizontal",
          layout_config = {
            mirror = false,
            prompt_position = "bottom",
            width = 0.9,
            preview_width = 0.6,
          },
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous, -- move to prev result
              ["<C-j>"] = actions.move_selection_next, -- move to next result
              ["<C-q>"] = actions.send_to_qflist + actions.open_qflist, -- send selected to quickfixlist
            }
          }
        }
      }

      local telescope = require 'telescope'
      telescope.setup(config)

      telescope.load_extension("fzf")
      telescope.load_extension("noice")

      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Search [G]it [F]iles" })
      vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
      vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
      vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
      vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
      vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
      vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "[S]earch [B]uffers" })
      vim.keymap.set("n", "<leader>st", builtin.treesitter, { desc = "[S]earch [T]reesitter" })

    end,
}
