vim.pack.add({
  {src = "https://github.com/stevearc/oil.nvim.git"},
})

require("oil").setup({
  columns = {
    "icon",
    "size",
  },
  view_options = {
    show_hidden = true,
  }
})
