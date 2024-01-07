-- Sane defaults
vim.opt.scrolloff = 8
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.guicursor = ""
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true

local augroup = vim.api.nvim_create_augroup
local core_group = augroup('WhiteSpace', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 100,
        })
    end,
})

autocmd({ "BufWritePre" }, {
    group = core_group,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

if not vim.g.vscode then
    autocmd('LspAttach', {
        group = core_group,
        callback = function(e)
            local opts = { buffer = e.buf }
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "<C-]>", vim.lsp.buf.definition, opts)

            vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

            vim.keymap.set("n", "gO", vim.lsp.buf.workspace_symbol, opts)

            vim.keymap.set("n", "gD", function()
                vim.cmd("vsplit"); vim.lsp.buf.definition()
            end, opts)

            vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)

            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

            vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, opts)

            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

            vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)

            vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
        end,
    })

    vim.g.netrw_browse_split = 0
    vim.g.netrw_banner = 0
    vim.g.netrw_winsize = 25
end
