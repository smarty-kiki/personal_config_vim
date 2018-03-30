set nu
"set relativenumber
retab

noremap <c-]> :cs f g <C-R>=expand("<cword>")<CR><CR>
noremap <c-\> :cs f e <C-R>=expand("<cword>")<CR><CR>

nnoremap <c-p> :call PhpDocSingle()<CR>

inoremap .f <esc>b<right>veyA = dao('<esc>pA')->find();<left><left>
inoremap .i <esc>b<right>veyA = input_entity('<esc>pA');<left><left>
