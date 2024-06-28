local notify = require("notify")

notify.setup({
  render = "default"
})

vim.notify = notify

notify("Welcome to Neovim - the new-life text editor", "info", {
  title = "Have a good day, Mint!"
})

