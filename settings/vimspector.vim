let g:vimspector_enable_mappings = 'HUMAN'

" More verbose display for variables and watches
let g:vimspector_variables_display_mode = 'full'

" Automatic hovering popup 
let g:vimspector_enable_auto_hover=1

" mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)

" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval

nmap <LocalLeader><F11> <Plug>VimspectorUpFrame
nmap <LocalLeader><F12> <Plug>VimspectorDownFrame
nmap <LocalLeader>B     <Plug>VimspectorBreakpoints
nmap <LocalLeader>D     <Plug>VimspectorDisassemble


let g:vimspector_install_gadgets = [ 'vscode-cpptools' ]
