-- file explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- tab management
vim.keymap.set("n", "tt", vim.cmd.tabnew)
--vim.keymap.set("n", "th", vim.cmd.tabprevious)
--vim.keymap.set("n", "tl", vim.cmd.tabnext)

-- terminal management
-- see: http://vimcasts.org/episodes/neovim-terminal-mappings/
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])
vim.keymap.set('t', [[<C-v><Esc>]], '<Esc>')
