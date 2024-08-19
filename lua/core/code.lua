-- Run python file
vim.keymap.set('n', '<leader>py', "<Cmd>lua require('vscode').action('python.execInTerminal')<CR>",
    { noremap = true, silent = true })

-- Debug python file
vim.keymap.set('n', '<leader>pd', "<Cmd>lua require('vscode').action('python.debugInTerminal')<CR>",
    { noremap = true, silent = true })

-- Continue debugging
vim.keymap.set('n', '<leader>c',
    "<Cmd>lua require('vscode').action('workbench.action.debug.continue')<CR>",
    { noremap = true, silent = true })

-- Step over (next)
vim.keymap.set('n', '<leader>n',
    "<Cmd>lua require('vscode').action('workbench.action.debug.stepOver')<CR>",
    { noremap = true, silent = true })

-- Step into
vim.keymap.set('n', '<leader>s',
    "<Cmd>lua require('vscode').action('workbench.action.debug.stepInto')<CR>",
    { noremap = true, silent = true })

-- Step out
vim.keymap.set('n', '<leader>o',
    "<Cmd>lua require('vscode').action('workbench.action.debug.stepOut')<CR>",
    { noremap = true, silent = true })

-- jump to cursor
vim.keymap.set('n', '<leader>j',
    "<Cmd>lua require('vscode').action('debug.jumpToCursor')<CR>",
    { noremap = true, silent = true })

-- Restart debugging
vim.keymap.set('n', '<leader>r',
    "<Cmd>lua require('vscode').action('workbench.action.debug.restart')<CR>",
    { noremap = true, silent = true })

-- Stop debugging
vim.keymap.set('n', '<leader>q',
    "<Cmd>lua require('vscode').action('workbench.action.debug.stop')<CR>", { noremap = true, silent = true })

-- Set breakpoint
vim.keymap.set('n', '\\b',
    "<Cmd>lua require('vscode').action('editor.debug.action.toggleBreakpoint')<CR>",
    { noremap = true, silent = true })

-- Format document
vim.keymap.set('n', '<leader>f',
    "<Cmd>lua require('vscode').action('editor.action.formatDocument')<CR>", { noremap = true, silent = true })

-- Test at cursor
vim.keymap.set('n', '<leader>t', "<Cmd>lua require('vscode').action('testing.runAtCursor')<CR>",
    { noremap = true, silent = true })

-- Debug test at cursor
vim.keymap.set('n', '<leader>dt', "<Cmd>lua require('vscode').action('testing.debugAtCursor')<CR>",
    { noremap = true, silent = true })

-- Test current file
vim.keymap.set('n', '<leader>tf', "<Cmd>lua require('vscode').action('testing.runCurrentFile')<CR>",
    { noremap = true, silent = true })

-- Debug tests in current file
vim.keymap.set('n', '<leader>dtf', "<Cmd>lua require('vscode').action('testing.debugCurrentFile')<CR>",
    { noremap = true, silent = true })

-- Test all
vim.keymap.set('n', '<leader>tt', "<Cmd>lua require('vscode').action('testing.runAll')<CR>",
    { noremap = true, silent = true })

-- Debug all tests
vim.keymap.set('n', '<leader>dtt', "<Cmd>lua require('vscode').action('testing.debugAll')<CR>",
    { noremap = true, silent = true })

-- Configure python tests
vim.keymap.set('n', '<leader>pt', "<Cmd>lua require('vscode').action('python.configureTests')<CR>",
    { noremap = true, silent = true })

-- Zen mode
vim.keymap.set('n', '<leader>zz',
    "<Cmd>lua require('vscode').action('workbench.action.toggleZenMode')<CR>",
    { noremap = true, silent = true })
