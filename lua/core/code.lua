local vscode = require('vscode')

-- Run python file
vim.keymap.set('n', '<leader>py', function() vscode.action('python.execInTerminal') end,
    { noremap = true, silent = true })

-- Debug python file
vim.keymap.set('n', '<leader>pd', function() vscode.action('python.debugInTerminal') end,
    { noremap = true, silent = true })

-- Continue debugging
vim.keymap.set('n', '<leader>c', function() vscode.action('workbench.action.debug.continue') end,
    { noremap = true, silent = true })

-- Step over (next)
vim.keymap.set('n', '<leader>n', function() vscode.action('workbench.action.debug.stepOver') end,
    { noremap = true, silent = true })

-- Step into
vim.keymap.set('n', '<leader>s', function() vscode.action('workbench.action.debug.stepInto') end,
    { noremap = true, silent = true })

-- Step out
vim.keymap.set('n', '<leader>o', function() vscode.action('workbench.action.debug.stepOut') end,
    { noremap = true, silent = true })

-- Jump to cursor
vim.keymap.set('n', '<leader>j', function() vscode.action('debug.jumpToCursor') end,
    { noremap = true, silent = true })

-- Restart debugging
vim.keymap.set('n', '<leader>r', function() vscode.action('workbench.action.debug.restart') end,
    { noremap = true, silent = true })

-- Stop debugging
vim.keymap.set('n', '<leader>q', function() vscode.action('workbench.action.debug.stop') end,
    { noremap = true, silent = true })

-- Set breakpoint
vim.keymap.set('n', '\\b', function() vscode.action('editor.debug.action.toggleBreakpoint') end,
    { noremap = true, silent = true })

-- Format document
vim.keymap.set('n', '<leader>f', function() vscode.action('editor.action.formatDocument') end,
    { noremap = true, silent = true })

-- Test at cursor
vim.keymap.set('n', '<leader>t', function() vscode.action('testing.runAtCursor') end,
    { noremap = true, silent = true })

-- Debug test at cursor
vim.keymap.set('n', '<leader>d', function() vscode.action('testing.debugAtCursor') end,
    { noremap = true, silent = true })

-- Test current file
vim.keymap.set('n', '<C-t>', function() vscode.action('testing.runCurrentFile') end,
    { noremap = true, silent = true })

-- Configure python tests
vim.keymap.set('n', '<leader>pt', function() vscode.action('python.configureTests') end,
    { noremap = true, silent = true })

-- Zen mode
vim.keymap.set('n', '<leader>zz', function() vscode.action('workbench.action.toggleZenMode') end,
    { noremap = true, silent = true })
