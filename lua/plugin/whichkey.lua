local icons = require("icons")

-- Several of these keymaps are based on those from LunarVim.
-- https://github.com/LunarVim/LunarVim/blob/9ee3b7b8846d7ed2fa79f03d67083f8b95c897f2/lua/lvim/core/which-key.lua
-- Additional keymaps related to specific plugins can be found in that plugin's config file.

local leader = {
  { "<leader>/", "<Plug>(comment_toggle_linewise_current)", desc = "Comment toggle current line", icon = "" },
  { "<leader><Leader>", "<cmd>WhichKey<cr>", desc = "Show key mappings", icon = "" },
  { "<leader><Tab>", "gg=G", desc = "Autoindent file", icon = "" },
  { "<leader>y", '"+y', desc = "Copy to system clipboard", icon = "󰆏" },
  { "<leader>C", group = "Clipboard", icon = "󰅌" },
  { "<leader>CD", '"+D', desc = "Cut line to clipboard", icon = "󰆐" },
  { "<leader>CP", '"+P', desc = "Paste from clipboard (before)", icon = "" },
  { "<leader>CY", '"+Y', desc = "Copy line to clipboard", icon = "󰆏" },
  { "<leader>Cd", '"+d', desc = "Cut to clipboard", icon = "󰆐" },
  { "<leader>Cp", '"+p', desc = "Paste from clipboard", icon = "" },
  { "<leader>Cy", '"+y', desc = "Copy to clipboard", icon = "󰆏" },
  { "<leader>F", group = "Format" },
  { "<leader>Fj", "VggG:'<,'>!jq<cr>", desc = "JSON", icon = "" },
  { "<leader>J", ":m +1<cr>", desc = "Move line down", icon = "" },
  { "<leader>K", ":m -2<cr>", desc = "Move line up", icon = "" },
  { "<leader>L", group = "Lazy Plugins" },
  { "<leader>LS", "<cmd>Lazy clear<cr>", desc = "Status" },
  { "<leader>Lc", "<cmd>Lazy clean<cr>", desc = "Clean" },
  { "<leader>Ld", "<cmd>Lazy debug<cr>", desc = "Debug" },
  { "<leader>Li", "<cmd>Lazy install<cr>", desc = "Install" },
  { "<leader>Ll", "<cmd>Lazy log<cr>", desc = "Log" },
  { "<leader>Lp", "<cmd>Lazy profile<cr>", desc = "Profile" },
  { "<leader>Ls", "<cmd>Lazy sync<cr>", desc = "Sync" },
  { "<leader>Lu", "<cmd>Lazy update<cr>", desc = "Update" },
  { "<leader>T", group = "Treesitter", icon = "" },
  { "<leader>Ti", ":TSConfigInfo<cr>", desc = "Info" },
  { "<leader>b", group = "Buffers" },
  { "<leader>bD", "<cmd>BufferLineSortByDirectory<cr>", desc = "Sort by directory" },
  { "<leader>bL", "<cmd>BufferLineSortByExtension<cr>", desc = "Sort by language" },
  { "<leader>bW", "<cmd>noautocmd w<cr>", desc = "Save without formatting (noautocmd)" },
  { "<leader>bb", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous" },
  { "<leader>be", "<cmd>BufferLinePickClose<cr>", desc = "Pick which buffer to close" },
  { "<leader>bf", "<cmd>Telescope buffers previewer=false<cr>", desc = "Find" },
  { "<leader>bh", "<cmd>BufferLineCloseLeft<cr>", desc = "Close all to the left" },
  { "<leader>bj", "<cmd>BufferLinePick<cr>", desc = "Jump" },
  { "<leader>bl", "<cmd>BufferLineCloseRight<cr>", desc = "Close all to the right" },
  { "<leader>bn", "<cmd>BufferLineCycleNext<cr>", desc = "Next" },
  { "<leader>c", "<cmd>BufferKill<CR>", desc = "Close Buffer", icon = "󰅖" },
  { "<leader>g", group = "Git" },
  { "<leader>gC", "<cmd>Telescope git_bcommits<cr>", desc = "Checkout commit(for current file)" },
  { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer" },
  { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
  { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit" },
  { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Git Diff" },
  { "<leader>gg", "<cmd>lua require 'lvim.core.terminal'.lazygit_toggle()<cr>", desc = "Lazygit" },
  { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", desc = "Next Hunk" },
  { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", desc = "Prev Hunk" },
  { "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame" },
  { "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open changed file" },
  { "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk" },
  { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk" },
  { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk" },
  { "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk" },
  { "<leader>h", "<cmd>nohlsearch<CR>", desc = "No Highlight", icon = "" },
  { "<leader>l", group = "LSP", icon = "" },
  { "<leader>lF", vim.diagnostic.open_float, desc = "Show floating diagnostics", icon = "" },
  { "<leader>lI", "<cmd>Mason<cr>", desc = "Mason Info" },
  { "<leader>lQ", vim.diagnostic.setloclist, desc = "Show diagnostics list", icon = "" },
  { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },
  { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
  { "<leader>ld", "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", desc = "Buffer Diagnostics" },
  { "<leader>le", "<cmd>Telescope quickfix<cr>", desc = "Telescope Quickfix" },
  { "<leader>lf", "<cmd>lua require('lvim.lsp.utils').format()<cr>", desc = "Format" },
  { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
  { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "Next Diagnostic" },
  { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic" },
  { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
  { "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quickfix" },
  { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
  { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
  { "<leader>lw", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
  { "<leader>s", group = "Search" },
  {
    "<leader>ss",
    [[:%s/<C-r><C-w>/]],
    desc = "Substitute word",
  },
  { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
  { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Find highlight groups" },
  { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
  { "<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers" },
  { "<leader>sb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
  { "<leader>sc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
  { "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "Find File" },
  { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
  { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
  { "<leader>sl", "<cmd>Telescope resume<cr>", desc = "Resume last search" },
  {
    "<leader>sp",
    "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
    desc = "Colorscheme with Preview",
  },
  { "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
  { "<leader>st", "<cmd>Telescope live_grep<cr>", desc = "Text" },
  { "<leader>w", group = "Window" },
  { "<leader>w<left>", ":bprev<cr>", desc = " 󰮳 Previous buffer" },
  { "<leader>w<right>", ":bnext<cr>", desc = " 󰮳 Next buffer" },
  { "<leader>wh", "<C-w>h", desc = "Move left", icon = icons.ui.BoldArrowLeft },
  { "<leader>wj", "<C-w>j", desc = "Move down", icon = icons.ui.BoldArrowDown },
  { "<leader>wk", "<C-w>k", desc = "Move up", icon = icons.ui.BoldArrowUp },
  { "<leader>wl", "<C-w>l", desc = "Move right", icon = icons.ui.BoldArrowRight },
  { "<leader><left>", "<C-w>h", desc = "Move left", icon = icons.ui.BoldArrowLeft },
  { "<leader><down>", "<C-w>j", desc = "Move down", icon = icons.ui.BoldArrowDown },
  { "<leader><up>", "<C-w>k", desc = "Move up", icon = icons.ui.BoldArrowUp },
  { "<leader><right>", "<C-w>l", desc = "Move right", icon = icons.ui.BoldArrowRight },
  { "<leader>ws", "<cmd>:split<cr>", desc = "Horizontal split", icon = "" },
  { "<leader>wv", "<cmd>:vsplit<cr>", desc = "Vertical split", icon = "" },
}

-- leader["w"]
-- leader["w"]
-- local leaderopts = {
--     mode = "n",
--     prefix = "<leader>",
-- }
-- local mappings = {
--     ["g"] = {
--         D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Go to declaration" },
--         d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition" },
--         r = { "<cmd>po<CR>", "Return to previous location" },
--     }
-- }
local mappings = {
  { "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", desc = "Go to declaration" },
  { "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "Go to definition" },
  { "gr", "<cmd>po<CR>", desc = "Return to previous location" },
}
-- local opts = {
--     mode = "n"
-- }

-- local vleader = {
--     ["/"] = { "<Plug>(comment_toggle_linewise_visual)", "Comment toggle linewise (visual)" },
--     l = {
--         name = "LSP",
--         a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
--     },
--     ['F'] = {
--       name = " 󰉡 Format",
--       j = { ":'<,'>!jq<cr>", "  JSON"}
--     }
-- }
local vleader = {
  {
    mode = { "v" },
    { "<leader>/", "<Plug>(comment_toggle_linewise_visual)", desc = "Comment toggle linewise (visual)" },
    { "<leader>F", group = " 󰉡 Format" },
    { "<leader>Fj", ":'<,'>!jq<cr>", desc = "  JSON" },
    { "<leader>l", group = "LSP" },
    { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
    { "<leader>y", '"+y', desc = "Copy to system clipboard", icon = "󰆏" },
    { "<leader>C", group = "Clipboard", icon = "󰅌" },
    { "<leader>CD", '"+D', desc = "Cut line to clipboard", icon = "󰆐" },
    { "<leader>CP", '"+P', desc = "Paste from clipboard (before)", icon = "" },
    { "<leader>CY", '"+Y', desc = "Copy line to clipboard", icon = "󰆏" },
    { "<leader>Cd", '"+d', desc = "Cut to clipboard", icon = "󰆐" },
    { "<leader>Cp", '"+p', desc = "Paste from clipboard", icon = "" },
    { "<leader>Cy", '"+y', desc = "Copy to clipboard", icon = "󰆏" },
    {
      "<leader>ss",
      [[:%s/<C-r><C-w>/]],
      desc = "Substitute word",
    },
  },
}
-- local vleaderopts = {
--     mode = "v",
--     prefix = "<leader>",
-- }
-- local vmappings = {
--     ["K"] = {":m '<-2<CR>gv=gv", "Move block up"},
--     ["J"] = {":m '>+1<CR>gv=gv", 'Move block down'},
-- }
local vmappings = {
  { "J", ":m '>+1<CR>gv=gv", desc = "Move block down", mode = "v" },
  { "K", ":m '<-2<CR>gv=gv", desc = "Move block up", mode = "v" },
}
-- local vopts = {
--     mode = "v"
-- }
-- vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

local config = function()
  local wk = require("which-key")
  wk.setup({
    icons = {
      breadcrumb = icons.ui.DoubleChevronRight,
      separator = icons.ui.BoldArrowRight,
      group = icons.ui.Plus,
    },
    win = {
      border = "single", -- none, single, double, shadow
      padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    },
  })
  wk.add(leader, {
    mode = { "n" },
  })
  wk.add(vleader)
  wk.add(mappings)
  wk.add(vmappings)
  -- wk.register(leader, leaderopts)
  -- wk.register(vleader, vleaderopts)
  -- wk.register(mappings, opts)
  -- wk.register(vmappings, vopts)
end

-- local wk = require('which-key')
-- wk.register({
-- ["t"] = {
--   name = " 󰂓 Neotest",
--   a = { "<cmd>:Neotest attach<cr>", " 󱘖 Attach"},
--   r = { "<cmd>:NeotestPlaywrightRefresh<cr>", " 󰴂 Playwright Refresh"},
--   t = { "<cmd>:Neotest run<cr>", "  Run"},
--   q = { "<cmd>:Neotest stop<cr>", "  Stop"},
--   s = { "<cmd>:Neotest summary<cr>", " 󰙅 Summary"},
--   o = { "<cmd>:Neotest output<cr>", " 󰆍 Output pop-up"},
--   O = { "<cmd>:Neotest output-panel<cr>", " 󱂩 Output panel"},
--   j = { "<cmd>:Neotest jump prev<cr>", " 󰞕 Previous test"},
--   k = { "<cmd>:Neotest jump next<cr>", " 󰞒 Next test"}
-- }
-- }, { prefix = "<leader>" })

return {
  "folke/which-key.nvim",
  opts = {},
  config = config,
  dependencies = {
    "echasnovski/mini.icons",
  },
}
