local builtin = require('telescope.builtin')

-- Move line
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { desc = 'Move line down' })
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', { desc = 'Move line up' })
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

-- Mason
vim.keymap.set('n', '<Leader>mm', '<Cmd>Mason<CR>', { desc = 'Open [m]ason [m]enu' })

-- Telescope
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- DAP
vim.keymap.set("n", "<F5>", function() require("dap").continue() end, { desc = "DAP continue" })
vim.keymap.set("n", "<F8>", function() require("dap").step_over() end, { desc = "DAP step over" })
vim.keymap.set("n", "<F7>", function() require("dap").step_into() end, { desc = "DAP step into" })
vim.keymap.set("n", "<S-F8>", function() require("dap").step_out() end, { desc = "DAP step out" })
vim.keymap.set("n", "<Leader>db", function() require("dap").toggle_breakpoint() end, { desc = "Toggle [b]reakpoint" })
vim.keymap.set("n", "<Leader>dB", function() require("dap").set_breakpoint() end, { desc = "[B]reakpoint (conditional)" })
vim.keymap.set("n", "<Leader>dc", function() require("dap").run_to_cursor() end, { desc = "Run to [c]ursor" })
vim.keymap.set("n", "<Leader>dq", function() require("dap").disconnect() end, { desc = "Disconnect debugger" })
vim.keymap.set("n", "<Leader>dQ", function() require("dap").close() end, { desc = "Close debug adapter" })
