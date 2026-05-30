local dap = require("dap")
local dapui = require("dapui")

dapui.setup()

require("mason-nvim-dap").setup({
  ensure_installed = { "php-debug-adapter" },
  automatic_installation = true,
})

dap.adapters.php = {
  type = "executable",
  command = "php-debug-adapter",
}

dap.configurations.php = {
  {
    type = "php",
    request = "launch",
    name = "Listen for Xdebug",
    port = 9003,
  },
}

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.disconnect["dapui_config"] = function()
  dapui.close()
end
