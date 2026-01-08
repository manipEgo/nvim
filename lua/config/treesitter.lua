require("nvim-treesitter").install({
	"bash",
	"javascript",
	"lua",
	"luadoc",
	"python",
	"vim",
  "vimdoc",
	"yaml",
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"bash",
		"javascript",
		"lua",
		"luadoc",
		"python",
		"vim",
    "vimdoc",
		"yaml",
	},
	callback = function()
		vim.treesitter.start()
	end,
})

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = {
--     'lua',
--     'python',
--     'javascript',
--     'yaml',
--   },
--   callback = function()
--     vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
--     vim.wo[0][0].foldmethod = 'expr'
--   end,
-- })
