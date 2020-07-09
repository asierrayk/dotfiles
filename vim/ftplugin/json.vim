setlocal shiftwidth=2
setlocal softtabstop=2

" buffer modifier to avoid use this mapping in other file type
nnoremap <buffer> <leader>f :%!jq .<CR>
