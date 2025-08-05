return {
    "FotiadisM/tabset.nvim",
    config = function()
        require("tabset").setup({
            defaults = {
                tabwidth = 4,
                expandtab = true,
            },
            languages = {
                go = {
                    tabwidth = 4,
                    expandtab = false,
                },
                make = {
                    tabwidth = 4,
                    expandtab = false,
                },
                yaml = {
                    tabwidth = 2,
                    expandtab = true,
                },
            }
        })
    end
}
