local icons = require('icons')

-- Several of these keymaps are based on those from LunarVim.
-- https://github.com/LunarVim/LunarVim/blob/9ee3b7b8846d7ed2fa79f03d67083f8b95c897f2/lua/lvim/core/which-key.lua
-- Additional keymaps related to specific plugins can be found in that plugin's config file.
local leader = {
    ["/"] = {
        "<Plug>(comment_toggle_linewise_current)",
        Hint(icons.ui.Comment, "Comment toggle current line")
    },
    ["c"] = {
        "<cmd>BufferKill<CR>",
        Hint(icons.ui.Close, "Close Buffer")
    },
    ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
    ["b"] = {
        name = "Buffers",
        j = { "<cmd>BufferLinePick<cr>", "Jump" },
        f = { "<cmd>Telescope buffers previewer=false<cr>", "Find" },
        b = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
        n = { "<cmd>BufferLineCycleNext<cr>", "Next" },
        W = { "<cmd>noautocmd w<cr>", "Save without formatting (noautocmd)" },
        -- w = { "<cmd>BufferWipeout<cr>", "Wipeout" }, -- TODO: implement this for bufferline
        e = {
            "<cmd>BufferLinePickClose<cr>",
            "Pick which buffer to close",
        },
        h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
        l = {
            "<cmd>BufferLineCloseRight<cr>",
            "Close all to the right",
        },
        D = {
            "<cmd>BufferLineSortByDirectory<cr>",
            "Sort by directory",
        },
        L = {
            "<cmd>BufferLineSortByExtension<cr>",
            "Sort by language",
        },
    },
    ["L"] = {
        name = "Lazy Plugins",
        i = { "<cmd>Lazy install<cr>", "Install" },
        s = { "<cmd>Lazy sync<cr>", "Sync" },
        S = { "<cmd>Lazy clear<cr>", "Status" },
        c = { "<cmd>Lazy clean<cr>", "Clean" },
        u = { "<cmd>Lazy update<cr>", "Update" },
        p = { "<cmd>Lazy profile<cr>", "Profile" },
        l = { "<cmd>Lazy log<cr>", "Log" },
        d = { "<cmd>Lazy debug<cr>", "Debug" },
    },
    ["g"] = {
        name = "Git",
        g = { "<cmd>lua require 'lvim.core.terminal'.lazygit_toggle()<cr>", "Lazygit" },
        j = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "Next Hunk" },
        k = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", "Prev Hunk" },
        l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
        p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
        r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
        R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
        s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
        u = {
            "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
            "Undo Stage Hunk",
        },
        o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
        C = {
            "<cmd>Telescope git_bcommits<cr>",
            "Checkout commit(for current file)",
        },
        d = {
            "<cmd>Gitsigns diffthis HEAD<cr>",
            "Git Diff",
        },
    },
    ["l"] = {
        name = "LSP",
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
        w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
        f = { "<cmd>lua require('lvim.lsp.utils').format()<cr>", "Format" },
        i = { "<cmd>LspInfo<cr>", "Info" },
        I = { "<cmd>Mason<cr>", "Mason Info" },
        j = {
            "<cmd>lua vim.diagnostic.goto_next()<cr>",
            "Next Diagnostic",
        },
        k = {
            "<cmd>lua vim.diagnostic.goto_prev()<cr>",
            "Prev Diagnostic",
        },
        l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
        q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        S = {
            "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
            "Workspace Symbols",
        },
        e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
        F = { vim.diagnostic.open_float, "  Show floating diagnostics" },
        Q = { vim.diagnostic.setloclist, "  Show diagnostics list" },
    },
    ["s"] = {
        name = "Search",
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
        f = { "<cmd>Telescope find_files<cr>", "Find File" },
        h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
        H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
        M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
        R = { "<cmd>Telescope registers<cr>", "Registers" },
        t = { "<cmd>Telescope live_grep<cr>", "Text" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        C = { "<cmd>Telescope commands<cr>", "Commands" },
        l = { "<cmd>Telescope resume<cr>", "Resume last search" },
        p = {
          "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
          "Colorscheme with Preview",
        },
      },
      ["T"] = {
        name = "Treesitter",
        i = { ":TSConfigInfo<cr>", "Info" },
      },


    -- My keymaps
    ['C'] = {
        -- Keymaps to interact with system clipboard
        name = Hint(icons.misc.Clipboard, "Clipboard"),
        y = { [["+y]], Hint(icons.actions.Copy, "Copy to clipboard")},
        Y = { [["+Y]], Hint(icons.actions.Copy, "Copy line to clipboard") },
        d = { [["+d]], Hint(icons.actions.Cut, "Cut to clipboard") },
        D = { [["+D]], Hint(icons.actions.Cut, "Cut line to clipboard") },
        p = { [["+p]], Hint(icons.actions.Paste, "Paste from clipboard") },
        P = { [["+P]], Hint(icons.actions.Paste, "Paste from clipboard (before)") }
    },
    ["w"] = {
        -- Keymaps for window tiling
        name = Hint(icons.ui.Window, "Window"),
        s = { "<cmd>:split<cr>", Hint(icons.ui.WindowHSplit, "Horizontal split") },
        v = { "<cmd>:vsplit<cr>", Hint(icons.ui.WindowVSplit, "Vertical split") },
        h = { "<C-w>h", Hint(icons.ui.BoldArrowLeft, "Move left")},
        j = { "<C-w>j", Hint(icons.ui.BoldArrowDown, "Move down")},
        k = { "<C-w>k", Hint(icons.ui.BoldArrowUp, "Move up")},
        l = { "<C-w>l", Hint(icons.ui.BoldArrowRight, "Move right")},
        ["<left>"] = { ":bprev<cr>", Hint(icons.ui.Buffer, "Previous buffer") },
        ["<right>"] = { ":bnext<cr>", Hint(icons.ui.Buffer, "Next buffer") },
    },
    ['J'] = { ":m +1<cr>", "  Move line down"},
    ['K'] = { ":m -2<cr>", "  Move line up"},
    ["<Tab>"] = {
      [[gg=G]],
      "  Autoindent file"
    },
    ["<Leader>"] = {
      "<cmd>WhichKey<cr>",
      "  Show key mappings"
    }

}
-- leader["w"]
-- leader["w"]
local leaderopts = {
    mode = "n",
    prefix = "<leader>",
}

local vleader = {
    ["/"] = { "<Plug>(comment_toggle_linewise_visual)", "Comment toggle linewise (visual)" },
    l = {
        name = "LSP",
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    },
    ['F'] = {
      name = " 󰉡 Format",
      j = { ":'<,'>!jq<cr>", "  JSON"}
    }
}
local vleaderopts = {
    mode = "v",
    prefix = "<leader>",
}
local vmappings = {
    ["K"] = {":m '<-2<CR>gv=gv", "Move block up"},
    ["J"] = {":m '>+1<CR>gv=gv", 'Move block down'},
}
local vopts = {
    mode = "v"
}


local config = function()
    local wk = require('which-key')
    wk.setup({
        icons = {
            breadcrumb = icons.ui.DoubleChevronRight,
            separator = icons.ui.BoldArrowRight,
            group = icons.ui.Plus,
        },
        window = {
            border = "single", -- none, single, double, shadow
            padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        }
    })
    wk.register(leader, leaderopts)
    wk.register(vleader, vleaderopts)
    wk.register(vmappings, vopts)
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
    config = config
}
