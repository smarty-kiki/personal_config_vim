" 
" todo: don't jump when complition only has a keyword and finished
"
syntax on
filetype plugin indent on

set incsearch
set hlsearch
set autoindent shiftwidth=4
set ruler
set showcmd
set csto=0
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set foldcolumn=2
set foldmethod=marker
set showmatch
set directory=/tmp/swp,~/tmp,/var/tmp,/tmp
set hidden
set autochdir
set magic
set scrolloff=4
set ambiwidth=double
set completeopt=menu,longest
set cursorline
set iskeyword=@,48-57,192-255,$
" set cscopequickfix=s-,c-,d-,i-,t-,e-
" set autoread

highlight LineNr ctermfg=gray

retab

noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm:set ff=unix<cr>:%s/\ *$//g<cr>:nohl<cr>
noremap <Leader>csa <ESC>:cs kill -1 <CR> <ESC>:cs add /tmp/<C-R>=system("pwd \| md5")<CR><del> <CR>
noremap <Leader>csc <Esc>:!sh $SHELL_HOME/create-scope.sh <C-R>=getcwd()<CR>  <C-R>=system("pwd \| md5")<CR><del> <CR> <ESC>:cs kill -1 <CR> <ESC>:cs add /tmp/<C-R>=system("pwd \| md5")<CR><del><CR>
noremap <leader>hb <ESC>:!hg blame % -u -d -q > /tmp/.blamelog <CR>:e /tmp/.blamelog<CR>
noremap <leader>gb <ESC>:!git blame % -w > /tmp/.blamelog <CR>:e /tmp/.blamelog<CR>

"smartTab
function! SmartTab()
    let col=col('.')-1
    if !col || getline('.')[col-1] !~ '\k'
        if getline('.')[col-1] == " "
            return "\<Tab>"
        else
            return ''
        endif
    else
        return "\<C-N>"
    endif
endfunction

inoremap <tab> <C-R>=SmartTab()<CR>
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "<tab>"
inoremap <expr> <cr> pumvisible() ? "\<c-e>" : "\<cr>"
nnoremap <tab> ==
vnoremap <tab> ==

" global
" autocmd InsertLeave * write
vnoremap <c-h> :!sed -e "s///g"<left><left><left><left>
nnoremap cih f<F><right>ct<
nnoremap dih f<F><right>dt<
nnoremap <c-d> viw"-yovar_dump(<esc>"-pa);exit;<esc>F)
nnoremap <c-e> viw"-yo/**kiki*/error_log(print_r(<esc>"-pa, true)."\n", 3, '/tmp/error_user.log');exit;<esc>

" svn
autocmd BufEnter *.php.tmp /<<<<<<< .mine
autocmd BufEnter *.php.*.tmp /<<<<<<< .mine
autocmd Bufread *.php.tmp /<<<<<<< .mine
autocmd Bufread *.php.*.tmp /<<<<<<< .mine

" fix
autocmd BufNewFile *.json set filetype=javascript
autocmd Bufread *.json set filetype=javascript
autocmd BufNewFile *.njs set filetype=javascript
autocmd Bufread *.njs set filetype=javascript

" prj
autocmd Bufread *.prj Project %
autocmd Bufread *.prj set noautochdir

" vim
autocmd Bufread .vimmap set filetype=vim
autocmd Bufread .vimlocal set filetype=vim

" load
silent! source ~/.vimmap
silent! source ~/.vimlocal

" php
"  autocmd BufEnter *.php nnoremap <CR> :w!<CR>:!php -l %<CR>
autocmd BufEnter *.php nnoremap <CR> :w!<CR>:cexpr system("sh $SHELL_HOME/syntax-err-php.sh <c-r>=expand('%:p')<cr>")<CR>
autocmd BufLeave *.php nunmap <CR>
" autocmd BufEnter *.php nnoremap <space> :w! /tmp/beauty.php<cr>:!php-cs-fixer fix -q --level=symfony /tmp/beauty.php<cr><cr>mpgg<s-v>G:!cat /tmp/beauty.php<cr><cr>`p
" autocmd BufLeave *.php nunmap <space>
autocmd FileType php noremap \doci <Esc>:!grep -n -e 'class' -e 'interface' --color % \| less <CR>
autocmd FileType php noremap \docf <Esc>:!grep -n -e ' function' --color % \| less <cr>
autocmd FileType php noremap \docp <Esc>:!grep -n -e 'protected' -e 'private' -e 'public' --color % \| grep -v 'function' \| grep -v '*' \| grep -v '//' \| less <CR>
autocmd FileType php noremap \docc <Esc>:!grep -n -e 'const' --color % \| less <CR>
autocmd FileType php set dictionary-=~/.vim/doc/php_func_list.txt
autocmd FileType php set dictionary+=~/.vim/doc/php_func_list.txt
autocmd FileType php set complete+=k
autocmd FileType php vnoremap / :!sed -e 's/^/\/\//g'<CR>
autocmd FileType php vnoremap <Leader> :!sed -e 's/^\/\///g'<CR>
autocmd BufNewFile *.php exec append(0,"<?php")
autocmd BufNewFile *.php normal G

