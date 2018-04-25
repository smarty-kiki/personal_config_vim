set nu
"set relativenumber
retab

nnoremap <c-p> :call PhpDocSingle()<CR>

inoremap .f <esc>b<right>veyA = dao('<esc>pA')->find();<left><left>
inoremap .i <esc>b<right>veyA = input_entity('<esc>pA');<left><left>
