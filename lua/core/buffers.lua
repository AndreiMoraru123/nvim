-- Navigate through buffers
vim.api.nvim_set_keymap('n', '<leader>nb', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>pb', ':bprevious<CR>', { noremap = true, silent = true })

-- Switch between the current and previous buffer.
vim.api.nvim_set_keymap('n', '<leader><Tab>', ':b#<CR>', { noremap = true, silent = true })

-- Delete all buffers
vim.api.nvim_set_keymap('n', '<leader>bd', ':bdelete<CR>', { noremap = true, silent = true })

-- Delete all other buffers (but not the current one)
vim.api.nvim_set_keymap('n', '<leader>bo', ':%bd|e#|bd#<CR>', { noremap = true, silent = true })

-- Stop the current terminal process
vim.api.nvim_set_keymap('t', '<C-c>', '<C-\\><C-n>:call jobstop(&channel)<CR>', { noremap = true, silent = true })
