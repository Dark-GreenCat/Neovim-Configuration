set updatetime=100
set signcolumn=auto

" Unlimited number of signs
let g:gitgutter_max_signs = -1

let g:gitgutter_highlight_linenrs = 1
let g:gitgutter_preview_win_floating = 1

hi link GitGutterAddLineNr            DiffAdd          " default: links to CursorLineNr
hi link GitGutterChangeLineNr         DiffChange          " default: links to CursorLineNr
hi link GitGutterDeleteLineNr         DiffDelete          " default: links to CursorLineNr
hi link GitGutterChangeDeleteLineNr   GitGutterChangeLineNr          " default: links to GitGutterChangeLineNr


