vim.pack.add({
  { src = "https://github.com/nvim-lua/plenary.nvim.git" },
  { src = "https://github.com/nvim-telescope/telescope.nvim.git", version = "master" },
  { src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim.git", build = "make" },
})

require("telescope").setup({
  defaults = {
    preview = {
      treesitter = false,
    },
  },
})
