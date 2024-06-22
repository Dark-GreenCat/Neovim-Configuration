"           _____                    _____                    _____                _____          
"          /\    \                  /\    \                  /\    \              /\    \         
"         /::\____\                /::\    \                /::\____\            /::\    \        
"        /::::|   |                \:::\    \              /::::|   |            \:::\    \       
"       /:::::|   |                 \:::\    \            /:::::|   |             \:::\    \      
"      /::::::|   |                  \:::\    \          /::::::|   |              \:::\    \     
"     /:::/|::|   |                   \:::\    \        /:::/|::|   |               \:::\    \    
"    /:::/ |::|   |                   /::::\    \      /:::/ |::|   |               /::::\    \   
"   /:::/  |::|___|______    ____    /::::::\    \    /:::/  |::|   | _____        /::::::\    \  
"  /:::/   |::::::::\    \  /\   \  /:::/\:::\    \  /:::/   |::|   |/\    \      /:::/\:::\    \ 
" /:::/    |:::::::::\____\/::\   \/:::/  \:::\____\/:: /    |::|   /::\____\    /:::/  \:::\____\
" \::/    / ~~~~~/:::/    /\:::\  /:::/    \::/    /\::/    /|::|  /:::/    /   /:::/    \::/    /
"  \/____/      /:::/    /  \:::\/:::/    / \/____/  \/____/ |::| /:::/    /   /:::/    / \/____/ 
"              /:::/    /    \::::::/    /                   |::|/:::/    /   /:::/    /          
"             /:::/    /      \::::/____/                    |::::::/    /   /:::/    /           
"            /:::/    /        \:::\    \                    |:::::/    /    \::/    /            
"           /:::/    /          \:::\    \                   |::::/    /      \/____/             
"          /:::/    /            \:::\    \                  /:::/    /                           
"         /:::/    /              \:::\____\                /:::/    /                            
"         \::/    /                \::/    /                \::/    /                             
"          \/____/                  \/____/                  \/____/                              
"                                                                                                                                                                                                
"                                                                                               
" Vim customized by Mint

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set mouse=a                 " Enable mouse
set tabstop=4               " 
set shiftwidth=4            " 
set expandtab
set listchars=tab:\¦\       " Tab charactor 
set list
set foldmethod=syntax       " 
set foldnestmax=1
set foldlevelstart=0        "  
set nofoldenable
set number                  " Show line number
set ignorecase              " Enable case-sensitive 
set cursorline              " Highlight line of cursor
set nobomb                  


" Disable backup
set nobackup
set nowb
set noswapfile

" Optimize 
set synmaxcol=200
set lazyredraw
au! BufNewFile,BufRead *.json set foldmethod=indent " Change foldmethod for specific filetype

syntax on

" Enable copying from vim to clipboard
if has('win32')
  set clipboard=unnamed  
else
  set clipboard=unnamedplus
endif

" Auto reload content changed outside
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * :checktime
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
    \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == ''
      \ | checktime 
    \ | endif
autocmd FileChangedShellPost *
    \ echohl WarningMsg 
    \ | echo "File changed on disk. Buffer reloaded."
    \ | echohl None


" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
" set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
 set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Wayland clipboard provider that strips carriage returns (GTK3 issue).
" This is needed because currently there's an issue where GTK3 applications on
" Wayland contain carriage returns at the end of the lines (this is a root
" issue that needs to be fixed).
" Require install wl-clipboard to system
" let g:clipboard = {
"       \   'name': 'wayland-strip-carriage',
"       \   'copy': {
"       \      '+': 'wl-copy --foreground --type text/plain',
"       \      '*': 'wl-copy --foreground --type text/plain --primary',
"       \    },
"       \   'paste': {
"       \      '+': {-> systemlist('wl-paste --no-newline | tr -d "\r"')},
"       \      '*': {-> systemlist('wl-paste --no-newline --primary | tr -d "\r"')},
"       \   },
"       \   'cache_enabled': 1,
"       \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Resize pane
nmap <M-Right> :vertical resize +1<CR>    
nmap <M-Left> :vertical resize -1<CR>
nmap <M-Down> :resize +1<CR>
nmap <M-Up> :resize -1<CR>

