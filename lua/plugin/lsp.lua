-- local nvim_lsp = require("lspconfig")
-- local util = require("lspconfig.util")
-- composer global require php-stubs/wordpress-globals php-stubs/wordpress-stubs php-stubs/woocommerce-stubs php-stubs/acf-pro-stubs wpsyntex/polylang-stubs php-stubs/genesis-stubs php-stubs/wp-cli-stubs
-- local configs = require'lspconfig/configs'
-- local util = require("lspconfig/util")
vim.filetype.add({ extension = { templ = "templ" } })
local icons = require("icons")

local opts = {
  diagnostics = {
    underline = true,
    update_in_insert = false,
    virtual_text = {
      spacing = 4,
      source = "if_many",
      prefix = "●",
    },
    severity_sort = true,
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
        [vim.diagnostic.severity.WARN] = icons.diagnostics.Warn,
        [vim.diagnostic.severity.HINT] = icons.diagnostics.Hint,
        [vim.diagnostic.severity.INFO] = icons.diagnostics.Info,
      },
    },
  },
  inlay_hints = {
    enabled = true,
    exclude = { "vue" }, -- filetypes for which you don't want to enable inlay hints
  },
  codelens = {
    enabled = false,
  },
  capabilities = {
    workspace = {
      fileOperations = {
        didRename = true,
        willRename = true,
      },
    },
  },
  format = {
    formatting_options = nil,
    timeout_ms = nil,
  },
  servers = {
    -- Lua
    lua_ls = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    },
    -- TypeScript
    ts_ls = {
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    },
    -- PHP
    intelephense = {
      filetypes = { "php" },
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
            includePaths = "~/.composer/vendor/php-stubs/",
          },
        },
      },
    },
    -- HTML
    html = {
      filetypes = { "html", "php", "htmlx", "gohtmltmpl" },
    },
    -- CSS
    tailwindcss = {
      filetypes = { "css" },
      root_dir = function(filename, _)
        local util = require("lspconfig.util")
        return util.find_git_ancestor(filename)
      end,
    },
    -- Swift
    sourcekit = {
      cmd = {
        "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp",
      },
      filetypes = { "swift" },
      root_dir = function(filename, _)
        local util = require("lspconfig.util")
        return util.root_pattern("buildServer.json")(filename)
          or util.root_pattern("*.xcodeproj", "*.xcworkspace")(filename)
          or util.find_git_ancestor(filename)
          or util.root_pattern("Package.swift")(filename)
      end,
    },
    -- Go
    gopls = {
      filetypes = { "go", "gomod" },
    },
    -- Templ
    templ = {
      filetypes = { "templ", "html" },
    },
    -- Markdown
    marksman = {
      filetypes = { "markdown" },
    },
    -- Python
    jedi_language_server = {
      filetypes = { "python" },
    },
    ruff = {
      filetypes = { "python" },
    },
    -- YAML
    yamlls = {
      filetypes = { "yaml" },
    },
  },
}

local on_attach = function(client, bufnr)
  require("lsp_signature").on_attach({
    bind = true,
    floating_window = true,
    handler_opts = {
      border = "rounded",
    },
  })

  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_augroup("lsp_document_highlight", {
      clear = false,
    })

    vim.api.nvim_clear_autocmds({
      buffer = bufnr,
      group = "lsp_document_highlight",
    })

    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      group = "lsp_document_highlight",
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })

    vim.api.nvim_create_autocmd("CursorMoved", {
      group = "lsp_document_highlight",
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  end

  -- vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
  -- vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
end

local capabilitiesfn = function()
  -- local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- capabilities.textDocument.foldingRange = {
  --   dynamicRegistration = false,
  --   lineFoldingOnly = true
  -- }
  -- capabilities.textDocument.completion.completionItem.snippetSupport = true
  -- capabilities.textDocument.completion.completionItem.resolveSupport = {
  --   properties = {'documentation', 'detail', 'additionalTextEdits',}
  -- }
  -- capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true
  local capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)

  return capabilities
end

local config = function()
  require("mason").setup()
  require("mason-lspconfig").setup({})

  local nvim_lsp = require("lspconfig")
  local util = require("lspconfig.util")
  local capabilities = capabilitiesfn()

  nvim_lsp.lua_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
      },
    },
  })

  nvim_lsp.phpactor.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "php" },
  })

  nvim_lsp.intelephense.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "php" },
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
          includePaths = "~/.composer/vendor/php-stubs/",
        },
      },
    },
  })

  nvim_lsp.html.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "html", "php", "htmlx", "gohtmltmpl" },
  })

  nvim_lsp.vtsls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "typescript", "javascript" },
  })

  nvim_lsp.sourcekit.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {
      "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp",
    },
    filetypes = { "swift" },
    root_dir = function(filename, _)
      return util.root_pattern("buildServer.json")(filename)
        or util.root_pattern("*.xcodeproj", "*.xcworkspace")(filename)
        or util.find_git_ancestor(filename)
        or util.root_pattern("Package.swift")(filename)
    end,
  })

  nvim_lsp.tailwindcss.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "css" },
    root_dir = function(filename, _)
      return util.find_git_ancestor(filename)
    end,
  })

  -- For Templ LSP, update treesitter version
  vim.filetype.add({ extension = { templ = "templ" } })
  nvim_lsp.templ.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "templ", "html" },
  })
  nvim_lsp.gopls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "go", "templ" },
  })

  nvim_lsp.marksman.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "markdown" },
  })

  -- nvim_lsp.pylsp.setup_nvim_cmp({
  --   preselect = 'none',
  --   completion = {
  --     completeopt = 'menu,menuone,noinsert,noselect'
  --   },
  -- })
  nvim_lsp.jedi_language_server.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "python" },
  })

  nvim_lsp.ruff.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "python" },
  })
  -- nvim_lsp.pylsp.setup({
  --   on_attach = on_attach,
  --   settings = {
  --     pylsp = {
  --       plugins = {
  --         pylsp_mypy = { enabled = true },
  --         jedi_completion = { fuzzy = true },
  --       },
  --     },
  --   },
  --   capabilities = capabilities,
  --   filetypes = { 'python' }
  -- })

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
    "ray-x/lsp_signature.nvim",
    "saghen/blink.cmp",
  },
  -- config = config,
  opts = opts,
  config = function(_, opt)
    local lspconfig = require("lspconfig")
    for server, cfg in pairs(opt.servers) do
      -- passing config.capabilities to blink.cmp merges with the capabilities in your
      -- `opts[server].capabilities, if you've defined it
      cfg.capabilities = require("blink.cmp").get_lsp_capabilities(cfg.capabilities)
      lspconfig[server].setup(cfg)
    end
  end,
  setup = {
    tsserver = function(_, opt)
      require("typescript").setup({ server = opt })
      return true
    end,
  },
}
