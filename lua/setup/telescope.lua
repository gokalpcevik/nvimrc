local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>pf', function()
    builtin.grep_string({search = vim.fn.input("Grep >")})
end)

vim.keymap.set('n', '<leader>cs', builtin.colorscheme)
vim.keymap.set('n', '<leader>ss', builtin.lsp_dynamic_workspace_symbols)
vim.keymap.set('n', '<leader>di', builtin.diagnostics)

