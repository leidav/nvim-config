local dap = require('dap')
dap.adapters.lldb = {
	type = 'executable',
	command = '/usr/bin/lldb-vscode', -- must be absolute path
	name = 'lldb'
}
dap.adapters.c = dap.adapters.lldb
dap.adapters.cpp = dap.adapters.lldb

dap.configurations.cpp = {
	{
		name = 'Default C/C++/Rust Launch Settings',
		type = 'lldb',
		request = 'launch',
		program = function()
			local path = ""
			vim.ui.input({ prompt = 'Path to executable: ', default = vim.fn.getcwd() .. '/', completion = 'file' },
				function(input) path = input end)
			return path
		end,
		cwd = '${workspaceFolder}',
		stopOnEntry = false,
		args = {}
	}
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
vim.fn.sign_define('DapBreakpoint',
	{ text = '', texthl = '', linehl = '', numhl = '' })

local dapui = require("dapui")
dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

noremap("<F5>", function() require('dap.ext.vscode').load_launchjs()
	dap.continue()
end)

vim.api.nvim_create_user_command("DapUiToggle", function(args) dapui.toggle(args.args) end, {})

noremap("<Leader>s", function() dap.step_over() end)
noremap("<Leader>S", function() dap.step_into() end)
noremap("<Leader>b", function() dap.toggle_breakpoint() end)
