local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>pf', builtin.live_grep)
vim.keymap.set('n', '<leader>cs', builtin.colorscheme)
vim.keymap.set('n', '<leader>ss', builtin.lsp_dynamic_workspace_symbols)
vim.keymap.set('n', '<leader>di', builtin.diagnostics)
vim.keymap.set('n', '<leader>bb', builtin.buffers)


