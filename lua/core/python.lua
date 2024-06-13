-- Run the current file with python
vim.api.nvim_set_keymap('n', '<leader>py', ':belowright split | terminal python %<CR>',
    { noremap = true, silent = true })

-- Run pytest on the current file
vim.api.nvim_set_keymap('n', '<leader>pt', ':belowright split | terminal pytest %<CR>',
    { noremap = true, silent = true })

-- Function to get root directory (assumes a git directory indicates the root)
local function get_git_root()
    return vim.fn.systemlist("git rev-parse --show-toplevel")[1]
end

-- Run pylint on the current file
vim.api.nvim_set_keymap('n', '<leader>pl',
    ':belowright split | terminal pylint --rcfile=' .. get_git_root() .. '/pyproject.toml %<CR>',
    { noremap = true, silent = true })

-- Run pydocstyle on the current file with the Google convention
vim.api.nvim_set_keymap('n', '<leader>pd', ':belowright split | terminal pydocstyle --convention=google %<CR>',
    { noremap = true, silent = true })

-- Run black on the current file
vim.api.nvim_set_keymap('n', '<leader>bl', ':!black --config ' .. get_git_root() .. '/pyproject.toml %<CR>',
    { noremap = true, silent = true })

-- Automatically change the working directory to the directory of the current Python file whenever a new Python file is opened
vim.cmd('autocmd FileType python cd %:p:h')
