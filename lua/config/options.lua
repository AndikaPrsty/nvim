-- Options are automatically loaded before lazy.nvim startup

local opt = vim.opt

-- Ensure Mason binaries are on Neovim PATH
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. (vim.env.PATH or "")

-- Sync clipboard with OS system clipboard (pbcopy / pbpaste on macOS)
opt.clipboard = "unnamedplus"

-- Line numbers (hybrid relative numbering)
opt.number = true
opt.relativenumber = true

-- Tabs & Indentation (2 spaces)
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true
