local M = {}

M.config = function()
	local status_ok, lsp_signature = pcall(require, "lsp_signature")
	if not status_ok then
		return
	end

	lsp_signature.on_attach({ auto_close_after = 2, hint_enable = false, always_trigger = false })
end

return M
