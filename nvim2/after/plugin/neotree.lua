local neotree = require("neo-tree")

neotree.setup({})

vim.keymap.set('n', '<F2>', vim.cmd.NeoTreeShowToggle)
