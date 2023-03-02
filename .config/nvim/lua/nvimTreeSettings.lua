-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()



-- Set Nvim-Tree configuration options
--let g:nvim_tree_ignore = ['.git', 'node_modules', '.cache']
--let g:nvim_tree_highlight_opened_files = 1
--let g:nvim_tree_auto_close = 1
--let g:nvim_tree_width = 30
