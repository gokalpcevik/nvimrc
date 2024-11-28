-- No brainer?
vim.opt.number = true
-- Good for jumping around
vim.opt.relativenumber = true
-- I like to see where I'm at by the corner of my eye
vim.opt.cursorline = true

-- Tab related stuff
vim.opt.expandtab = true
-- Smart is good
vim.opt.smartindent = true
-- 2 is nice
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
-- Good for C-like languages!
vim.opt.autoindent = true
-- Modelines are dumb
vim.o.modeline = false

-- Many issues with wrapping text, I'd rather just hover to see what it is saying.
-- See *setup.lsp* for the hover part.
vim.diagnostic.config({
  virtual_text = false,
})


vim.o.updatetime = 500
