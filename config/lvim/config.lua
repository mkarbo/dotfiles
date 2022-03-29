-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.builtin.bufferline.active = false
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.nvimtree.active = true
lvim.builtin.dap.active = true
lvim.builtin.alpha.active = true
lvim.builtin.project.active = false

lvim.builtin.telescope.defaults.initial_mode = "normal"

table.insert(lvim.builtin.project.detection_methods, "lsp")
table.insert(lvim.builtin.project.patterns, ".neovimproject")
table.insert(lvim.builtin.project.patterns, ".nvimproject")
table.insert(lvim.builtin.project.patterns, "pyproject.toml")

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "\\"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<leader>t"] = ":NvimTreeToggle<cr>"
lvim.keys.normal_mode["<leader>F"] = ":Telescope find_files<cr>"
lvim.keys.normal_mode["<leader>c"] = ":<C-U>bprevious <bar> bdelete #<CR>"
lvim.keys.normal_mode["<esc><esc>"] = "<cmd>nohlsearch<cr>"
lvim.keys.normal_mode["<S-h>"] = ""
lvim.keys.normal_mode["<S-l>"] = ""

lvim.keys.term_mode["<esc>"] = "<C-\\><C-n>"

lvim.keys.insert_mode["<C-k>"] = "<cmd>lua vim.lsp.buf.signature_help()<CR>"

lvim.builtin.which_key.mappings["c"] = { "<cmd>bprevious <bar> bdelete! #<CR>", "Close Buffer" }
lvim.builtin.which_key.mappings["o"] = { "<cmd>SymbolsOutline<CR>", "Show Symbols Tree" }
lvim.builtin.which_key.mappings["da"] = { "<cmd>lua require('dapui').toggle()<CR>", "Toggle UI" }
lvim.builtin.which_key.mappings["lR"] = { "<cmd>lua vim.lsp.buf.references()<cr>", "Find references" }

lvim.builtin.which_key.mappings["zz"] = { "<cmd>ZenMode<cr>", "Zen" }
lvim.builtin.which_key.mappings["zt"] = { "<cmd>Telescope<cr>", "Telescope" }
lvim.builtin.which_key.mappings["zg"] = { "<cmd>Neogit<cr>", "Neogit" }
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope project display_type=full<CR>", "Project" }
lvim.builtin.which_key.mappings["T"] = {
	name = "+Trouble",
	r = { "<cmd>Trouble lsp_references<cr>", "References" },
	f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
	d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
	q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
	l = { "<cmd>Trouble loclist<cr>", "LocationList" },
	w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
}

lvim.builtin.which_key.mappings["dP"] = { "<cmd>lua require('dap-python').test_runner = 'pytest'<CR>", "Pytest runner" }
lvim.builtin.which_key.mappings["dM"] = { "<cmd>lua require('dap-python').test_method()<CR>", "Test method" }
lvim.builtin.which_key.mappings["dC"] = { "<cmd>lua require('dap-python').test_class()<CR>", "Test class" }
lvim.builtin.which_key.mappings["dV"] = { "<ESC><cmd>lua require('dap-python').debug_selection()<CR>", "Test visual" }

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

-- lvim.lsp.diagnostics.

local nls = require("lvim.lsp.null-ls")

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ exe = "black", filetypes = { "python" }, args = { "--experimental-string-processing" } },
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
		config = function()
			require("user.outline").config()
		end,
	},
	-- { "mfussenegger/nvim-dap-python" },
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
	{ "shaunsingh/nord.nvim" },
	{ "ggandor/lightspeed.nvim" },
	{ "sindrets/diffview.nvim" },
	{ "lourenci/github-colors" },
	{ "tpope/vim-dadbod" },
	{ "TimUntersberger/neogit" },
	{ "kristijanhusak/vim-dadbod-ui", requires = { "tpope/vim-dadbod" } },
	{ "marko-cerovac/material.nvim" },
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("user.autotag").config()
		end,
	},
	{ "ChristianChiarulli/nvim-ts-rainbow" },
	{ "hrsh7th/cmp-nvim-lsp-signature-help" },
	-- { "hrsh7th/cmp-cmdline" },
	{
		"ray-x/lsp_signature.nvim",
		config = function()
			require("lsp_signature").on_attach()
		end,
	},
	{
		"gelguy/wilder.nvim",
		requires = { "roxma/nvim-yarp", "roxma/vim-hug-neovim-rpc" },
	},
	{ "nvim-telescope/telescope-project.nvim" },
	{ "nvim-telescope/telescope-file-browser.nvim" },
	{
		"pwntester/octo.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			require("user.octo").setup()
		end,
	},
}

