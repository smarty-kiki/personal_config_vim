set nu
retab

nnoremap <c-p> :call PhpDocSingle()<CR>

inoremap .f<space> <esc>b<right>veyA = dao('<esc>pA')->find();<left><left>
inoremap .i<space> <esc>b<right>veyA = input_entity('<esc>pA');<left><left>
