# Renan's init.lua

My configuration for neoim, based on some defaults from [lazy.nvim](https://github.com/folke/lazy.nvim).

## Main plugins

-   Package manager: [lazy.nvim](https://github.com/folke/lazy.nvim)
-   Syntax highlighting: [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
-   Autocompletion: [blink](https://github.com/saghen/blink.cmp)
-   LLM autocompletion: [supermaven](https://github.com/supermaven-inc/supermaven-nvim)
-   LSP: [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
-   File finder: [telescope](https://github.com/nvim-telescope/telescope.nvim)
-   File navigator: [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua)
-   Status line: [lualine](https://github.com/nvim-lualine/lualine.nvim)
-   Keybindings: [which-key](https://github.com/folke/which-key.nvim)
-   Colorscheme: [catppuccin](https://github.com/catppuccin/nvim)
-   Command menu: [wilder](https://github.com/gelguy/wilder.nvim)

## Automatic theme switching

The file `lua/theme.lua` contains the code for switching the theme.
The theme is switched based on the file type.

## LSP configuration

Use Mason to install LSP servers.
Working languages:

-   Lua: [lua-language-server](https://github.com/sumneko/lua-language-server)
-   PHP: [intelephense](https://github.com/bmewburn/vscode-intelephense)
-   HTML: [html-language-server](https://github.com/vscode-langservers/vscode-html-languageserver-bin)
-   CSS: [tailwindcss-language-server](https://github.com/tailwindlabs/tailwindcss-intellisense)
-   Go: [gopls](https://github.com/golang/tools/tree/master/gopls)
-   Markdown: [marksman](https://github.com/artempyanykh/marksman)
-   Python: [jedi-language-server](https://github.com/pappasam/jedi-language-server)

Additional servers:
-   Templ, for Go templating: [templ-language-server](https://github.com/templ-lang/templ-language-server)
-   Ruff, for Python linting: [ruff-lsp](https://github.com/charliermarsh/ruff-lsp)

Swift works installed with [sourcekit-lsp](https://github.com/apple/sourcekit-lsp).
-   Swift: [sourcekit-lsp](https://github.com/apple/sourcekit-lsp)
