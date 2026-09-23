# 🚀 Personal Neovim Configuration

A clean, modular, and high-performance Neovim configuration powered by [`lazy.nvim`](https://github.com/folke/lazy.nvim), featuring [`fzf-lua`](https://github.com/ibhagwan/fzf-lua) with LazyVim-style keybindings, [`snacks.nvim`](https://github.com/folke/snacks.nvim) QoL suite, native Neovim 0.11+ LSP setup for TypeScript & Vue, and modern editing utilities.

---

## 📂 File Structure

```text
~/.config/nvim
├── init.lua                 # Main entry point (loads lua/config/lazy.lua)
├── lazy-lock.json           # Lockfile tracking exact plugin commit versions
├── README.md                # Configuration & Keybinding documentation
└── lua/
    ├── config/
    │   ├── lazy.lua         # lazy.nvim bootstrap, leader keys, & settings
    │   └── options.lua      # Editor options (relative numbers, etc.)
    └── plugins/
        ├── fzf-lua.lua      # fzf-lua fuzzy finder & LazyVim-like keybindings
        ├── snacks.lua       # snacks.nvim (dashboard, terminal, lazygit, notifier, etc.)
        └── spec1.lua        # LSP, completion, UI, editing, & utility plugins
```

---

## ⚙️ Leader Keys

* **`<leader>`**: `Space` (`" "`)
* **`<localleader>`**: `\` (`"\\"`)

---

## ⌨️ Keybindings Cheatsheet

### 🔍 File & Buffer Pickers (`fzf-lua`)

| Keybinding | Mode | Description | Action / Command |
| :--- | :---: | :--- | :--- |
| `<leader><space>` | `n` | Find Files (Root Dir) | `FzfLua files` |
| `<leader>,` | `n` | Switch Buffer | `FzfLua buffers sort_mru=true sort_lastused=true` |
| `<leader>/` | `n` | Live Grep (Root Dir) | `FzfLua live_grep` |
| `<leader>:` | `n` | Command History | `FzfLua command_history` |
| `<leader>fb` | `n` | Buffers List | `FzfLua buffers` |
| `<leader>fc` | `n` | Find Neovim Config File | `FzfLua files (cwd = config)` |
| `<leader>ff` | `n` | Find Files (Root Dir) | `FzfLua files` |
| `<leader>fg` | `n` | Find Git Files | `FzfLua git_files` |
| `<leader>fr` | `n` | Recent Files (Oldfiles) | `FzfLua oldfiles` |

---

### 🔎 Search (`<leader>s`)

| Keybinding | Mode | Description | Action / Command |
| :--- | :---: | :--- | :--- |
| `<leader>sg` | `n` | Grep / Live Grep | `FzfLua live_grep` |
| `<leader>sw` | `n` | Search Word under cursor | `FzfLua grep_cword` |
| `<leader>sw` | `v` | Search Visual Selection | `FzfLua grep_visual` |
| `<leader>sb` | `n` | Search Buffer Lines | `FzfLua lines` |
| `<leader>sc` | `n` | Search Command History | `FzfLua command_history` |
| `<leader>sC` | `n` | Search Commands | `FzfLua commands` |
| `<leader>sd` | `n` | Document Diagnostics | `FzfLua diagnostics_document` |
| `<leader>sD` | `n` | Workspace Diagnostics | `FzfLua diagnostics_workspace` |
| `<leader>ss` | `n` | Goto LSP Document Symbols | `FzfLua lsp_document_symbols` |
| `<leader>sS` | `n` | Goto LSP Workspace Symbols | `FzfLua lsp_live_workspace_symbols` |
| `<leader>sh` | `n` | Search Help Pages | `FzfLua help_tags` |
| `<leader>sH` | `n` | Search Highlight Groups | `FzfLua highlights` |
| `<leader>sj` | `n` | Search Jump List | `FzfLua jumps` |
| `<leader>sk` | `n` | Search Key Maps | `FzfLua keymaps` |
| `<leader>sl` | `n` | Search Location List | `FzfLua loclist` |
| `<leader>sm` | `n` | Search Marks | `FzfLua marks` |
| `<leader>sM` | `n` | Search Man Pages | `FzfLua manpages` |
| `<leader>sq` | `n` | Search Quickfix List | `FzfLua quickfix` |
| `<leader>sR` | `n` | Resume Last Picker | `FzfLua resume` |

---

### 🐙 Git (`<leader>g`) & Lazygit (`snacks.nvim` + `fzf-lua`)

| Keybinding | Mode | Description | Action / Command |
| :--- | :---: | :--- | :--- |
| `<leader>gg` | `n` | Open Lazygit | `Snacks.lazygit()` |
| `<leader>gB` | `n` | Open Git Repo in Browser | `Snacks.gitbrowse()` |
| `<leader>gf` | `n` | Lazygit Current File History | `Snacks.lazygit.log_file()` |
| `<leader>gl` | `n` | Lazygit Log | `Snacks.lazygit.log()` |
| `<leader>gc` | `n` | Git Commits (Picker) | `FzfLua git_commits` |
| `<leader>gs` | `n` | Git Status (Picker) | `FzfLua git_status` |
| `<leader>gb` | `n` | Git Branches (Picker) | `FzfLua git_branches` |
| `<leader>gS` | `n` | Git Stash (Picker) | `FzfLua git_stash` |

---

### 🍿 Snacks.nvim QoL Features & File Manager

| Keybinding | Mode | Description | Action / Command |
| :--- | :---: | :--- | :--- |
| `<leader>e` | `n` | File Explorer (Left Sidebar) | `Snacks.explorer()` |
| `<leader>fe` | `n` | File Explorer (Root Dir) | `Snacks.explorer()` |
| `<leader>E` | `n` | File Explorer (cwd) | `Snacks.explorer({ cwd = vim.uv.cwd() })` |
| `<C-/>` / `<C-_>` | `n` | Toggle Floating Terminal | `Snacks.terminal()` |
| `<leader>bd` | `n` | Close / Delete Current Buffer | `Snacks.bufdelete()` |
| `<leader>bo` | `n` | Delete Other Buffers | `Snacks.bufdelete.other()` |
| `<leader>bD` | `n` | Force Delete Current Buffer | `Snacks.bufdelete({ force = true })` |
| `<leader>.` | `n` | Toggle Scratch Buffer | `Snacks.scratch()` |
| `<leader>S` | `n` | Select / List Scratch Buffers | `Snacks.scratch.select()` |
| `<leader>z` | `n` | Toggle Zen Mode (Distraction-Free) | `Snacks.zen()` |
| `<leader>Z` | `n` | Toggle Zoom Current Window | `Snacks.zen.zoom()` |
| `<leader>cR` | `n` | Rename File (LSP-aware) | `Snacks.rename.rename_file()` |
| `<leader>n` | `n` | Notification History | `Snacks.notifier.show_history()` |
| `<leader>un` | `n` | Dismiss All Notifications | `Snacks.notifier.hide()` |
| `]]` | `n`, `t` | Jump to Next Word / LSP Reference | `Snacks.words.jump(1)` |
| `[[` | `n`, `t` | Jump to Prev Word / LSP Reference | `Snacks.words.jump(-1)` |

---

### 🎛️ UI & Toggle Options (`<leader>u`)

| Keybinding | Mode | Description |
| :--- | :---: | :--- |
| `<leader>ud` | `n` | Toggle Diagnostics |
| `<leader>ul` | `n` | Toggle Line Numbers |
| `<leader>uL` | `n` | Toggle Relative Numbering |
| `<leader>uw` | `n` | Toggle Line Wrap |
| `<leader>us` | `n` | Toggle Spell Checker |
| `<leader>ug` | `n` | Toggle Indent Guides |
| `<leader>uh` | `n` | Toggle Inlay Hints |
| `<leader>uT` | `n` | Toggle Treesitter Highlight |
| `<leader>uD` | `n` | Toggle Dim Inactive Code |
| `<leader>uC` | `n` | Colorschemes (Live Preview via `fzf-lua`) |

---

### ⚡ Inside the `fzf-lua` Modal Window

| Key | Action |
| :--- | :--- |
| `<Ctrl-q>` | Send all matching results to the Neovim Quickfix list |
| `<Ctrl-u>` / `<Ctrl-d>` | Scroll results list half-page up / down |
| `<Ctrl-f>` / `<Ctrl-b>` | Scroll preview window down / up |
| `<Ctrl-x>` | Quick jump to item |
| `<F1>` | Toggle interactive help menu for current picker |

---

### 🛠️ Editing & Utility Keybindings

| Keybinding | Mode | Plugin | Description |
| :--- | :---: | :--- | :--- |
| `J` | `n` | [`treesj`](https://github.com/Wansmer/treesj) | Toggle splitting / joining code blocks (functions, objects, arrays) |
| `<C-a>` | `n` | [`dial.nvim`](https://github.com/monaqa/dial.nvim) | Intelligent increment (numbers, booleans, dates, constants) |
| `<C-x>` | `n` | [`dial.nvim`](https://github.com/monaqa/dial.nvim) | Intelligent decrement |

---

## 🧩 Installed Plugins Overview

| Category | Plugin | Purpose |
| :--- | :--- | :--- |
| **Package Manager** | [`folke/lazy.nvim`](https://github.com/folke/lazy.nvim) | Fast, modern plugin management |
| **QoL & Utilities** | [`folke/snacks.nvim`](https://github.com/folke/snacks.nvim) | Terminal, lazygit, notifier, smooth scroll, indent lines, zen mode, scratch buffer |
| **Fuzzy Finder** | [`ibhagwan/fzf-lua`](https://github.com/ibhagwan/fzf-lua) | Blazing fast search for files, grep, git, and symbols |
| **LSP** | [`neovim/nvim-lspconfig`](https://github.com/neovim/nvim-lspconfig) | Native Neovim LSP configurations |
| | [`williamboman/mason.nvim`](https://github.com/williamboman/mason.nvim) | Package manager for LSP servers, DAP servers, linters, and formatters |
| | [`williamboman/mason-lspconfig.nvim`](https://github.com/williamboman/mason-lspconfig.nvim) | Bridge between `mason.nvim` and `nvim-lspconfig` |
| | [`j-hui/fidget.nvim`](https://github.com/j-hui/fidget.nvim) | Visual LSP progress & loading indicator spinner |
| **Autocompletion** | [`hrsh7th/nvim-cmp`](https://github.com/hrsh7th/nvim-cmp) | Extensible completion engine with buffer and LSP sources |
| **Code Editing** | [`Wansmer/treesj`](https://github.com/Wansmer/treesj) | Tree-sitter powered split/join for code structures |
| | [`monaqa/dial.nvim`](https://github.com/monaqa/dial.nvim) | Enhanced increment/decrement tool |
| **Notes & Docs** | [`nvim-neorg/neorg`](https://github.com/nvim-neorg/neorg) | Modern organization, note-taking, and task tracking tool (`.norg` files) |
| **UI & Icons** | [`folke/which-key.nvim`](https://github.com/folke/which-key.nvim) | Displays popup with available keybindings |
| | [`stevearc/dressing.nvim`](https://github.com/stevearc/dressing.nvim) | Improves default `vim.ui.input` and `vim.ui.select` |
| | [`nvim-tree/nvim-web-devicons`](https://github.com/nvim-tree/nvim-web-devicons) | Filetype icons |
| **Performance** | [`dstein64/vim-startuptime`](https://github.com/dstein64/vim-startuptime) | Measure and profile startup time (`:StartupTime`) |

### 🧬 LSP Keybindings (Active in any LSP Buffer)

| Keybinding | Mode | Description | Action / Command |
| :--- | :---: | :--- | :--- |
| `gd` | `n` | Goto Definition | `vim.lsp.buf.definition()` |
| `gD` | `n` | Goto Declaration | `vim.lsp.buf.declaration()` |
| `gr` | `n` | Goto References | `vim.lsp.buf.references()` |
| `gI` | `n` | Goto Implementation | `vim.lsp.buf.implementation()` |
| `gy` | `n` | Goto Type Definition | `vim.lsp.buf.type_definition()` |
| `K` | `n` | Hover Documentation | `vim.lsp.buf.hover()` |
| `gK` | `n` | Signature Help | `vim.lsp.buf.signature_help()` |
| `<leader>ca` | `n` | Code Action | `vim.lsp.buf.code_action()` |
| `<leader>cr` | `n` | Rename Symbol | `vim.lsp.buf.rename()` |
| `<leader>cd` | `n` | Show Line Diagnostics | `vim.diagnostic.open_float()` |
| `[d` | `n` | Previous Diagnostic | `vim.diagnostic.goto_prev()` |
| `]d` | `n` | Next Diagnostic | `vim.diagnostic.goto_next()` |

---

## 🛠️ Language Server Protocol (LSP) Configuration

The configuration uses Neovim native LSP integration with automatic Mason installation:

* **TypeScript / JavaScript**: `vtsls` (with `maxTsServerMemory = 4000`, `workspaceDiagnostics = false`, and `@vue/typescript-plugin` hybrid mode)
* **Vue 3**: `vue_ls` (`volar` / `@vue/language-server`)

To manage or install additional language servers:
```vim
:Mason
```

---

## 📋 System Requirements & Recommended Tools

* **Ripgrep** (`rg`): Fast grep search (`brew install ripgrep`)
* **FZF** (`fzf`): Command-line fuzzy finder (`brew install fzf`)
* **FD** (`fd`): Fast file finder (`brew install fd`)
* **Lazygit**: Terminal UI for git (`brew install lazygit`)
* **Nerd Font**: For icons in files, statuscolumn, and UI (e.g., *JetBrainsMono Nerd Font*)