require("telescope").load_extension("fzf")
require("telescope").load_extension("file_browser")
require("telescope").load_extension("project")
require("telescope").load_extension("octo")

require("dapui").setup()

require("neogit").setup()

-- THEME
vim.g.material_style = "deep ocean"
lvim.colorscheme = "dracula"
lvim.builtin.which_key.mappings["zl"] = { "<cmd>colorscheme github-colors|set bg=light<cr>", "light color" }
-- lvim.builtin.which_key.mappings["zd"] = { "<cmd>colorscheme github-colors|set bg=dark<cr>", "dark color" }
lvim.builtin.which_key.mappings["zd"] = { "<cmd>colorscheme material|set bg=dark<cr>", "dark color" }

--
-- Activate LunarVim tailwindcss lsp configuration only
-- if project seems to have a tailwindcss dependency
--
require("user.cmp").config()
require("user.wilder").setup()

vim.api.nvim_set_keymap("n", "<space>fb", ":Telescope file_browser<cr>", { noremap = true })

local utils = require("user.utils")
local project_has_tailwindcss_dependency = function()
	return (vim.fn.glob("tailwind*") ~= "" or utils.is_in_package_json("tailwindcss"))
end

if project_has_tailwindcss_dependency() == true then
	require("lvim.lsp.manager").setup("tailwindcss")
end

local dap_python = require("user.dap_python")
dap_python.setup("~/.virtualenvs/debugpy/bin/python", { include_configs = false })

local dap = require("dap")

local default_setup_opts = {
	console = "integratedTerminal",
	pythonPath = nil,
}

dap.configurations.python = {
	{
		type = "python",
		request = "launch",
		name = "Launch file",
		program = "${file}",
		console = default_setup_opts.console,
		pythonPath = default_setup_opts.pythonPath,
	},
	{
		type = "python",
		request = "launch",
		name = "Launch file (all code)",
		program = "${file}",
		justMyCode = false,
		console = default_setup_opts.console,
		pythonPath = default_setup_opts.pythonPath,
	},
	{
		type = "python",
		request = "launch",
		name = "Launch file with arguments",
		program = "${file}",
		args = function()
			local args_string = vim.fn.input("Arguments: ")
			return vim.split(args_string, " +")
		end,
		console = default_setup_opts.console,
		pythonPath = default_setup_opts.pythonPath,
	},
}

require("user.octo").setup()

