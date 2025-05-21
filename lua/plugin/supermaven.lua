-- return {
--   "supermaven-inc/supermaven-nvim",
--   config = function()
--     require("supermaven-nvim").setup({
--       disable_inline_completion = true,
--     })
--   end,
-- }, {
--   "saghen/blink.cmp",
--   optional = true,
--   dependencies = { "supermaven-nvim", "saghen/blink.compat" },
--   opts = {
--     sources = {
--       completion = {
--         enabled_providers = { "supermaven" },
--       },
--       compat = { "supermaven" },
--       providers = {
--         supermaven = {
--           name = "supermaven",
--           module = "blink.compat.source",
--           kind = "Supermaven",
--           score_offset = 100,
--           async = true,
--         },
--       },
--     },
--   },
-- }
return {
  "supermaven-inc/supermaven-nvim",
  opts = {
    keymaps = {
      -- accept_suggestion = "<C-CR>", -- handled by nvim-cmp / blink.cmp
      accept_suggestion = "<C-a>", -- handled by nvim-cmp / blink.cmp
    },
    -- disable_inline_completion = vim.g.ai_cmp,
    ignore_filetypes = { "bigfile", "snacks_input", "snacks_notif" },
  },
}
