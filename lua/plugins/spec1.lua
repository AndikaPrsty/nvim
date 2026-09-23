return {
  { "folke/which-key.nvim", lazy = true },

  {
    "nvim-neorg/neorg",
    ft = "norg",
    opts = {
      load = {
        ["core.defaults"] = {},
      },
    },
  },

  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    init = function()
      vim.g.startuptime_tries = 10
    end,
  },

  {
    "j-hui/fidget.nvim",
    opts = {
      notification = {
        window = {
          winblend = 0,
        },
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSUpdate", "TSInstall", "TSLog" },
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "typescript",
        "tsx",
        "vue",
        "yaml",
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },

  { "nvim-tree/nvim-web-devicons", lazy = true },
  { "stevearc/dressing.nvim", event = "VeryLazy" },

  {
    "Wansmer/treesj",
    keys = {
      { "J", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
    },
    opts = { use_default_keymaps = false, max_join_length = 150 },
  },

  {
    "monaqa/dial.nvim",
    keys = { "<C-a>", { "<C-x>", mode = "n" } },
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")

      mason.setup()
      mason_lspconfig.setup({
        ensure_installed = { "vtsls", "vue_ls" },
        automatic_installation = true,
      })

      -- Disable ts_ls: we use vtsls instead (it is faster and has Vue plugin support)
      if vim.lsp.enable then
        vim.lsp.enable("ts_ls", false)
      end

      -- Setup LSP Capabilities for nvim-cmp
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local ok_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      if ok_cmp then
        capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
      end

      -- Locate Vue Language Server for TS plugin
      local mason_registry = require("mason-registry")
      local vue_language_server_path = ""
      if mason_registry.is_installed("vue-language-server") then
        vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
          .. "/node_modules/@vue/language-server"
      else
        vue_language_server_path = vim.fn.stdpath("data")
          .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"
      end

      -- 1. Configure vtsls (Fast TypeScript server + Vue hybrid integration)
      lspconfig.vtsls.setup({
        capabilities = capabilities,
        filetypes = {
          "javascript",
          "javascriptreact",
          "javascript.jsx",
          "typescript",
          "typescriptreact",
          "typescript.tsx",
          "vue",
        },
        settings = {
          typescript = {
            tsserver = {
              maxTsServerMemory = 4000,
            },
          },
          vtsls = {
            autoUseWorkspaceTsdk = false,
            experimental = {
              workspaceDiagnostics = false,
            },
            tsserver = {
              globalPlugins = {
                {
                  name = "@vue/typescript-plugin",
                  location = vue_language_server_path,
                  languages = { "vue" },
                  configNamespace = "typescript",
                  enableForWorkspaceTypeScriptVersions = true,
                },
              },
            },
          },
        },
      })

      -- 2. Configure Vue Language Server (vue_ls)
      lspconfig.vue_ls.setup({
        capabilities = capabilities,
        filetypes = { "vue" },
      })

      -- 3. Global LSP Keybindings on LspAttach
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end

          -- Helper to use fzf-lua if available, fallback to vim.lsp.buf
          local has_fzf, fzf = pcall(require, "fzf-lua")

          map("gd", function()
            if has_fzf then
              fzf.lsp_definitions({ jump1 = true })
            else
              vim.lsp.buf.definition()
            end
          end, "Goto Definition")

          map("gr", function()
            if has_fzf then
              fzf.lsp_references({ jump1 = true, ignore_current_line = true })
            else
              vim.lsp.buf.references()
            end
          end, "Goto References")

          map("gI", function()
            if has_fzf then
              fzf.lsp_implementations({ jump1 = true })
            else
              vim.lsp.buf.implementation()
            end
          end, "Goto Implementation")

          map("gy", function()
            if has_fzf then
              fzf.lsp_typedefs({ jump1 = true })
            else
              vim.lsp.buf.type_definition()
            end
          end, "Goto Type Definition")

          map("gD", vim.lsp.buf.declaration, "Goto Declaration")
          map("K", vim.lsp.buf.hover, "Hover Documentation")
          map("gK", vim.lsp.buf.signature_help, "Signature Help")
          map("<leader>cr", vim.lsp.buf.rename, "Rename Symbol")

          map("<leader>ca", function()
            if has_fzf then
              fzf.lsp_code_actions()
            else
              vim.lsp.buf.code_action()
            end
          end, "Code Action")

          map("<leader>cd", vim.diagnostic.open_float, "Line Diagnostics")
          map("[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
          map("]d", vim.diagnostic.goto_next, "Next Diagnostic")
        end,
      })
    end,
  },
}
