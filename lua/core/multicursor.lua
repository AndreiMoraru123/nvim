local M = {}

function M.setup(opts)
    local mc = require("vscode-multi-cursor")

    mc.setup(opts)

    vim.keymap.set({ "n", "x" }, "gl", function()
        mc.addSelectionToNextFindMatch()
    end, {
        silent = true,
        desc = "Multi-cursor: add next match",
    })

    vim.keymap.set({ "n", "x" }, "gL", function()
        mc.addSelectionToPreviousFindMatch()
    end, {
        silent = true,
        desc = "Multi-cursor: add previous match",
    })

    vim.keymap.set({ "n", "x" }, "ga", function()
        mc.selectHighlights()
    end, {
        silent = true,
        desc = "Multi-cursor: select all matches",
    })

    vim.keymap.set("x", "gA", function()
        mc.start_right({ no_selection = true })
    end, {
        silent = true,
        desc = "Multi-cursor: line ends",
    })

    vim.keymap.set("x", "gI", function()
        mc.start_left_edge({ no_selection = true })
    end, {
        silent = true,
        desc = "Multi-cursor: line starts",
    })

    vim.keymap.set("n", "<leader>w", "mciw*<Cmd>nohl<CR>", {
        remap = true,
        silent = true,
        desc = "Multi-cursor: add word and jump next",
    })
end

return M
