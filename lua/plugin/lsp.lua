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
      root_dir = function(bufnr, on_dir)
        local util = require("lspconfig.util")
        local filename = vim.api.nvim_buf_get_name(bufnr)
        on_dir(util.find_git_ancestor(filename))
      end,
    },
    -- Swift
    sourcekit = {
      -- cmd = {
      --   "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp",
      -- },
      cmd = { "xcrun", "sourcekit-lsp" },
      filetypes = { "swift", "c", "cpp", "objective-c" },
      root_dir = function(bufnr, on_dir)
        local util = require("lspconfig.util")
        local filename = vim.api.nvim_buf_get_name(bufnr)
        on_dir(
          util.root_pattern("buildServer.json")(filename)
            or util.root_pattern("*.xcodeproj", "*.xcworkspace")(filename)
            or util.find_git_ancestor(filename)
            or util.root_pattern("Package.swift")(filename)
        )
      end,
    },
    -- Go
    gopls = {
      filetypes = { "go", "gomod" },
    },
    -- Templ
    templ = {
      filetypes = { "templ" },
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

return {
  -- LSP Configuration & Plugins
  "neovim/nvim-lspconfig",
  dependencies = {
    -- LSP installer/updater
    {
      "williamboman/mason.nvim",
      config = true,
    },
    "williamboman/mason-lspconfig.nvim",

    { 
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      config = function()
        require("mason-tool-installer").setup({
          ensure_installed = {
          "bash-language-server",
          "gopls",
          "html-lsp",
          "jedi-language-server",
          "lua-language-server",
          "marksman",
          "ruff",
          "shfmt",
          "sqlfluff",
          "stylua",
          "typescript-language-server",
          "yaml-language-server",
          },
        })
      end,
    },

    -- Status updates for LSP
    { "j-hui/fidget.nvim", opts = {} },

    "folke/neodev.nvim",
    "jose-elias-alvarez/typescript.nvim",

    "mrcjkb/rustaceanvim",
    -- "ray-x/lsp_signature.nvim",
    "saghen/blink.cmp",
  },
  -- config = config,
  opts = opts,
  config = function(_, opt)
    -- Use the native vim.lsp.config()/vim.lsp.enable() API (nvim >= 0.11)
    -- instead of the deprecated `require("lspconfig")[server].setup()` framework.
    local servers = {}
    for server, cfg in pairs(opt.servers) do
      -- passing config.capabilities to blink.cmp merges with the capabilities in your
      -- `opts[server].capabilities, if you've defined it
      cfg.capabilities = require("blink.cmp").get_lsp_capabilities(cfg.capabilities)
      vim.lsp.config(server, cfg)
      table.insert(servers, server)
    end
    vim.lsp.enable(servers)
  end,
  setup = {
    tsserver = function(_, opt)
      require("typescript").setup({ server = opt })
      return true
    end,
  },
}
