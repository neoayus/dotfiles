-- Disable built-in Netrw
vim.g.loaded_netrw = 1 
vim.g.loaded_netrwPlugin = 1 

-- Set up nvim-tree
require("nvim-tree").setup {
    view = {
        width = 30,
        side = 'left',
    },
    -- Disable icons
    renderer = {
        icons = {
            show = {
                file = false,   -- Disable file icons
                folder = false, -- Disable folder icons
                git = false,    -- Disable git icons
            },
        },
    },
    -- Optional settings
    sort_by = "name",
    hijack_netrw = true,
    filters = {
        dotfiles = false,
        custom = { ".git", "node_modules" },
    },
}

-- Key mapping for toggling nvim-tree
vim.keymap.set('n', '<C-n>', ':NvimTreeFindFileToggle<CR>', { noremap = true, silent = true })

