local lsp_zero = require('lsp-zero')
lsp_zero.extend_lspconfig()

-- LSP On attach
lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

require('mason-lspconfig').setup({
	ensure_installed = {},
	handlers = {
		lsp_zero.default_setup,
		lua_ls = function()
			local neodev_opts = require('setup.neodev')
			require('neodev').setup(neodev_opts)
			local lua_opts = lsp_zero.nvim_lua_ls()
			require('lspconfig').lua_ls.setup(lua_opts)
		end,
		clangd = function()
			require('lspconfig').clangd.setup({
				single_file_support = true
			})
		end
	}
})

vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
