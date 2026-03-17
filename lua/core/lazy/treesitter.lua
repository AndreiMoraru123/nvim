return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    cond = not vim.g.vscode,
    config = function()
        require('nvim-treesitter').setup {
            ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query", "python", "bash", "prolog",
                "javascript", "typescript", "rust", "go", "jsonc", "markdown", "markdown_inline"
            },
            sync_install = false,
            auto_install = true,
            highlight = { enable = true, additional_vim_regex_highlighting = false },
            indent = { enable = true },
        }
    end
}
