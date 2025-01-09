local icons = require("icons")

return {
  "folke/trouble.nvim",
  -- cmd = { "Trouble" },
  dependencies = {
    "folke/which-key.nvim",
  },
  config = function()
    require("trouble").setup()

    local keymaps = {
      { "<leader>x", group = "Trouble", icon = "󱡅" },
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics toggle",
        icon = icons.diagnostics.Warning,
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Diagnostics toggle for current buffer",
        icon = icons.diagnostics.Error,
      },
      {
        "<leader>xs",
        "<cmd>Trouble symbols focus=false<cr>",
        desc = "Symbols",
        icon = icons.diagnostics.Hint,
      },
      {
        "<leader>xl",
        "<cmd>Trouble lsp toggle focus=false<cr>",
        desc = "LSP definitions",
        icon = icons.diagnostics.Information,
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location list",
        icon = icons.diagnostics.Information,
      },
      {
        "<leader>xq",
        "<cmd>Trouble quickfix<cr>",
        desc = "Quickfix",
        icon = icons.diagnostics.Question,
      },
    }

    local wk = require("which-key")
    wk.add(keymaps)
  end,
}
