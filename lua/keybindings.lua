local map = require("utils").map

vim.g.mapleader = ' '

-- general
map('i', '<C-BS>', '<C-W')

-- wrap
map('n', '<Leader>w', '<C-w>w')
map('n', 'j', 'gj')
map('n', 'k', 'gk')

-- navigation
--- behave like other capitals
map('n', 'Y', 'y$')
--- keeping it centered
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
map('n', 'J', 'mzJ`z')
--- moving text
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("n", "<leader>k", ":m .-2<CR>==")
map("n", "<leader>j", ":m .+1<CR>==")

-- which key
-- map("n", "<Leader>", ":<C-u>WhichKey ','<CR>", { silent = true })
map("n", "<Leader>?", ":WhichKey<CR>")
map("n", "<Leader>a", ":cclose<CR>")

-- nvim tree
map("n", "<Leader>tt", "<cmd>NERDTreeToggle<cr>")
map("n", "<Leader>tf", "<cmd>NERDTreeFocus<cr>")

-- Telescope
map("n", "<Leader>ff", "<cmd>Telescope find_files<CR>")
map("n", "<Leader>fg", "<cmd>Telescope live_grep<CR>")
map("n", "<Leader>fb", "<cmd>Telescope buffers<CR>")
map("n", "<Leader>fh", "<cmd>Telescope help_tags<CR>")
map("n", "<Leader>ft", "<cmd>Telescope ctags_outline outline<CR>")

-- language server
map("n", "<Leader>vg", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "<Leader>vi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
map("n", "<Leader>vs", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
map("n", "<Leader>vr", "<cmd>lua vim.lsp.buf.references()<CR>")
map("n", "<Leader>vn", "<cmd>lua vim.lsp.buf.rename()<CR>")
map("n", "<Leader>vh", "<cmd>lua vim.lsp.buf.hover()<CR>")
map("n", "<Leader>vc", "<cmd>lua vim.lsp.buf.code_action()<CR>")
-- map("n", "<Leader>vf", "<cmd>Format<CR>")
map("n", "<Leader>vds", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
map("n", "<Leader>vdn", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
map("n", "<Leader>vdp", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
