vim.pack.add({"https://github.com/folke/tokyonight.nvim.git"})
require("tokyonight").setup({
  transparent = true,
})
vim.cmd[[colorscheme tokyonight]]
