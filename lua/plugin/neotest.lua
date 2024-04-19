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
  wk.register({
    ["t"] = {
      name = " 󰂓 Neotest",
      a = { "<cmd>:Neotest attach<cr>", " 󱘖 Attach"},
      r = { "<cmd>:NeotestPlaywrightRefresh<cr>", " 󰴂 Playwright Refresh"},
      t = { "<cmd>:Neotest run<cr>", "  Run"},
      q = { "<cmd>:Neotest stop<cr>", "  Stop"},
      s = { "<cmd>:Neotest summary<cr>", " 󰙅 Summary"},
      o = { "<cmd>:Neotest output<cr>", " 󰆍 Output pop-up"},
      O = { "<cmd>:Neotest output-panel<cr>", " 󱂩 Output panel"},
      j = { "<cmd>:Neotest jump prev<cr>", " 󰞕 Previous test"},
      k = { "<cmd>:Neotest jump next<cr>", " 󰞒 Next test"}
    }
  }, { prefix = "<leader>" })

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
