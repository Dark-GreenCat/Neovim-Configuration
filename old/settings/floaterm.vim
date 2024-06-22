let g:floaterm_position = 'center'
let g:floaterm_width = 0.6
let g:floaterm_height = 0.6

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Hotkey to manage terminals
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open a new terminal 
nnoremap <silent>   <F9>    	:FloatermNew<CR>powershell<CR>
tnoremap <silent>   <F9>    	<C-\><C-n>:FloatermNew<CR>

" Kill current terminal 
nnoremap <silent> 	<C-F9> 		:FloatermKill<CR>:FloatermPrev<CR>
tnoremap <silent> 	<C-F9> 		<C-\><C-n>:FloatermKill<CR>:FloatermPrev<CR>

" Toggle termin
nnoremap <silent> 	<S-F9> 		:FloatermToggle<CR>
tnoremap <silent> 	<S-F9> 		<C-\><C-n>:FloatermToggle<CR>

" Navigation next and previous terminal 
nnoremap <silent> 	<F10> 		:FloatermNext<CR>
tnoremap <silent> 	<F10> 		<C-\><C-n>:FloatermNext<CR>
nnoremap <silent> 	<C-F10> 	:FloatermPrev<CR>
tnoremap <silent> 	<C-F10> 	<C-\><C-n>:FloatermPrev<CR>

"Enter normal mode
tnoremap <silent>   <S-Esc>       <C-\><C-n>   

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Save - Compile - Run C/C++
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd filetype cpp nnoremap <F5> :w <bar> !g++ -std=c++17 -O2 -Wall % -o %:r && %:r.exe <CR>
nnoremap <F11> :w <bar> :FloatermNew --position=bottom --height=0.3 --width=0.6 --title='C_Runner' gcc % -o %:r && %:r.exe <CR>
nnoremap <C-F11> :w <bar> :FloatermNew --autoclose=1 --position=bottom --height=0.3 --width=0.6 --title='C++_Runner' g++ % -o %:r && %:r.exe <CR>

autocmd filetype cpp nnoremap <F5> :w <bar> !g++ -std=c++17 -O2 -Wall % -o %:r && %:r.exe <CR>
