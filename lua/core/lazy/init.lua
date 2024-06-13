return {
    {
        "nvim-lua/plenary.nvim",
        cond = not vim.g.vscode,
    },
    {
        "tpope/vim-commentary",
        cond = not vim.g.vscode
    },
    {
        "preservim/nerdtree",
        cond = not vim.g.vscode,
        event = "VeryLazy",
    },
    {
        "bryanmylee/vim-colorscheme-icons",
        cond = not vim.g.vscode
    },
    {
        "mbbill/undotree",
        cond = not vim.g.vscode
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        cond = not vim.g.vscode,
        opts = {},
    },
    {
        'vscode-neovim/vscode-multi-cursor.nvim',
        event = 'VeryLazy',
        cond = not not vim.g.vscode,
        opts = {
            default_mappings = true,
            no_selection = true
        },
    },
    {
        "github/copilot.vim",
        cond = not vim.g.vscode,
        event = "VeryLazy",
    },
    { "michaeljsmith/vim-indent-object" },
    { "justinmk/vim-sneak" },
    { "xiyaowong/fast-cursor-move.nvim" },
    {
        "ryanoasis/vim-devicons",
        cond = not vim.g.vscode,
        event = "VeryLazy",
    },
}
