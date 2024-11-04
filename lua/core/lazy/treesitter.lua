return {
    "nvim-treesitter/nvim-treesitter",

    build = ":TSUpdate",

    cond = not vim.g.vscode,

    config = function()
        require 'nvim-treesitter.configs'.setup {
            -- A list of parser names, or "all"
            ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query", "python", "bash", "prolog",
                "javascript", "typescript", "rust", "go", "jsonc", "markdown", "markdown_inline"
            },

            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
            auto_install = true,

            -- List of parsers to ignore installing (or "all")
            -- ignore_install = { "javascript" },

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },

            indent = {
                enable = true,
            },
        }
    end
}
