local M = {}

M.config = function()
	vim.cmd([[
    nnoremap <silent><C-n> :BufferLineCycleNext<CR>
    nnoremap <silent><C-p> :BufferLineCyclePrev<CR>
    nnoremap <silent><leader>bd :bdelete<CR>
    nnoremap <silent><leader>bc :BufferLinePickClose<CR>
  ]])
	require("bufferline").setup({
		options = {
      sort_by = 'id',
      offsets = { { filetype = "NvimTree", text = "File Explorer", padding = 1 } },
      buffer_close_icon = "",
      modified_icon = "",
      close_icon = "",
      left_trunc_marker = "",
      right_trunc_marker = "",
      max_name_length = 17,
      max_prefix_length = 13,
      tab_size = 20,
      show_tab_indicators = true,
      enforce_regular_tabs = false,
      view = "multiwindow",
      show_buffer_close_icons = true,
      separator_style = "thin",
      always_show_bufferline = true,
		},
	})
end

return M
