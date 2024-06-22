" This is the default extra key bindings
let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.5, 'highlight': 'Comment' } }
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

hi! fzf_fg ctermfg=14
hi! fzf_fgp ctermfg=3
hi! fzf_hl ctermfg=5
hi! fzf_hlp ctermfg=5
hi! fzf_info ctermfg=6
hi! fzf_prompt ctermfg=6
hi! fzf_spinner ctermfg=6
hi! fzf_pointer ctermfg=3
let g:fzf_colors = {
    \ 'fg':      ['fg', 'fzf_fg'],
    \ 'hl':      ['fg', 'fzf_hl'],
    \ 'fg+':     ['fg', 'fzf_fgp'],
    \ 'hl+':     ['fg', 'fzf_hlp'],
    \ 'info':    ['fg', 'fzf_info'],
    \ 'prompt':  ['fg', 'fzf_prompt'],
    \ 'pointer': ['fg', 'fzf_pointer'],
    \ 'spinner': ['fg', 'fzf_spinner'] }
"
" " Customize fzf colors to match your color scheme                                          
" " - fzf#wrap translates this to a set of `--color` options                                 
" let g:fzf_colors =                                                                         
" \ { 'fg':      ['fg', 242],                                                           
"   \ 'bg':      ['bg', 256],                                                           
"   \ 'hl':      ['fg', 65],                                                          
"   \ 'fg+':     ['fg', 15],                             
"   \ 'bg+':     ['bg', 239],                                       
"   \ 'hl+':     ['fg', 65],                                                        
"   \ 'info':    ['fg', 108],                                                          
"   \ 'border':  ['fg', 12],                                                           
"   \ 'prompt':  ['fg', 109],                                                      
"   \ 'pointer': ['fg', 168],                                                        
"   \ 'marker':  ['fg', 168],                                                          
"   \ 'spinner': ['fg', 108],                                                            
"   \ 'header':  ['fg', 'Comment'] }

" :Files
command! -bang -nargs=? -complete=dir Files
   \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'bat --color=always --style=header,numbers,snip --line-range :300 {}']}, <bang>0)
map <F7> :Files<CR> 

" " :Rg
" command! -bang -nargs=* Rg
"   \ call fzf#vim#grep(
"   \   'rg --column --line-number --color=always --smart-case -- '.shellescape(<q-args>), 1, {'options': ['--exact', '--layout=reverse']}, <bang>0)
" map <F7> :Rg<CR>


