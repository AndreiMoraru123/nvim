-- Key mappings
vim.g.mapleader = " "
vim.keymap.set('n', '<leader>pv', ':Vex<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader><CR>', ':so C:/Users/MON1CLJ/AppData/Local/nvim/init.lua<CR>',
    { noremap = true, silent = true })

-- Move one line at a time up or down while selected
vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv', { noremap = true, silent = true })
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv', { noremap = true, silent = true })

-- Send current selection to null register so that pasting keeps the previous one in buffer
vim.keymap.set('v', '<leader>p', '"_dP', { noremap = true, silent = true })

-- Send yank to system clipboard
vim.keymap.set('v', '<leader>y', '"+y', { noremap = true, silent = true })

-- Send yank to system clipboard, but in normal mode, to allow extras (like selecting a whole paragraph)
vim.keymap.set('n', '<leader>y', '"+y', { noremap = true, silent = true })

-- Copy the whole file
vim.keymap.set('n', '<leader>Y', 'gg"+yG', { noremap = true, silent = true })

-- Uppercase the whole word
vim.keymap.set('n', '<Leader>u', 'viwU', { noremap = true, silent = true })

-- Lowercase the whole word
vim.keymap.set('n', '<Leader>l', 'viwu', { noremap = true, silent = true })

-- Leave cursor at the beginning after joining lines
vim.keymap.set("n", "J", "mzJ`z")

-- No capital Q
vim.keymap.set("n", "Q", "<nop>")

-- Sneak labels
vim.g['sneak#label'] = 1

-- Quick-scope
vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }

-- Annoying escape
vim.keymap.set("i", "<C-c>", "<Esc>")

if not vim.g.vscode then
    -- Copilot
    vim.keymap.set('i', '<C-/>', 'copilot#Accept("<CR>")', { expr = true, silent = true })

    -- Keep cursor in the middle when searching / navigating
    vim.keymap.set("n", "<C-d>", "<C-d>zz")
    vim.keymap.set("n", "<C-u>", "<C-u>zz")
    vim.keymap.set("n", "n", "nzzzv")
    vim.keymap.set("n", "N", "Nzzzv")

    -- Replace multiple words via menu
    vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

    -- Make file executable
    vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
else
    vim.keymap.set('n', '<leader>w', 'mciw*<Cmd>nohl<CR>', { remap = true })
end
