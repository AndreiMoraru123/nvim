return {
    'nvimdev/lspsaga.nvim',
    config = function()
        require('lspsaga').setup({
            lightbulb = {
                enable = false,
            }
        })
        vim.api.nvim_set_keymap('n', '<leader>ic', ':Lspsaga incoming_calls<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<leader>oc', ':Lspsaga outgoing_calls<CR>', { noremap = true, silent = true })

        vim.api.nvim_set_keymap('n', 'gd', ':Lspsaga goto_definition<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', 'gD', ':Lspsaga peek_definition<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', 'gt', ':Lspsaga goto_type_definition<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', 'gT', ':Lspsaga peek_type_definition<CR>', { noremap = true, silent = true })

        vim.api.nvim_set_keymap('n', 'K', ':Lspsaga hover_doc<CR>', { noremap = true, silent = true })

        vim.api.nvim_set_keymap('n', '<leader>ca', ':Lspsaga code_action<CR>', { noremap = true, silent = true })

        vim.api.nvim_set_keymap('n', '<C-l>', ':Lspsaga show_line_diagnostics<CR>',
            { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<C-h>', ':Lspsaga show_cursor_diagnostics<CR>',
            { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<C-w>', ':Lspsaga show_workspace_diagnostics<CR>',
            { noremap = true, silent = true })

        vim.api.nvim_set_keymap('n', '[d', ':Lspsaga diagnostic_jump_next<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', ']d', ':Lspsaga diagnostic_jump_prev<CR>', { noremap = true, silent = true })

        vim.api.nvim_set_keymap('n', '<A-d>', ':Lspsaga term_toggle<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('t', '<A-d>', ':Lspsaga term_toggle<CR>', { noremap = true, silent = true })

        vim.api.nvim_set_keymap('n', '<leader>rn', ':Lspsaga rename<CR>', { noremap = true, silent = true })

        vim.api.nvim_set_keymap('n', 'gF', ':Lspsaga finder<CR>', { noremap = true, silent = true })

        vim.api.nvim_set_keymap('n', '<leader>o', ':Lspsaga outline<CR>', { noremap = true, silent = true })
    end,
    cond = not vim.g.vscode,
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons'
    }
}
