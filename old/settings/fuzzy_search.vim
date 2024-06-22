""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Unite
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search text in file
nnoremap <C-F3> :Unite line<CR>i
nnoremap <F3> :UniteResume<CR>ggA


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ack
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ackhighlight=1
let g:ackpreview=1

" Search multiple files
nnoremap <Leader>a :Ack!<Space> 			 
