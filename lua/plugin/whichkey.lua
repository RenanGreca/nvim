local icons = require('icons')

-- Several of these keymaps are based on those from LunarVim.
-- https://github.com/LunarVim/LunarVim/blob/9ee3b7b8846d7ed2fa79f03d67083f8b95c897f2/lua/lvim/core/which-key.lua
-- Additional keymaps related to specific plugins can be found in that plugin's config file.
-- local leader = {
--     ["/"] = {
--         "<Plug>(comment_toggle_linewise_current)",
--         Hint(icons.ui.Comment, "Comment toggle current line")
--     },
--     ["c"] = {
--         "<cmd>BufferKill<CR>",
--         Hint(icons.ui.Close, "Close Buffer")
--     },
--     ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
--     ["b"] = {
--         name = "Buffers",
--         j = { "<cmd>BufferLinePick<cr>", "Jump" },
--         f = { "<cmd>Telescope buffers previewer=false<cr>", "Find" },
--         b = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
--         n = { "<cmd>BufferLineCycleNext<cr>", "Next" },
--         W = { "<cmd>noautocmd w<cr>", "Save without formatting (noautocmd)" },
--         -- w = { "<cmd>BufferWipeout<cr>", "Wipeout" }, -- TODO: implement this for bufferline
--         e = {
--             "<cmd>BufferLinePickClose<cr>",
--             "Pick which buffer to close",
--         },
--         h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
--         l = {
--             "<cmd>BufferLineCloseRight<cr>",
--             "Close all to the right",
--         },
--         D = {
--             "<cmd>BufferLineSortByDirectory<cr>",
--             "Sort by directory",
--         },
--         L = {
--             "<cmd>BufferLineSortByExtension<cr>",
--             "Sort by language",
--         },
--     },
--     ["L"] = {
--         name = "Lazy Plugins",
--         i = { "<cmd>Lazy install<cr>", "Install" },
--         s = { "<cmd>Lazy sync<cr>", "Sync" },
--         S = { "<cmd>Lazy clear<cr>", "Status" },
--         c = { "<cmd>Lazy clean<cr>", "Clean" },
--         u = { "<cmd>Lazy update<cr>", "Update" },
--         p = { "<cmd>Lazy profile<cr>", "Profile" },
--         l = { "<cmd>Lazy log<cr>", "Log" },
--         d = { "<cmd>Lazy debug<cr>", "Debug" },
--     },
--     ["g"] = {
--         name = "Git",
--         g = { "<cmd>lua require 'lvim.core.terminal'.lazygit_toggle()<cr>", "Lazygit" },
--         j = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "Next Hunk" },
--         k = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", "Prev Hunk" },
--         l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
--         p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
--         r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
--         R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
--         s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
--         u = {
--             "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
--             "Undo Stage Hunk",
--         },
--         o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
--         b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
--         c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
--         C = {
--             "<cmd>Telescope git_bcommits<cr>",
--             "Checkout commit(for current file)",
--         },
--         d = {
--             "<cmd>Gitsigns diffthis HEAD<cr>",
--             "Git Diff",
--         },
--     },
--     ["l"] = {
--         name = "LSP",
--         a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
--         d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
--         w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
--         f = { "<cmd>lua require('lvim.lsp.utils').format()<cr>", "Format" },
--         i = { "<cmd>LspInfo<cr>", "Info" },
--         I = { "<cmd>Mason<cr>", "Mason Info" },
--         j = {
--             "<cmd>lua vim.diagnostic.goto_next()<cr>",
--             "Next Diagnostic",
--         },
--         k = {
--             "<cmd>lua vim.diagnostic.goto_prev()<cr>",
--             "Prev Diagnostic",
--         },
--         l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
--         q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
--         r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
--         s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
--         S = {
--             "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
--             "Workspace Symbols",
--         },
--         e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
--         F = { vim.diagnostic.open_float, "  Show floating diagnostics" },
--         Q = { vim.diagnostic.setloclist, "  Show diagnostics list" },
--     },
--     ["s"] = {
--         name = "Search",
--         b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
--         c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
--         f = { "<cmd>Telescope find_files<cr>", "Find File" },
--         h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
--         H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
--         M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
--         r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
--         R = { "<cmd>Telescope registers<cr>", "Registers" },
--         t = { "<cmd>Telescope live_grep<cr>", "Text" },
--         k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
--         C = { "<cmd>Telescope commands<cr>", "Commands" },
--         l = { "<cmd>Telescope resume<cr>", "Resume last search" },
--         p = {
--           "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
--           "Colorscheme with Preview",
--         },
--       },
--       ["T"] = {
--         name = "Treesitter",
--         i = { ":TSConfigInfo<cr>", "Info" },
--       },
--
--
--     -- My keymaps
--     ['C'] = {
--         -- Keymaps to interact with system clipboard
--         name = Hint(icons.misc.Clipboard, "Clipboard"),
--         y = { [["+y]], Hint(icons.actions.Copy, "Copy to clipboard")},
--         Y = { [["+Y]], Hint(icons.actions.Copy, "Copy line to clipboard") },
--         d = { [["+d]], Hint(icons.actions.Cut, "Cut to clipboard") },
--         D = { [["+D]], Hint(icons.actions.Cut, "Cut line to clipboard") },
--         p = { [["+p]], Hint(icons.actions.Paste, "Paste from clipboard") },
--         P = { [["+P]], Hint(icons.actions.Paste, "Paste from clipboard (before)") }
--     },
--     ["w"] = {
--         -- Keymaps for window tiling
--         name = Hint(icons.ui.Window, "Window"),
--         s = { "<cmd>:split<cr>", Hint(icons.ui.WindowHSplit, "Horizontal split") },
--         v = { "<cmd>:vsplit<cr>", Hint(icons.ui.WindowVSplit, "Vertical split") },
--         h = { "<C-w>h", Hint(icons.ui.BoldArrowLeft, "Move left")},
--         j = { "<C-w>j", Hint(icons.ui.BoldArrowDown, "Move down")},
--         k = { "<C-w>k", Hint(icons.ui.BoldArrowUp, "Move up")},
--         l = { "<C-w>l", Hint(icons.ui.BoldArrowRight, "Move right")},
--         ["<left>"] = { ":bprev<cr>", Hint(icons.ui.Buffer, "Previous buffer") },
--         ["<right>"] = { ":bnext<cr>", Hint(icons.ui.Buffer, "Next buffer") },
--     },
--     ["F"] = {
--       name = " 󰉡 Format",
--       j = { "VggG:'<,'>!jq<cr>", "  JSON"}
--     },
--     ['J'] = { ":m +1<cr>", "  Move line down"},
--     ['K'] = { ":m -2<cr>", "  Move line up"},
--     ["<Tab>"] = {
--       [[gg=G]],
--       "  Autoindent file"
--     },
--     ["<Leader>"] = {
--       "<cmd>WhichKey<cr>",
--       "  Show key mappings"
--     }
--
-- }

local leader = {
  { "<leader>/", "<Plug>(comment_toggle_linewise_current)", desc = "  Comment toggle current line" },
  { "<leader><Leader>", "<cmd>WhichKey<cr>", desc = "  Show key mappings" },
  { "<leader><Tab>", "gg=G", desc = "  Autoindent file" },
  { "<leader>C", group = " 󰅌 Clipboard" },
  { "<leader>CD", '"+D', desc = " 󰆐 Cut line to clipboard" },
  { "<leader>CP", '"+P', desc = "  Paste from clipboard (before)" },
  { "<leader>CY", '"+Y', desc = " 󰆏 Copy line to clipboard" },
  { "<leader>Cd", '"+d', desc = " 󰆐 Cut to clipboard" },
  { "<leader>Cp", '"+p', desc = "  Paste from clipboard" },
  { "<leader>Cy", '"+y', desc = " 󰆏 Copy to clipboard" },
  { "<leader>F", group = " 󰉡 Format" },
  { "<leader>Fj", "VggG:'<,'>!jq<cr>", desc = "  JSON" },
  { "<leader>J", ":m +1<cr>", desc = "  Move line down" },
  { "<leader>K", ":m -2<cr>", desc = "  Move line up" },
  { "<leader>L", group = "Lazy Plugins" },
  { "<leader>LS", "<cmd>Lazy clear<cr>", desc = "Status" },
  { "<leader>Lc", "<cmd>Lazy clean<cr>", desc = "Clean" },
  { "<leader>Ld", "<cmd>Lazy debug<cr>", desc = "Debug" },
  { "<leader>Li", "<cmd>Lazy install<cr>", desc = "Install" },
  { "<leader>Ll", "<cmd>Lazy log<cr>", desc = "Log" },
  { "<leader>Lp", "<cmd>Lazy profile<cr>", desc = "Profile" },
  { "<leader>Ls", "<cmd>Lazy sync<cr>", desc = "Sync" },
  { "<leader>Lu", "<cmd>Lazy update<cr>", desc = "Update" },
  { "<leader>T", group = "Treesitter" },
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
  { "<leader>c", "<cmd>BufferKill<CR>", desc = " 󰅖 Close Buffer" },
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
  { "<leader>h", "<cmd>nohlsearch<CR>", desc = "No Highlight" },
  { "<leader>l", group = "LSP" },
  { "<leader>lF", vim.diagnostic.open_float, desc = "  Show floating diagnostics" },
  { "<leader>lI", "<cmd>Mason<cr>", desc = "Mason Info" },
  { "<leader>lQ", vim.diagnostic.setloclist, desc = "  Show diagnostics list" },
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
  { "<leader>sp", "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>", desc = "Colorscheme with Preview" },
  { "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
  { "<leader>st", "<cmd>Telescope live_grep<cr>", desc = "Text" },
  { "<leader>w", group = "  Window" },
  { "<leader>w<left>", ":bprev<cr>", desc = " 󰮳 Previous buffer" },
  { "<leader>w<right>", ":bnext<cr>", desc = " 󰮳 Next buffer" },
  { "<leader>wh", "<C-w>h", desc = "  Move left" },
  { "<leader>wj", "<C-w>j", desc = "  Move down" },
  { "<leader>wk", "<C-w>k", desc = "  Move up" },
  { "<leader>wl", "<C-w>l", desc = "  Move right" },
  { "<leader>ws", "<cmd>:split<cr>", desc = "  Horizontal split" },
  { "<leader>wv", "<cmd>:vsplit<cr>", desc = "  Vertical split" },
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
    local wk = require('which-key')
    wk.setup({
        icons = {
            breadcrumb = icons.ui.DoubleChevronRight,
            separator = icons.ui.BoldArrowRight,
            group = icons.ui.Plus,
        },
        win = {
            border = "single", -- none, single, double, shadow
            padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        }
    })
    wk.add(leader, {
        mode = { "n" }
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
    'folke/which-key.nvim',
    opts = {},
    config = config,
    dependencies = {
        'echasnovski/mini.icons',
    },
}
