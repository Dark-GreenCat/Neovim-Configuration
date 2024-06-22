""""""""""""""""""""""""""""""""""""""""""""
" MAP HOTKEYS 
""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-t> :NERDTreeToggle<CR>		" Toggle the file browser 
nnoremap <C-f> :NERDTreeFind<CR>		" Reveal the directory of current tab


""""""""""""""""""""""""""""""""""""""""""""
" CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif


" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif


" Change arrow to expand/collapse tree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


" Remove slashes after folder name
augroup nerdtreehidetirslashes
	autocmd!
	autocmd FileType nerdtree syntax match NERDTreeDirSlash #/$# containedin=NERDTreeDir conceal contained
augroup end


""""""""""""""""""""""""""""""""""""""""""""""
" PLUG-INS CONFIG
""""""""""""""""""""""""""""""""""""""""""""""

" {{ Vim Devicons }}
	" Remove brackets around icons
		if exists("g:loaded_webdevicons")
			call webdevicons#refresh()
		endif

" If it's set to 0, the current folder icon disappears
		let g:DevIconsEnableFoldersOpenClose = 1
  	

	" Change the default dictionary mappings for file extension matches
  		let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
  		let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['pdf'] = ''
  		let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['exe'] = ''


" {{ Vim Nerdtree Syntax Highlight }}
	" To resolve lag, only highlight files with these extension 
		let g:NERDTreeSyntaxDisableDefaultExtensions = 1
		let g:NERDTreeSyntaxDisableDefaultExactMatches = 1
		let g:NERDTreeSyntaxDisableDefaultPatternMatches = 1
		" Enabled extensions with default colors
		let g:NERDTreeSyntaxEnabledExtensions = ['h', 'png'] 
		" Enabled exact matches with default colors
		"let g:NERDTreeSyntaxEnabledExactMatches = ['node_modules', 'favicon.ico']
	

	" Highlight both icon and file name
		let g:NERDTreeFileExtensionHighlightFullName = 1
		let g:NERDTreeExactMatchHighlightFullName = 1
		let g:NERDTreePatternMatchHighlightFullName = 1


	" Change folder name and icon color (by modifying 'guifg' value) 
		hi Directory guifg=#ce6a9e ctermfg=red
	

	" you can add these colors to your .vimrc to help customizing
		let s:brown ="905532"
		let s:aqua ="3AFFDB" 
		let s:blue ="689FB6"
		let s:darkBlue ="44788E"
		let s:purple ="834F79"
		let s:lightPurple ="834F79"
		let s:red ="AE403F"
		let s:beige ="F5C06F"
		let s:yellow ="F09F17"
		let s:orange ="D4843E"
		let s:darkOrange ="F16529"
		let s:pink ="CB6F6F"
		let s:salmon ="EE6E73"
		let s:green ="8FAA54"
		let s:lightGreen ="31B53E"
		let s:white ="FFFFFF"
		let s:rspec_red ='FE405F'
		let s:git_orange ='F54D27'
		
		let s:custom_blue_1 ='0C7CC7'
		let s:custom_blue_2 ='4098BD'
		
		let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
		let g:NERDTreeExtensionHighlightColor['c'] = '6aceae' " sets the color of c files to blue
		let g:NERDTreeExtensionHighlightColor['cpp'] = '0092ba'
		let g:NERDTreeExtensionHighlightColor['vim'] = s:custom_blue_1
		let g:NERDTreeExtensionHighlightColor['pdf'] = s:orange
		let g:NERDTreeExtensionHighlightColor['exe'] = '737272'
		
		"let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
		"let g:NERDTreeExactMatchHighlightColor['cpp'] = s:darkBlue " sets the color for cpp files
		
		"let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
		"let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb
		
