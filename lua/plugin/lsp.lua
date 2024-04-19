local nvim_lsp = require 'lspconfig'
local util = require 'lspconfig.util'
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

nvim_lsp.lua_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = {'vim'}
      }
    }
  }
})

nvim_lsp.phpactor.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'php' }
})

nvim_lsp.intelephense.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'php' },
  settings = {
    intelephense = {
      stubs = {
        "wordpress-globals",
        "wp-cli",
        "wordpress-stubs",
      },
      environment = {
        phpVersion = "7.4.0",
        composerJsonPath = "composer.json",
        includePaths = '~/.composer/vendor/php-stubs/'
      },
    }
  }
})

nvim_lsp.html.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'html', 'php', 'htmlx', 'gohtmltmpl' }
})

nvim_lsp.vtsls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'typescript', 'javascript' }
})

nvim_lsp["sourcekit"].setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp",
  },
  filetypes = { 'swift' },
  root_dir = function(filename, _)
    return util.root_pattern("buildServer.json")(filename)
      or util.root_pattern("*.xcodeproj", "*.xcworkspace")(filename)
      or util.find_git_ancestor(filename)
      or util.root_pattern("Package.swift")(filename)
  end
})

nvim_lsp.tailwindcss.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'css' },
  root_dir = function(filename, _)
    return util.find_git_ancestor(filename)
  end
})

-- For Templ LSP, update treesitter version
vim.filetype.add({ extension = { templ = "templ" }})
nvim_lsp.templ.setup({
 on_attach = on_attach,
 capabilities = capabilities,
 filetypes = { 'templ', 'html' }
})
nvim_lsp.gopls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'go', 'templ' }
})


nvim_lsp.marksman.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { 'markdown' }
})

-- nvim_lsp.css_lsp.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { 'css', 'scss', 'less', 'html', 'php' }
-- })


-- nvim_lsp.rust_analyzer.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { 'rust' }
-- })
