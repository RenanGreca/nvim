-- composer global require php-stubs/wordpress-globals php-stubs/wordpress-stubs php-stubs/woocommerce-stubs php-stubs/acf-pro-stubs wpsyntex/polylang-stubs php-stubs/genesis-stubs php-stubs/wp-cli-stubs
-- local configs = require'lspconfig/configs'
-- local util = require'lspconfig/util'

local on_attach = function(client, bufnr)
    require'lsp_signature'.on_attach({
        bind = true,
        floating_window = true,
        handler_opts = {
            border = "rounded"
        }
    })

    if client.server_capabilities.documentHighlightProvider then
        vim.api.nvim_create_augroup('lsp_document_highlight', {
            clear = false
        })

        vim.api.nvim_clear_autocmds({
            buffer = bufnr,
            group = 'lsp_document_highlight',
        })

        vim.api.nvim_create_autocmd({'CursorHold', 'CursorHoldI'}, {
            group = 'lsp_document_highlight',
            buffer = bufnr,
            callback = vim.lsp.buf.document_highlight,
        })

        vim.api.nvim_create_autocmd('CursorMoved', {
            group = 'lsp_document_highlight',
            buffer = bufnr,
            callback = vim.lsp.buf.clear_references,
        })
    end
end


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {'documentation', 'detail', 'additionalTextEdits',}
}

local config = function ()
    require("mason").setup()
    require("mason-lspconfig").setup({})

    local nvim_lsp = require'lspconfig'

    -- :LspInstall php
    -- :MasonInstall phpactor
    nvim_lsp.phpactor.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { 'php' }
    })

    -- :MasonInstall html
    nvim_lsp.html.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { 'html', 'php', 'htmlx' }
    })

    -- :LspInstall javascript
    -- :LspInstall typescript
    -- :MasonInstall vtsls
    nvim_lsp.vtsls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { 'typescript', 'javascript' }
    })

    -- :MasonInstall lua_ls
    nvim_lsp.lua_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { 'lua' },
        settings = {
            Lua = {
                diagnostics = {
                    globals = { 'vim', 'use' }
                }
            }
        }
    })

    vim.filetype.add({extension = { templ = "templ" } })
    nvim_lsp.templ.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { 'templ', 'html' },
    })

    -- nvim_lsp.standardjs.setup({
    --     on_attach = on_attach,
    --     capabilities = capabilities,
    --     filetypes = { 'js' }
    -- })
end

return {
    -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    dependencies = {
      -- LSP installer/updater
      { "williamboman/mason.nvim", config = true },
      "williamboman/mason-lspconfig.nvim",

      -- Status updates for LSP
      { "j-hui/fidget.nvim", opts = {} },

      "folke/neodev.nvim",
      "jose-elias-alvarez/typescript.nvim",

      "mrcjkb/rustaceanvim",
    },
    config = config,
    opts = {
        servers = {
            tsserver = {},
        },
    },
    setup = {
        tsserver = function(_, opts)
            require('typescript').setup({server = opts})
            return true
        end,
    },
}
