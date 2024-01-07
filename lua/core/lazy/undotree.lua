return {
    "mbbill/undotree",
    cond = not vim.g.vscode,
    event = "VeryLazy",
    config = function()
        vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle)
    end
}

