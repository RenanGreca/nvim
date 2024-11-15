return {
    "PedramNavid/dbtpal",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
    },
    ft = {
        "sql",
        "md",
        "yaml",
    },
    config = function()
        require("dbtpal").setup({
            path_to_dbt = "dbt",
            path_to_dbt_project = "",
            path_to_dbt_profiles_dir = vim.fn.expand("~/.dbt"),
            extended_path_search = true,
            protect_compiled_files = true,
        })
        require("telescope").load_extension("dbtpal")

        local wk = require('which-key')
        local keymaps = {
            { "<leader>d", group = "dbt", icon = "" },
            { "<leader>drf", "<cmd>DbtRun<cr>", desc = "Run" },
            { "<leader>drp", "<cmd>DbtRunAll<cr>" },
            { "<leader>dtf", "<cmd>DbtTest<cr>" },
            { "<leader>dm", "<cmd>lua require('dbtpal.telescope').dbt_picker()<cr>" },
        }
        wk.add(keymaps)
    end,
}
