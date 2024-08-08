return { 'ThePrimeagen/harpoon',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'folke/which-key.nvim',
    },
    config = function()
        local harpoon = require('harpoon')
        harpoon.setup()

        local leader = {
            ["H"] = {
                name = "Harpoon",
                m = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Mark current file" },
                r = { "<cmd>lua require('harpoon.mark').rm_file()<cr>", "Remove current file" },
                v = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Toggle quick menu" },
                n = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Next file" },
                p = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Previous file" },
                ["1"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "File 1" },
                ["2"] = { "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "File 2" },
                ["3"] = { "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "File 3" },
                ["4"] = { "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", "File 4" },
                ["5"] = { "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", "File 5" },
                ["6"] = { "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", "File 6" },
                ["7"] = { "<cmd>lua require('harpoon.ui').nav_file(7)<cr>", "File 7" },
                ["8"] = { "<cmd>lua require('harpoon.ui').nav_file(8)<cr>", "File 8" },
                ["9"] = { "<cmd>lua require('harpoon.ui').nav_file(9)<cr>", "File 9" },
                ["0"] = { "<cmd>lua require('harpoon.ui').nav_file(10)<cr>", "File 10" },
            }
        }

        local wk = require('which-key')
        wk.register(leader, { mode = "n", prefix = "<leader>" })
    end,
}
