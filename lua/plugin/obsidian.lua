return {
  "epwalsh/obsidian.nvim",
  -- version = "3.6.1",
  lazy = true,
  init = function()
    -- local leader = lvim.builtin.which_key
    local wk = require('which-key')
    wk.register({
      m = {
        name = " 󰍔 Markdown",
        h = {
          -- Toggle check-boxes.
          function()
            return require("obsidian").util.toggle_checkbox()
          end,
          "Toggle checkboxes"
        },
      },
    }, { prefix = "<leader>" })
    -- leader.vmappings["m"] = leader.mappings["m"]
  end,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReeadPre /Users/renangreca/Documents/repos/personal/Obsidian/**.md",
  --   "BufNewFile /Users/renangreca/Documents/repos/personal/Obsidian/**.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Documents/repos/personal/Obsidian"
      },
    },
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },
    mappings = {
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },

    },
  }
}
