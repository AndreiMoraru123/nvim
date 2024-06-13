require('core.defaults')
require('core.remaps')
require('core.lazy_init')
if vim.g.vscode then
    require('core.code')
else
    require('core.buffers')
    require('core.python')
end
