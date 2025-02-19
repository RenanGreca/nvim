local function config()
  require('telescope').setup {
    defaults = {
      layout_strategy = 'vertical',
      hidden = true,
      mappings = {
        i = {
          ['<C-u>'] = false,
          ['<C-d>'] = false,
        },
      },
    },
  }
  local previewers = require "telescope.previewers"
  local sorters = require "telescope.sorters"
  local builtin = require "telescope.builtin"

  -- vim.keymap.set('n', '<Leader>f', builtin.find_files, opts('Telescope', 'Find files'))
  -- local keymaps = {
  --   ["f"] = {
  --       builtin.find_files,
  --       Hint(require('icons').ui.FindFile, "Find File"),
  --     },
  -- }
  local keymaps = {
    -- { "<leader>f", builtin.find_files, desc = "Find File", icon = "󰈞" },
    { "<leader>f", "<cmd>Telescope find_files hidden=true<cr>", desc = "Find File", icon = "󰈞" },
  }

  local wk = require('which-key')
  wk.add(keymaps)
  -- wk.register(keymaps, {prefix = "<leader>" })

end


return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- probably only works with make, maybe disable in windows
        -- 'nvim-telescope/telescope-fzf-native.nvim',
    },
    config = config
}
