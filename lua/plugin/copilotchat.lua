return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      -- See Configuration section for options
    },
    config = function()
      local keymaps = {
          { "<leader>p", group = "Copilot Chat", icon = "" },
          { "<leader>pt", "<cmd>CopilotChatToggle<cr>", desc = "Toggle Copilot Chat" },
          { "<leader>pp", "<cmd>CopilotChatPrompts<cr>", desc = "See prompt templates" },
          { "<leader>pm", "<cmd>CopilotChatModels<cr>", desc = "See available models" },
      }
      local wk = require('which-key')
      wk.add(keymaps)
    end,
  },
}
