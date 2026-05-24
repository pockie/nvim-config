# Neovim Configuration

A clean, native Neovim configuration using `vim.pack` (built-in package manager, Neovim ≥ 0.12).

## Directory Structure

```
~/.config/nvim/
├── init.lua                  # Entry point
├── nvim-pack-lock.json       # Plugin versions (lockfile)
├── README.md
├── lua/
│   ├── config/
│   │   ├── globals.lua       # Global variables (mapleader, etc.)
│   │   ├── options.lua       # Neovim options
│   │   ├── keymap.lua        # Custom keymaps
│   │   ├── autocmd.lua       # Custom autocommands
│   │   └── lsp.lua           # LSP setup (Mason + vim.lsp.enable)
│   └── plugins/
│       ├── mason.lua         # Plugin declaration: Mason + LSP
│       ├── tokyonight.lua    # Plugin declaration: Colorscheme
│       └── nvim-treesitter.lua # Plugin declaration: Treesitter
└── lsp/
    └── lua_ls.lua            # Lua LSP configuration
```

## Plugins

| Plugin | Purpose |
|---|---|
| [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) | Colorscheme |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting, indentation, code folding based on syntax tree |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | Manages LSP server binaries |
| [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) | Bridge between Mason and Neovim's native `vim.lsp` |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | Predefined LSP server configurations |

## LSP Servers

The LSP configuration uses **Neovim's native LSP API** (`vim.lsp.config` / `vim.lsp.enable`, introduced in Neovim 0.11).

### Installation

LSP servers are automatically installed by **Mason** (controlled via `ensure_installed` in `lua/config/lsp.lua`).

### Configuration

Each LSP server has its own file in `lsp/<name>.lua` that returns a table with the server configuration. It is enabled via `vim.lsp.enable("<name>")` in `lua/config/lsp.lua`. The `settings` in the file replace what would otherwise go in a `.luarc.json`.

Adding a new language:

1. Create a file `lsp/<server>.lua` (e.g. `lsp/rust_analyzer.lua`)
2. Add the server to `ensure_installed` in `lua/config/lsp.lua`
3. Add `vim.lsp.enable("<server>")` in `lua/config/lsp.lua`

### Example: rust-analyzer

```lua
-- lsp/rust_analyzer.lua
return {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_markers = { "Cargo.toml", ".git" },
}
```

```lua
-- In lua/config/lsp.lua:
-- ensure_installed = { "lua_ls", "rust_analyzer" }
-- vim.lsp.enable("rust_analyzer")
```

## Tree-sitter

`nvim-treesitter` provides syntax-based highlighting and indentation (better than Neovim's regex-based highlighting). Add new languages to `ensure_installed` in `lua/plugins/nvim-treesitter.lua`.

## Package Management

- **Add a plugin:** Call `vim.pack.add()` in a file under `lua/plugins/`
- **Update plugins:** Run `:lua vim.pack.update()` or uncomment the line in `init.lua`
- **Lockfile:** `nvim-pack-lock.json` pins plugin versions
