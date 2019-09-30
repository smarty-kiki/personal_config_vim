" vim
autocmd Bufread vimset set filetype=vim
autocmd Bufread vimfunction set filetype=vim
autocmd Bufread vimshell set filetype=vim
autocmd Bufread vimmap set filetype=vim
autocmd Bufread vimlocal set filetype=vim

" load
silent! source ~/.vim/subconfig/vimset
silent! source ~/.vim/subconfig/vimfunction
silent! source ~/.vim/subconfig/vimshell
silent! source ~/.vim/subconfig/vimmap
silent! source ~/.vimlocal
