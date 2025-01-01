-- Basic settings
vim.opt.guicursor = ""
vim.opt.scrolloff = 8

-- setting up map leader key
vim.g.mapleader = ' ' 
vim.g.maplocalleader = ' ' 

-- show statusline
vim.opt.showcmd = true 
vim.opt.laststatus = 4 

-- cursor line 
vim.opt.cursorline = true 

-- auto save 
vim.opt.autowrite = true
vim.opt.autoread = true 

-- relative line number 
vim.opt.number = true 
vim.opt.relativenumber = true 

-- use spaces for tabs and whatnot 
vim.opt.tabstop = 4 
vim.opt.softtabstop = 4 
vim.opt.shiftwidth = 4
vim.opt.shiftround = true 
vim.opt.expandtab = true 

-- indentation and syntax
vim.opt.smartindent = true

-- Enable syntax highlighting (only needed if not using Neovim's built-in LSP)
vim.cmd("syntax on")

-- Enable filetype-based settings
vim.cmd("filetype on")
vim.cmd("filetype plugin on")
vim.cmd("filetype indent on")


-- for polygot 
vim.opt.compatible = false    -- Support for syntax plugins like polyglot


                        -- re-maps --

-- Key remaps
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Sourcing init.vim
keymap('n', '<leader><CR>', ':so ~/.config/nvim/init.lua<CR>', opts)

-- Window splits
keymap('n', '<leader>pv', ':Vex<CR>', opts)
keymap('n', '<leader>ph', ':Sex<CR>', opts)

-- Fuzzy finder setup
keymap('n', '<C-p>', ':GFiles<CR>', opts)
keymap('n', '<leader>pf', ':Files<CR>', opts)

-- Increment/Decrement with Alt in normal and visual modes
keymap('n', '<A-a>', '<C-a>', opts)
keymap('n', '<A-x>', '<C-x>', opts)
keymap('v', '<A-a>', 'g<C-a>', opts)
keymap('v', '<A-x>', 'g<C-x>', opts)

-- Clipboard and paste mappings
keymap('v', '<leader>p', '"_dP', opts)
keymap('v', '<leader>y', '"+y', opts)
keymap('n', '<leader>y', '"+y', opts)
keymap('n', '<leader>Y', 'gg"+yG', opts)

-- Move code up and down in visual mode
keymap('v', 'J', ":m '>+1<CR>gv=gv", opts)
keymap('v', 'K', ":m '<-2<CR>gv=gv", opts)

-- remove highlight 
keymap('n', '<leader>h', ':nohlsearch<CR>', opts)

