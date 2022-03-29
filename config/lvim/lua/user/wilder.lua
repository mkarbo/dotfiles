local M = {}

M.setup = function()
	vim.cmd([[
    call wilder#setup({'modes': [':', '/', '?']})
    call wilder#set_option('renderer', wilder#popupmenu_renderer({
      \ 'highlighter': wilder#basic_highlighter(),
      \ 'left': [
      \   ' ', wilder#popupmenu_devicons(),
      \ ],
      \ 'right': [
      \   ' ', wilder#popupmenu_scrollbar(),
      \ ],
      \ 'min_width': '10%',
      \ 'min_height': '10%',
      \ 'max_height': '20%',
      \ 'reverse': 0,
      \ }))
  ]])
end
return M
