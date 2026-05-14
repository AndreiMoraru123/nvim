function ColorMyPencils(color)
    color = color or "norrsken"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    "webhooked/norrsken.nvim",
    cond = not vim.g.vscode,
    config = function()
        require('norrsken').setup({
            transparent_bg = true,
        })
        ColorMyPencils()
    end
}
