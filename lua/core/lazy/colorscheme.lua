function ColorMyPencils(color)
    color = color or "ayu"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    "Shatur/neovim-ayu",
    cond = not vim.g.vscode,
    config = function()
        require('ayu').setup({
            mirage = false,
            terminal = true,
        })
        ColorMyPencils()
    end
}
