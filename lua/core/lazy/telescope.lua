return {
    "nvim-telescope/telescope.nvim",
    dependencies = { 'plenary.nvim' },
    cond = not vim.g.vscode,
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<C-p>', builtin.find_files, {})
        vim.keymap.set('n', '<C-f>', builtin.live_grep, {})
        vim.keymap.set('n', '<C-b>', builtin.buffers, {})
    end
}
