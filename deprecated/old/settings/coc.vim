""""""""""""""""""""""""""""""""""""""""
" {{ SETUP FOR C/C++ IntelliSense }}
""""""""""""""""""""""""""""""""""""""""
" How to add setup coc for C/C++
"     Install clang (included in LLVM) (with command in powershell: choco install llvm)
"     Install coc-clangd (like vim script below)
"     Run :CocCommand clangd.install()
"     Add path for clang library and python (like vim script below)
"     To add more header files for C, paste them to C:\Program Files\LLVM\lib\clang\13.0.0\include
"     Run :UpdateRemotePlugins
"     
"     If we code in C:\path\...\to\file.c, create compile_flags.txt in parents directory such as C:, C:\path, or C:\path\...\to with the folowwing content:
"     -I
"     path\to\library
"     
"     for example
"      
"     -I
"     C:\Users\Administrator\AppData\Local\nvim\Hello
"     -I
"     C:\MinGW\mingw32\i686-w64-mingw32\include
"     -I
"     C:\MinGW\mingw32\lib\gcc\i686-w64-mingw32\8.1.0\include\c++
"     -I
"     C:\MinGW\mingw32\lib\gcc\i686-w64-mingw32\8.1.0\include\c++\i686-w64-mingw32\bits
"     -I
"     C:\MinGW\mingw32\lib\gcc\i686-w64-mingw32\8.1.0\include\c++\i686-w64-mingw32
"
"     To run compile .c .cpp file using clang with mingw header file, add '-target i686-pc-windows-gnu'
"     For example
"     clang -target i686-pc-windows-gnu test.c -otest.exe

" Install coc extension ( ['extension1', 'extension2', ...] ) 
" "Or run ':CocInstall coc-clangd'
let g:coc_global_extensions = [
  \ 'coc-clangd',
  \ 'coc-json',
  \ 'coc-tsserver',
  \ ]

"Add path for clang library and python host
let g:clang_library_path='C:/Program Files/LLVM/bin/libclang.dll'
let g:python3_host_prog = 'C:\\Python310\\python.exe'

" Run :CocCommand clangd.install to fix ebusy error


""""""""""""""""""""""""""""""""""""""""
" {{ CONFIG }}
""""""""""""""""""""""""""""""""""""""""

"Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" Use Ctrl Y to autocomplete
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup ed

" Use <C-l> for trigger snippet expand.
" Use <C-j> for select text for visual placeholder of snippet.
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
" Use <C-j> for both expand and jump (make expand higher priority.)
" Use <leader>x for convert visual selected code to snippet


inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
" inoremap <silent><expr> <cr> "\<c-g>u\<CR>"
hi CocSearch ctermfg=12 guifg=#18A3FF
hi CocMenuSel ctermbg=109 guibg=#13354A
