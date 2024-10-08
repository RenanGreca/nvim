return {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    version = false,
    dependencies = {
        -- autocompletes from LSP
        'hrsh7th/cmp-nvim-lsp',
        -- auto-hints for above
        'hrsh7th/cmp-nvim-lsp-signature-help',
        -- autocompletes file paths
        'hrsh7th/cmp-path',
        -- autocompletes from buffer
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-cmdline',
        'onsails/lspkind.nvim',

        'rafamadriz/friendly-snippets',
    },
    config = function()
        local cmp = require("cmp")
        local lspkind = require("lspkind")
        local opts = {
            snippet = {
                -- the snippet engine, check docs
                expand = function(args)
                    vim.snippet.expand(args.body)
                end,
            },
            sources = {
                { name = "supermaven" },
                { name = "nvim_lsp" },
                -- { name = "nvim_lsp_signature_help" },
                { name = "path" },
                { name = "buffer" },
                { name = "cmdline" },
                -- { name = "friendly_snippets" },
            },
            mapping = cmp.mapping.preset.insert({
                -- select completion with "enter"
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
                -- page down/up
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                -- open/close completion menu
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.close(),
                -- browse through completion items
                -- ["<Tab>"] = cmp.mapping(function(fallback)
                --     if cmp.visible() then
                --         cmp.select_next_item()
                --     else
                --         fallback()
                --     end
                -- end, { "i", "s" }),
                -- ["<S-Tab>"] = cmp.mapping(function(fallback)
                --     if cmp.visible() then
                --         cmp.select_prev_item()
                --     else
                --         fallback()
                --     end
                -- end, { "i", "s" }),
            }),
            formatting = {
                fields = { "kind", "abbr", "menu" },
                format = function(entry, vim_item)
                    local custom_menu_icon = {
                        supermaven = "",
                    }
                    local kind = lspkind.cmp_format({
                        mode = "symbol_text",
                        menu = ({
                            buffer = "[B]",
                            nvim_lsp = "[L]",
                            nvim_lua = "[S]",
                            path = "[P]",
                            supermaven = "[C]",
                        })
                    })(entry, vim_item)
                    if entry.source.name == "supermaven" then
                        kind.kind = string.format("%s %s", custom_menu_icon.supermaven, "Copilot")
                    end
                    local strings = vim.split(kind.kind, "%s", { trimempty=true })
                    kind.kind = strings[1]
                    kind.menu = string.format("%s %s", strings[2], kind.menu)
                    return kind
                end,
            },
            window = {
                -- completion = {
                --     winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
                --     col_offset = -3,
                --     side_padding = 0,
                -- },
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
        }
        cmp.setup(opts)

        -- Use cmdline & path for / and ? prefixes.
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })

        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'cmdline' },
            },{
                { name = 'path' },
            }),
            matcher = { disallow_symbol_noprefix_matching = false }
        })
    end,
}
