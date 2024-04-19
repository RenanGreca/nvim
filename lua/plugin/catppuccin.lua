return {
    -- Theme
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    lazy = false,
    config = function()
        require('catppuccin').setup {
            flavour = 'mocha', -- latte, frappe, macchiato, mocha
        }
        -- require('catppuccin').load()
        vim.cmd.colorscheme 'catppuccin'
    end,
}