" In normal mode, pressing Ctrl + increases the font, Ctrl - decreases the font, Ctrl Shift + restores default
nnoremap <C-=> :call AdjustFontSize(1)<CR>
nnoremap <C--> :call AdjustFontSize(-1)<CR>
nnoremap <C-0> :call AdjustFontSize(0)<CR>

" Paste in command mode
cnoremap <C-S-v> <C-r><S-">

let s:fontsize = 11
function! AdjustFontSize(amount)
  if a:amount == 0
      let s:fontsize = 11
  else
      let s:fontsize = s:fontsize+a:amount
  endif
  :execute "GuiFont! DejaVu Sans Mono:h" . s:fontsize
endfunction

" " Resizing windows
" if bufwinnr(1)
"     nnoremap <S-=> <C-w>+
"     nnoremap <S--> <C-w>-
"     nnoremap <C-=> <C-w>>
"     nnoremap <C--> <C-w><
" endif

" Switch to next buffer
map <C-TAB> :bn<CR>
map <leader>bd :NERDTreeClose<CR> :bd<CR> :NERDTreeToggle<CR>

" Search a hightlighted text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
nmap /\ :noh<CR>

" Quickly insert blank lines without leaving normal mode and without moving cursor
nnoremap <silent> <leader>o :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
nnoremap <silent> <leader>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>

" Switch split window
nnoremap <C-Right> <C-w>l
nnoremap <C-Left> <C-w>h
nnoremap <C-Up> <C-w>k
nnoremap <C-Down> <C-w>j

" Paste from system clipboard in command mode
cnoremap <C-V> <C-R>+ 



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin list
" (used with Vim-plug - https://github.com/junegunn/vim-plug)

" Command Guide
" 	PlugInstall - install plug-ins
" 	PlugClean - uninstall plug-ins
"	source % - refresh neovim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin(stdpath('config').'/plugged')
" Theme
  Plug 'joshdick/onedark.vim',                  " Dark theme
  Plug 'ghifarit53/tokyonight-vim'                    " colorscheme tokyonight 
  Plug 'drewtempelmeyer/palenight.vim'

" File browser
  Plug 'preservim/nerdTree'                     " File browser  
  Plug 'Xuyuanp/nerdtree-git-plugin'            " Git status
  Plug 'ryanoasis/vim-devicons'                 " Icon
  Plug 'tiagofumo'
          \ .'/vim-nerdtree-syntax-highlight'
  Plug 'unkiwii/vim-nerdtree-sync'              " Sync current file 

