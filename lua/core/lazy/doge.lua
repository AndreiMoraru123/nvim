return {
    "kkoomen/vim-doge",
    build = ':call doge#install()',
    cond = not vim.g.vscode,
    config = function()
        vim.g.doge_enable_mappings = 0
        vim.g.doge_doc_standard_python = 'google'
        vim.api.nvim_set_keymap('n', '<Leader>g', '<Plug>(doge-generate)', { noremap = true, silent = true })

        vim.api.nvim_set_keymap('n', '<S-TAB>', '<Plug>(doge-comment-jump-backward)', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('i', '<S-TAB>', '<Plug>(doge-comment-jump-backward)', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('s', '<S-TAB>', '<Plug>(doge-comment-jump-backward)', { noremap = true, silent = true })
    end
}
