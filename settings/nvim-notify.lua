local notify = require("notify")

notify.setup({
  render = "default"
})

vim.notify = require("notify")

notify("Welcome to Neovim - the new-life text editor", "info", {
  title = "Have a good day, Mint!"
})