" File search
  Plug 'junegunn/fzf', 
    \ { 'do': { -> fzf#install() } }            " Fuzzy finder 
  Plug 'junegunn/fzf.vim'

" Status bar
  Plug 'powerline/fonts'		                        " Powerline font
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " Battery percent in status line
  Plug 'lambdalisue/battery.vim'

" Terminal
  Plug 'voldikss/vim-floaterm'                  " Float terminal

" Code intellisense
  Plug 'neoclide/coc.nvim', 
    \ {'branch': 'release'}                     " Language server protocol (LSP) 
"  Plug 'pappasam/coc-jedi',                     " Jedi language server 
  Plug 'jiangmiao/auto-pairs'                   " Parenthesis auto 
  Plug 'tpope/vim-commentary'                         " Auto comment
"  Plug 'alvan/vim-closetag'
"  Plug 'mattn/emmet-vim' 
"  Plug 'preservim/nerdcommenter'                " Comment code 
"  Plug 'liuchengxu/vista.vim'                   " Function tag bar 
"  Plug 'alvan/vim-closetag'                     " Auto close HTML/XML tag 
"    \ { 
"      \ 'do': 'yarn install '
"              \ .'--frozen-lockfile '
"		\ .'&& yarn build',
"      \ 'branch': 'main' 
"    \ }

" Code syntax highlight
  Plug 'sheerun/vim-polyglot'                 " All language
"  Plug 'yuezk/vim-js'                           " Javascript
"  Plug 'MaxMEllon/vim-jsx-pretty'               " JSX/React
"  Plug 'jackguo380/vim-lsp-cxx-highlight'       " C/C++
"  Plug 'uiiaoo/java-syntax.vim'                 " Java
  
" Debugging
"  Plug 'puremourning/vimspector'                " Vimspector

" Source code version control 
  Plug 'tpope/vim-fugitive'                     " Git infomation 
"  Plug 'tpope/vim-rhubarb' 
"  Plug 'airblade/vim-gitgutter'                 " Git show changes 
"  Plug 'samoshkin/vim-mergetool'                " Git merge
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug-ins config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{ Themes }}
" Similar to 'syntax on', but this script can prevent overriding syntax items upon 'source %' 
if !exists('g:syntax_on')			
    syntax enable
endif

" Tokyonight
set termguicolors

let g:tokyonight_style = 'storm'                " Available: night, storm
let g:tokyonight_enable_italic = 0
let g:tokyonight_disable_italic_comment = 1

colorscheme tokyonight


" {{ Statusline }}
" Vim-airline
let g:airline_theme = 'onedark'
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif



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
" " Display branch name
"     let g:airline#extensions#tabline#enabled = 1
"     let g:airline#extensions#hunks#enabled = 0
"     let g:airline#extensions#hunks#coc_git = 1
" " Enable the list of buffers
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#formatter = 'default'



" {{ Extended settings }}
for setting_file in split(glob(stdpath('config').'/settings/*.vim'))
    execute 'source' setting_file
endfor
"let neovim_settings_dir = stdpath('config'). '\settings\'
"	execute 'source ' .neovim_settings_dir. 'nerdtree.vim

autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp ""let vim treat .ino and .pde like c++ file



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TABBAR CONFIG
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors
hi Tb_Normal guifg=#98c379 
hi Tb_Changed guifg=#98c379 
hi Tb_VisibleNormal guifg=#131910 guibg=#98c379
hi Tb_VisibleChanged guifg=#131910 guibg=#98c379

" Make sure tab name is not broken into two lines
let Tb_TabWrap=1        

" Toggle the Tabbar
nnoremap <F2> :TbToggle<CR>     

" Delete buffer
nmap <Leader>d :bd<CR><C-TAB>

" Paste in command mode
:cnoremap <C-V> <C-R>+

let g:NERDTreeGitStatusGitBinPath = 'C:/Program Files/Git/bin/git.exe' " default: git (auto find in path)
let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0

:cd D:\

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }


" :VimspectorInstall vscode-cpptools
" use :CheckHealth to check if there are any errors
" let g:vimspector_enable_mappings = 'HUMAN'
" packadd! vimspector
" let g:vimspector_base_dir='D:\OneDrive - Hanoi University of Science and Technology\App Modifying Files\Neovim_config\plugged\vimspector'
" command! -nargs=+ Vfb call vimspector#AddFunctionBreakpoint(<f-args>)

" nnoremap <localleader>gd :call vimspector#Launch()<cr>
" nnoremap <localleader>gc :call vimspector#Continue()<cr>
" nnoremap <localleader>gs :call vimspector#Stop()<cr>
" nnoremap <localleader>gR :call vimspector#Restart()<cr>
" nnoremap <localleader>gp :call vimspector#Pause()<cr>
" nnoremap <localleader>gb :call vimspector#ToggleBreakpoint()<cr>
" nnoremap <localleader>gB :call vimspector#ToggleConditionalBreakpoint()<cr>
" nnoremap <localleader>gn :call vimspector#StepOver()<cr>
" nnoremap <localleader>gi :call vimspector#StepInto()<cr>
" nnoremap <localleader>go :call vimspector#StepOut()<cr>
" nnoremap <localleader>gr :call vimspector#RunToCursor()<cr>
