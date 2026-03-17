function ColorMyPencils(color)
    color = color or "vesper"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    "datsfilipe/vesper.nvim",
    cond = not vim.g.vscode,
    config = function()
        vim.cmd("colorscheme vesper")
        require('vesper').setup({
            disable_background = true,
        })
        ColorMyPencils()
    end
}
