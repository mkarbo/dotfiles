local M = {}

M.config = function()
	local status_ok, cmp = pcall(require, "cmp")
	if not status_ok then
		return
	end
	local status_ok_sig, signature = pcall(require, "lsp_signature")
	if status_ok_sig then
		signature.setup()
	end

	-- TODO: Figure out better cmp setup
	-- table.insert(lvim.builtin.cmp.sources, {name = "cmdline"})
	-- cmp.setup(lvim.builtin.cmp)
end

return M
