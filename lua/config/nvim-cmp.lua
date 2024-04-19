return {
    -- Autocompletion
    -- ! Autocompletion for what? Check package docs
    'hrsh7th/nvim-cmp',
    dependencies = {
        -- autocompletes from LSP
        'hrsh7th/cmp-nvim-lsp',
        -- auto-hints for above
        'hrsh7th/cmp-nvim-lsp-signature-help',
        -- autocompletes file paths
        'hrsh7th/cmp-path',
        -- autocompletes from buffer
        'hrsh7th/cmp-buffer',

        'rafamadriz/friendly-snippets',
    }
}
