local function config()
  require('neotest').setup({
    adapters = {
      require('neotest-playwright').adapter({
        options = {
          persist_project_selection = true,
          enable_dynamic_test_discovery = true,
        }
      }),
    },
  })

  local wk = require('which-key')
  -- wk.register({
  --   ["t"] = {
  --     name = " 󰂓 Neotest",
  --     a = { "<cmd>:Neotest attach<cr>", " 󱘖 Attach"},
  --     r = { "<cmd>:NeotestPlaywrightRefresh<cr>", " 󰴂 Playwright Refresh"},
  --     t = { "<cmd>:Neotest run<cr>", "  Run"},
  --     q = { "<cmd>:Neotest stop<cr>", "  Stop"},
  --     s = { "<cmd>:Neotest summary<cr>", " 󰙅 Summary"},
  --     o = { "<cmd>:Neotest output<cr>", " 󰆍 Output pop-up"},
  --     O = { "<cmd>:Neotest output-panel<cr>", " 󱂩 Output panel"},
  --     j = { "<cmd>:Neotest jump prev<cr>", " 󰞕 Previous test"},
  --     k = { "<cmd>:Neotest jump next<cr>", " 󰞒 Next test"}
  --   }
  -- }, { prefix = "<leader>" })
  local keymaps = {
    { "<leader>t", group = " 󰂓 Neotest" },
    { "<leader>tO", "<cmd>:Neotest output-panel<cr>", desc = " 󱂩 Output panel" },
    { "<leader>ta", "<cmd>:Neotest attach<cr>", desc = " 󱘖 Attach" },
    { "<leader>tj", "<cmd>:Neotest jump prev<cr>", desc = " 󰞕 Previous test" },
    { "<leader>tk", "<cmd>:Neotest jump next<cr>", desc = " 󰞒 Next test" },
    { "<leader>to", "<cmd>:Neotest output<cr>", desc = " 󰆍 Output pop-up" },
    { "<leader>tq", "<cmd>:Neotest stop<cr>", desc = "  Stop" },
    { "<leader>tr", "<cmd>:NeotestPlaywrightRefresh<cr>", desc = " 󰴂 Playwright Refresh" },
    { "<leader>ts", "<cmd>:Neotest summary<cr>", desc = " 󰙅 Summary" },
    { "<leader>tt", "<cmd>:Neotest run<cr>", desc = "  Run" },
  }
  wk.add(keymaps)

end


return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "thenbe/neotest-playwright",
    "nvim-neotest/nvim-nio",
  },
  config = config,
}
