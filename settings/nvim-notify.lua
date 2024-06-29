local notify = require("notify")

notify.setup({
  render = "default"
})

vim.notify = require("notify")

notify("Welcome to Neovim - the new-life text editor", "info", {
  title = "Have a good day, Mint!"
})

local ok, ntfy = pcall(require, "notify")
if not ok then
    return
end
ntfy.setup()
if not old_print then
    old_print = _G.print
end
vim.notify = function(msg, level, opts)
    old_print(tostring(level) .. ": " .. msg .. " : " .. vim.inspect(opts))
    ntfy(msg, level, opts)
end
print = function(...)
    local print_safe_args = {}
    local _ = { ... }
    for i = 1, #_ do
        table.insert(print_safe_args, tostring(_[i]))
    end
    vim.notify(table.concat(print_safe_args, ' '), "info")
end
