set nu
"set relativenumber
retab

noremap <c-]> :cs f g <C-R>=expand("<cword>")<CR><CR>
nmap <c-\> :cs f e <C-R>=expand("<cword>")<CR><CR>

nnoremap <c-p> :call PhpDocSingle()<CR>
