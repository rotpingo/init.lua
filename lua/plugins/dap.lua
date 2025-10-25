return {
	{
		"mfussenegger/nvim-dap",
		lazy = false,
		config = function()
			local dap = require("dap")

			dap.set_log_level("DEBUG")

			vim.keymap.set("n", "<F8>", dap.continue, { desc = "Debug: Continue" })
			vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Debug: Step Over" })
			vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Debug: Step Into" })
			vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Debug: Step Out" })
			vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
			vim.keymap.set("n", "<leader>B", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, { desc = "Debug: Set Conditional Breakpoint" })
		end,
	},
	-- Optional: UI enhancements for DAP (highly recommended for better experience)
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup() -- Basic UI setup

			-- Auto-open/close UI on debug events
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},

	-- Example Adapter: For Python (add more for other languages as needed)
	-- {
	-- 	"mfussenegger/nvim-dap-python",
	-- 	ft = "python", -- Load only for Python files
	-- 	dependencies = {
	-- 		"mfussenegger/nvim-dap",
	-- 		"nvim-neotest/nvim-nio",
	-- 	},
	-- 	config = function()
	-- 		local path = require("mason-registry").get_package("debugpy"):get_install_path()
	-- 		require("dap-python").setup(path .. "/venv/bin/python")
	-- 	end,
	-- },

	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-nvim-dap").setup({
				ensure_installed = {
					"delve",
				},
				automatic_installation = true,
				handlers = {
					function(config)
						require("mason-nvim-dap").default_setup(config)
					end,
					delve = function(config)
						table.insert(config.configurations, 1, {
							args = function()
								return vim.split(vim.fn.input("args> "), " ")
							end,
							type = "delve",
							name = "file",
							request = "launch",
							program = "${file}",
							outputMode = "remote",
						})
						table.insert(config.configurations, 1, {
							args = function()
								return vim.split(vim.fn.input("args> "), " ")
							end,
							type = "delve",
							name = "file args",
							request = "launch",
							program = "${file}",
							outputMode = "remote",
						})
						require("mason-nvim-dap").default_setup(config)
					end,
				},
			})
		end,
	},
}