local octo_function_map = require("octo.mappings").keypress_event_cbs
local octo_new_mappings = {
	issue = {
		close_issue = "ic", -- close issue
		reopen_issue = "io", -- reopen issue
		list_issues = "il", -- list open issues on same repo
		reload = "<C-r>", -- reload issue
		open_in_browser = "<C-b>", -- open issue in browser
		copy_url = "<C-y>", -- copy url to system clipboard
		add_assignee = "aa", -- add assignee
		remove_assignee = "ad", -- remove assignee
		create_label = "lc", -- create label
		add_label = "la", -- add label
		remove_label = "ld", -- remove label
		goto_issue = "gi", -- navigate to a local repo issue
		add_comment = "ca", -- add comment
		delete_comment = "cd", -- delete comment
		next_comment = "]c", -- go to next comment
		prev_comment = "[c", -- go to previous comment
		react_hooray = "rp", -- add/remove 🎉 reaction
		react_heart = "rh", -- add/remove ❤️ reaction
		react_eyes = "re", -- add/remove 👀 reaction
		react_thumbs_up = "r+", -- add/remove 👍 reaction
		react_thumbs_down = "r-", -- add/remove 👎 reaction
		react_rocket = "rr", -- add/remove 🚀 reaction
		react_laugh = "rl", -- add/remove 😄 reaction
		react_confused = "rc", -- add/remove 😕 reaction
	},
	pull_request = {
		checkout_pr = "po", -- checkout PR
		merge_pr = "pm", -- merge PR
		list_commits = "pc", -- list PR commits
		list_changed_files = "pf", -- list PR changed files
		show_pr_diff = "pd", -- show PR diff
		add_reviewer = "va", -- add reviewer
		remove_reviewer = "vd", -- remove reviewer request
		close_issue = "ic", -- close PR
		reopen_issue = "io", -- reopen PR
		list_issues = "il", -- list open issues on same repo
		reload = "<C-r>", -- reload PR
		open_in_browser = "<C-b>", -- open PR in browser
		copy_url = "<C-y>", -- copy url to system clipboard
		add_assignee = "aa", -- add assignee
		remove_assignee = "ad", -- remove assignee
		create_label = "lc", -- create label
		add_label = "la", -- add label
		remove_label = "ld", -- remove label
		goto_issue = "gi", -- navigate to a local repo issue
		add_comment = "ca", -- add comment
		delete_comment = "cd", -- delete comment
		next_comment = "]c", -- go to next comment
		prev_comment = "[c", -- go to previous comment
		react_hooray = "rp", -- add/remove 🎉 reaction
		react_heart = "rh", -- add/remove ❤️ reaction
		react_eyes = "re", -- add/remove 👀 reaction
		react_thumbs_up = "r+", -- add/remove 👍 reaction
		react_thumbs_down = "r-", -- add/remove 👎 reaction
		react_rocket = "rr", -- add/remove 🚀 reaction
		react_laugh = "rl", -- add/remove 😄 reaction
		react_confused = "rc", -- add/remove 😕 reaction
	},
	review_thread = {
		goto_issue = "gi", -- navigate to a local repo issue
		add_comment = "ca", -- add comment
		add_suggestion = "sa", -- add suggestion
		delete_comment = "cd", -- delete comment
		next_comment = "]c", -- go to next comment
		prev_comment = "[c", -- go to previous comment
		select_next_entry = "]q", -- move to previous changed file
		select_prev_entry = "[q", -- move to next changed file
		close_review_tab = "<C-c>", -- close review tab
		react_hooray = "rp", -- add/remove 🎉 reaction
		react_heart = "rh", -- add/remove ❤️ reaction
		react_eyes = "re", -- add/remove 👀 reaction
		react_thumbs_up = "r+", -- add/remove 👍 reaction
		react_thumbs_down = "r-", -- add/remove 👎 reaction
		react_rocket = "rr", -- add/remove 🚀 reaction
		react_laugh = "rl", -- add/remove 😄 reaction
		react_confused = "rc", -- add/remove 😕 reaction
	},
	submit_win = {
		approve_review = "<C-a>", -- approve review
		comment_review = "<C-m>", -- comment review
		request_changes = "<C-r>", -- request changes review
		close_review_tab = "<C-c>", -- close review tab
	},
	review_diff = {
		add_review_comment = "ca", -- add a new review comment
		add_review_suggestion = "sa", -- add a new review suggestion
		focus_files = "F", -- move focus to changed file panel
		toggle_files = "f", -- hide/show changed files panel
		next_thread = "]]", -- move to next thread
		prev_thread = "[[", -- move to previous thread
		select_next_entry = "]q", -- move to previous changed file
		select_prev_entry = "[q", -- move to next changed file
		close_review_tab = "<C-c>", -- close review tab
		toggle_viewed = "<space>", -- toggle viewer viewed state
	},
	file_panel = {
		next_entry = "j", -- move to next changed file
		prev_entry = "k", -- move to previous changed file
		select_entry = "<cr>", -- show selected changed file diffs
		refresh_files = "R", -- refresh changed files panel
		focus_files = "F", -- move focus to changed file panel
		toggle_files = "f", -- hide/show changed files panel
		select_next_entry = "]q", -- move to previous changed file
		select_prev_entry = "[q", -- move to next changed file
		close_review_tab = "<C-c>", -- close review tab
		toggle_viewed = "<space>", -- toggle viewer viewed state
	},
}

local section_mappers = {
	issue = "i",
	pull_request = "p",
	review_thread = "r",
	submit_win = "s",
	review_diff = "d",
	file_panel = "f",
}

local octo_table = {
	name = "+Octo",
}
for s_name, pref in pairs(section_mappers) do
	local _section = octo_new_mappings[s_name]
	local _table = { name = s_name }
	for func_name, keybind in pairs(_section) do
		local bind = "<cmd>" .. "lua require('octo.mappings').keypress_event_cbs['" .. func_name .. "']()<CR>"

		_table[keybind] = {
			bind,
			s_name .. ": " .. func_name,
		}
	end
	octo_table[pref] = _table
end

lvim.builtin.which_key.mappings["zo"] = octo_table
