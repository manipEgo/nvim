-- ref: https://martinlwx.github.io/zh-cn/config-neovim-from-scratch/

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

require("config.lazy")
require("options")
require("keymaps")
require("lsp")
require("colorscheme")
