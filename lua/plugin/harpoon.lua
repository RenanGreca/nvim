return { 'ThePrimeagen/harpoon',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'folke/which-key.nvim',
    },
    config = function()
        local harpoon = require('harpoon')
        harpoon.setup()

        -- local leader = {
        -- ["H"] = {
        -- name = "Harpoon",
        -- m = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Mark current file" },
        -- r = { "<cmd>lua require('harpoon.mark').rm_file()<cr>", "Remove current file" },
        -- v = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Toggle quick menu" },
        -- n = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Next file" },
        -- p = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Previous file" },
        -- ["1"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "File 1" },
        -- ["2"] = { "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "File 2" },
        -- ["3"] = { "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "File 3" },
        -- ["4"] = { "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", "File 4" },
        -- ["5"] = { "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", "File 5" },
        -- ["6"] = { "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", "File 6" },
        -- ["7"] = { "<cmd>lua require('harpoon.ui').nav_file(7)<cr>", "File 7" },
        -- ["8"] = { "<cmd>lua require('harpoon.ui').nav_file(8)<cr>", "File 8" },
        -- ["9"] = { "<cmd>lua require('harpoon.ui').nav_file(9)<cr>", "File 9" },
        -- ["0"] = { "<cmd>lua require('harpoon.ui').nav_file(10)<cr>", "File 10" },
        -- }
        -- }
        local keymaps = {
            { "<leader>H", group = "Harpoon" },
            { "<leader>H0", "<cmd>lua require('harpoon.ui').nav_file(10)<cr>", desc = "File 10" },
            { "<leader>H1", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "File 1" },
            { "<leader>H2", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "File 2" },
            { "<leader>H3", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "File 3" },
            { "<leader>H4", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", desc = "File 4" },
            { "<leader>H5", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", desc = "File 5" },
            { "<leader>H6", "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", desc = "File 6" },
            { "<leader>H7", "<cmd>lua require('harpoon.ui').nav_file(7)<cr>", desc = "File 7" },
            { "<leader>H8", "<cmd>lua require('harpoon.ui').nav_file(8)<cr>", desc = "File 8" },
            { "<leader>H9", "<cmd>lua require('harpoon.ui').nav_file(9)<cr>", desc = "File 9" },
            { "<leader>Hm", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Mark current file" },
            { "<leader>Hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "Next file" },
            { "<leader>Hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", desc = "Previous file" },
            { "<leader>Hr", "<cmd>lua require('harpoon.mark').rm_file()<cr>", desc = "Remove current file" },
            { "<leader>Hv", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Toggle quick menu" },
        }

        local wk = require('which-key')
        wk.add(keymaps)
        -- wk.register(leader, { mode = "n", prefix = "<leader>" })
    end,
}
