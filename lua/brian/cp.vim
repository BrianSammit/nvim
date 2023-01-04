function! TermWrapper(command) abort
	exec 'vnew'
    exec 'vertical resize 62'
	exec 'term ' . a:command
	exec 'setlocal nornu nonu'
	exec 'startinsert'
	autocmd BufEnter <buffer> startinsert
endfunction

command! -nargs=0 CompileAndRun call TermWrapper(printf('g++ -std=c++17 -O2 -Wall %s && ./a.out', expand('%')))
command! -nargs=1 -complete=file CompileAndRunWithFile call TermWrapper(printf('g++ -std=c++17 -O2 -Wall %s && ./a.out < %s', expand('%'), <q-args>))
autocmd FileType cpp nnoremap <leader>cw :CompileAndRun<CR>

augroup CppToolkit
	autocmd FileType cpp nnoremap <leader>cr :!g++ -std=c++17 -O2 -Wall && ./a.out<CR>
	autocmd FileType cpp nnoremap <leader>r :!./a.out<CR>
	autocmd FileType cpp nnoremap <leader>cw :CompileAndRun<CR>
augroup END
