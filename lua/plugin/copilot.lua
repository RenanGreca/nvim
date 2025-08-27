return {
  'zbirenbaum/copilot.lua',
  dependencies = {
    'zbirenbaum/copilot-cmp',
    config = function()
      require('copilot_cmp').setup()
    end
  },
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require('copilot').setup({
      suggestion = { enabled = false },
      panel = { enabled = false },
    })
  end
}
--
-- return {
--   "github/copilot.vim",
--   event = "InsertEnter",
--   dependencies = {
--     'zbirenbaum/copilot-cmp',
--     config = function()
--       require('copilot_cmp').setup()
--     end
--   },
-- }
