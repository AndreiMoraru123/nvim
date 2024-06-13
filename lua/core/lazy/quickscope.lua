return {
    "unblevable/quick-scope",
    event = "VeryLazy",
    config = function()
        vim.api.nvim_set_hl(0, "QuickScopePrimary",
            { fg = '#afff5f', underline = true, ctermfg = 155, cterm = { underline = true } })
        vim.api.nvim_set_hl(0, "QuickScopeSecondary",
            { fg = '#5fffff', underline = true, ctermfg = 81, cterm = { underline = true } })
    end
}
