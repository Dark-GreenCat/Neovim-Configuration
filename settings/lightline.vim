"--- Lightline --------------------------
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }


"--- Lightline-Bufferline ---------------
let g:lightline.tabline          = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}

set showtabline=2
if has('gui_running')
    set guioptions-=e
endif

let g:lightline#bufferline#modified = ' +'
let g:lightline#bufferline#read_only = ' -'
let g:lightline#bufferline#more_buffers = '...'
let g:lightline#bufferline#shorten_path = 1
let g:lightline#bufferline#smart_path = 1
let g:lightline#bufferline#show_number = 4
let g:lightline#bufferline#ordinal_separator = '|'
let g:lightline#bufferline#number_separator = ':'
let g:lightline#bufferline#enable_nerdfont = 1
let g:lightline#bufferline#icon_position = 'first'
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed = '[No Name]'

nmap <M-1> <Plug>lightline#bufferline#go(1)
nmap <M-2> <Plug>lightline#bufferline#go(2)
nmap <M-3> <Plug>lightline#bufferline#go(3)
nmap <M-4> <Plug>lightline#bufferline#go(4)
nmap <M-5> <Plug>lightline#bufferline#go(5)
nmap <M-6> <Plug>lightline#bufferline#go(6)
nmap <M-7> <Plug>lightline#bufferline#go(7)
nmap <M-8> <Plug>lightline#bufferline#go(8)
nmap <M-9> <Plug>lightline#bufferline#go(9)

nmap <Leader>bl <Plug>lightline#bufferline#move_next()
nmap <Leader>bh <Plug>lightline#bufferline#move_previous()
nmap <Leader>bk <Plug>lightline#bufferline#move_first()
nmap <Leader>bj <Plug>lightline#bufferline#move_last()
nmap <Leader>bb <Plug>lightline#bufferline#reset_order()
