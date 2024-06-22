let g:airline_powerline_fonts = 1                       " Enable font for status bar
let g:airline_theme='onedark'                           " Theme OneDark

let g:airline#extensions#tabline#enabled = 1            " Enable Tab bar
let g:airline#extensions#tabline#left_sep = ' '         " Enable Tab seperator 
let g:airline#extensions#tabline#left_alt_sep = '|'     " Enable Tab seperator
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#fnamemod = ':t'        " Set Tab name as file name
let g:airline#extensions#tabline#buffer_nr_show = 1     " Display buffer number

" Display branch name
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#coc_git = 1
let g:airline#extensions#branch#enabled = 1



let g:airline#extensions#whitespace#enabled = 0         " Remove warning whitespace"

let g:airline_section_error=''

" Powerline symbols (included in Powerline fonts)
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' ln '
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'
let g:airline_symbols.colnr=' col '"

" lightline
let g:airline = {
  \ 'active': {
  \   'left': [
  \     [ 'mode', 'paste' ],
  \     [ 'ctrlpmark', 'git', 'diagnostic', 'cocstatus', 'filename', 'method' ]
  \   ],
  \   'right':[
  \     [ 'filetype', 'fileencoding', 'lineinfo', 'percent' ],
  \     [ 'blame' ]
  \   ],
  \ },
  \ 'component_function': {
  \   'blame': 'LightlineGitBlame',
	      \   'battery': 'battery#component',
  \ }
\ }

function! LightlineGitBlame() abort
  let blame = get(b:, 'coc_git_blame', '')
  " return blame
  return winwidth(0) > 120 ? blame : ''
endfunction

