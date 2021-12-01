-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedarker"
lvim.builtin.bufferline.active = false
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.dap.active = true

-- lvim.builtin.dashboard.custom_section[0] = { description = { " Todos!" }, command = ":e ~/todos.md" }

-- table.insert(vim.g.dashboard_custom_section,  { description = { " Todos!" }, command = ":e ~/todos.md" })
-- local dashboard_func = function()
-- 	table.insert(vim.g.dashboard_custom_section, { g = { description = { " Todos!" }, command = ":e ~/todos.md" } })
-- 	vim.g.dashboard_custom_section["k"] = { description = { "hello", command = ":e" } }
-- 	print("hello")
-- end
-- lvim.builtin.dashboard.on_config_done = dashboard_func

local ds = lvim.builtin.dashboard.custom_section
ds.g = { description = { "✓  Org                 " }, command = ":e ~/org.norg" }

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "\\"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<leader>t"] = ":NvimTreeToggle<cr>"
lvim.keys.normal_mode["<leader>c"] = ":<C-U>bprevious <bar> bdelete #<CR>"
lvim.keys.normal_mode["<esc><esc>"] = "<cmd>nohlsearch<cr>"
lvim.keys.normal_mode["<S-h>"] = ""
lvim.keys.normal_mode["<S-l>"] = ""
lvim.keys.term_mode["<esc>"] = "<C-\\><C-n>"

lvim.builtin.which_key.mappings["c"] = { "<cmd>bprevious <bar> bdelete! #<CR>", "Close Buffer" }
lvim.builtin.which_key.mappings["o"] = { "<cmd>SymbolsOutline<CR>", "Show Symbols Tree" }
lvim.builtin.which_key.mappings["da"] = { "<cmd>lua require('dapui').toggle()<CR>", "Toggle UI" }
lvim.builtin.which_key.mappings["lR"] = { "<cmd>lua vim.lsp.buf.references()<cr>", "Find references" }

lvim.builtin.which_key.mappings["zz"] = { "<cmd>ZenMode<cr>", "Zen" }
lvim.builtin.which_key.mappings["zl"] = { "<cmd>colorscheme gruvbox|set bg=light<cr>", "light color" }
lvim.builtin.which_key.mappings["zd"] = { "<cmd>colorscheme tokyonight|set bg=dark<cr>", "dark color" }
lvim.builtin.which_key.mappings["zt"] = { "<cmd>Twilight<cr>", "Twilight" }
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["T"] = {
	name = "+Trouble",
	r = { "<cmd>Trouble lsp_references<cr>", "References" },
	f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
	d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
	q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
	l = { "<cmd>Trouble loclist<cr>", "LocationList" },
	w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
}

-- LSP
lvim.lsp.diagnostics.virtual_text = false

lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"c",
	"javascript",
	"json",
	"lua",
	"python",
	"typescript",
	"css",
	"rust",
	"java",
	"yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.indent.disable = { "python" }
lvim.builtin.treesitter.autotag.enable = true

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ exe = "black", filetypes = { "python" } },
	{ exe = "stylua", filetypes = { "lua" } },
	{
		exe = "prettier",
		filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
	},
})

local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{ exe = "flake8", filetypes = { "python" }, args = { "--max-line-length=88", "--ignore=E203" } },
})

-- Additional Plugins
lvim.plugins = {
	{ "lunarvim/colorschemes" },
	{ "folke/tokyonight.nvim" },
	{
		"folke/trouble.nvim",
		cmd = "TroubleToggle",
	},
	{
		"akinsho/nvim-bufferline.lua",
		config = function()
			require("user.bufferline").config()
		end,
	},
	{
		"simrat39/symbols-outline.nvim",
		-- cmd = "SymbolsOutline",
		config = function()
			require("user.outline").config()
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "InsertEnter",
		config = function()
			require("user.lsp_signature").config()
		end,
	},
	{ "mfussenegger/nvim-dap-python" },
	{ "leoluz/nvim-dap-go" },
	{ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } },
	{
		"folke/zen-mode.nvim",
		config = function()
			require("user.zen").config()
		end,
	},
	{
		"folke/twilight.nvim",
		config = function()
			require("user.twilight").config()
		end,
		cmd = "ZenMode",
	},
	{
		"nvim-neorg/neorg",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("neorg").setup({
				-- Tell Neorg what modules to load
				load = {
					["core.defaults"] = {}, -- Load all the default modules
					["core.norg.concealer"] = {}, -- Allows for use of icons
					["core.norg.dirman"] = { -- Manage your directories with Neorg
						config = {
							workspaces = {
								my_workspace = "~/neorg",
							},
						},
					},
				},
			})
			local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

			parser_configs.norg = {
				install_info = {
					url = "https://github.com/nvim-neorg/tree-sitter-norg",
					files = { "src/parser.c", "src/scanner.cc" },
					branch = "main",
				},
			}
		end,
	},
	{ "shaunsingh/nord.nvim" },
	{ "ggandor/lightspeed.nvim" },
	-- { "ChristianChiarulli/nvcode-color-schemes.vim" },
	{ "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } },
	-- { "projekt0n/github-nvim-theme" },
	{ "sindrets/diffview.nvim" },
	{ "tpope/vim-dadbod" },
	{ "kristijanhusak/vim-dadbod-ui", requires = { "tpope/vim-dadbod" } },
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("user.autotag").config()
		end,
	},
	{ "ChristianChiarulli/nvim-ts-rainbow" },
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }

require("telescope").load_extension("fzf")

require("dapui").setup()

-- require("github-theme").setup()

lvim.colorscheme = "tokyonight"

--
-- Activate LunarVim tailwindcss lsp configuration only
-- if project seems to have a tailwindcss dependency
--

local utils = require("user.utils")
local project_has_tailwindcss_dependency = function()
	return (vim.fn.glob("tailwind*") ~= "" or utils.is_in_package_json("tailwindcss"))
end

if project_has_tailwindcss_dependency() == true then
	require("lvim.lsp.manager").setup("tailwindcss")
end
