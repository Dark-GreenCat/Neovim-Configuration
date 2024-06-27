let g:better_whitespace_guicolor='#ffc0b9'
let g:strip_whitespace_on_save = 0

" Disable the highlighting for specific file types
let g:better_whitespace_filetypes_blacklist=['diff', 'git', 'gitcommit', 'unite', 'qf', 'help', 'markdown', 'fugitive']

" Highlight space characters that appear before or in-between tabs
let g:show_spaces_that_precede_tabs=1

" Navigate to the previous or next trailing whitespace
nnoremap ]w :NextTrailingWhitespace<CR>
nnoremap [w :PrevTrailingWhitespace<CR>
