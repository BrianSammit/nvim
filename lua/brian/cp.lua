function term_wrapper(command)
    vim.cmd 'vnew'
    vim.cmd '40'
    vim.cmd 'term '
	vim.cmd 'setlocal nornu nonu'
	vim.cmd 'startinsert'
	vim.cmd [[autocmd BufEnter <buffer> startinsert]]
end

term_wrapper(print('hello'))