" autocmd FileType,BufNewFile php inoremap <C-p> <ESC>:call PhpDocSingle()<CR>
autocmd FileType,BufNewFile php nnoremap <C-p> :call PhpDocSingle()<CR>
autocmd FileType,BufNewFile php vnoremap <C-p> :call PhpDocRange()<CR>

" Js
autocmd BufEnter *.js nnoremap <CR> :w!<CR>:cexpr system("sh $SHELL_HOME/syntax-err-js.sh <c-r>=expand('%:p')<cr>")<CR>
autocmd BufLeave *.js nunmap <CR>
autocmd BufEnter *.json nnoremap <CR> :w!<CR>:cexpr system("sh $SHELL_HOME/syntax-err-js.sh <c-r>=expand('%:p')<cr>")<CR>
autocmd BufLeave *.json nunmap <CR>
autocmd FileType javascript set dictionary-=~/.vim/doc/js_func_list.txt
autocmd FileType javascript set dictionary+=~/.vim/doc/js_func_list.txt
autocmd FileType javascript set complete+=k
autocmd FileType javascript vnoremap / :!sed -e 's/^/\/\//g'<CR>
autocmd FileType javascript vnoremap <Leader> :!sed -e 's/^\/\///g'<CR>

" HTML
autocmd BufEnter *.htm nnoremap <CR> :w!<CR>:!open %<CR>
autocmd BufLeave *.htm nunmap <CR>
autocmd BufEnter *.html nnoremap <CR> :w!<CR>:!open %<CR>
autocmd BufLeave *.html nunmap <CR>
autocmd FileType html nnoremap <CR> :w!<CR>:!open %<CR>

" CSV
autocmd BufEnter *.csv nnoremap <CR> :w!<CR>:!open %<CR>
autocmd BufLeave *.csv nunmap <CR>

" Shell
autocmd BufNewFile *.sh exec append(0,"#!/bin/bash")
autocmd BufNewFile *.sh normal G

" Graphviz
autocmd Bufread *.gv nnoremap <CR> :!rm -f %.pdf<CR>:w!<CR>:!dot -T pdf -o %.pdf %<CR>:!open %.pdf<CR>
autocmd BufNewFile *.gv nnoremap <CR> :!rm -f %.pdf<CR>:w!<CR>:!dot -T pdf -o %.pdf %<CR>:!open %.pdf<CR>
autocmd BufNewFile *.gv exec append(0, "digraph G {")
autocmd BufNewFile *.gv exec append(1, "    node [fontname = \"Kaiti SC Regular\"];")
autocmd BufNewFile *.gv exec append(2, "}")
autocmd BufNewFile *.gv normal G

" mac 
if has("unix")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
        vnoremap "+y :w !pbcopy<CR><CR> 
        nnoremap "+p :r !pbpaste<CR><CR>
        noremap <C-]> :cs f g <C-R>=expand("<cword>")<CR><CR>
    else
        vmap "+y :w! /tmp/vim_paste.tmp<CR> 
        nmap "+p <s-v>:!cat /tmp/vim_paste.tmp<CR>
        noremap <C-]> :cs f g <C-R>=expand("<cword>")<CR><CR>
    endif
endif

augroup json_autocmd 
    autocmd! 
    autocmd FileType json set autoindent 
    autocmd FileType json set formatoptions=tcq2l 
    autocmd FileType json set textwidth=78 shiftwidth=2 
    autocmd FileType json set softtabstop=2 tabstop=8 
    autocmd FileType json set expandtab 
    autocmd FileType json set foldmethod=syntax 
augroup END

" 矫正操作
" nnoremap <esc><esc> :execute system("ps aux \| grep say \| grep -v grep \|\| say '已经在普通模式了' &")<cr>:echoerr "已经在普通模式了"<cr>

function! SaveFile()
    if getbufvar("%", "&mod") == 0
        call system("ps aux | grep say | grep -v grep || say '保存过了' &")
    endif
    return "w"
endfunction
" cnoremap w<cr> <c-r>=SaveFile()<cr><cr>

" let g:LargeFile = 1024 * 100
" augroup LargeFile
"     autocmd BufReadPre * let f=expand("<afile>") | if getfsize(f) > g:LargeFile | set eventignore+=FileType,Syntax nofoldenable nobackup | setlocal noswapfile bufhidden=unload | endif
" augroup END
