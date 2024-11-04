function ColorMyPencils(color)
    color = color or "darkvoid"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    "aliqyan-21/darkvoid.nvim",
    cond = not vim.g.vscode,
    config = function()
        vim.cmd("colorscheme darkvoid")
        require('darkvoid').setup({
            transparent = true,
            glow = true,
            plugins = {
                gitsigns = true,
                nvim_cmp = true,
                treesitter = true,
                nvimtree = true,
                telescope = true,
                lualine = true,
                bufferline = true,
                oil = true,
                whichkey = true,
                nvim_notify = true,
            },
        })
        ColorMyPencils()
    end
}
