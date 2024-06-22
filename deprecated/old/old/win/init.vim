"  _   ____  __  _  _________  ___  _______  __  _________  ___  _______ 
" | | / / / / / / |/ / ___/ / / \ \/ / __/ |/ / / ___/ __ \/ _ \/ __/ _ \
" | |/ / /_/ / /    / (_ / /_/ / \  / _//    / / /__/ /_/ / // / _// , _/
" |___/\____/ /_/|_/\___/\____/  /_/___/_/|_/  \___/\____/____/___/_/|_|
" Vim customized by Vu Nguyen Coder
" (See my detailed tutorial here: https://youtu.be/Tp8i1EHsQ1Q )
"
" http://youtube.com/VuNguyenCoder
" http://facebook.com/VuNguyenCoder


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
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
 set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx


" Wayland clipboard provider that strips carriage returns (GTK3 issue).
" This is needed because currently there's an issue where GTK3 applications on
" Wayland contain carriage returns at the end of the lines (this is a root
" issue that needs to be fixed).
" Require install wl-clipboard to system
let g:clipboard = {
      \   'name': 'wayland-strip-carriage',
      \   'copy': {
      \      '+': 'wl-copy --foreground --type text/plain',
      \      '*': 'wl-copy --foreground --type text/plain --primary',
      \    },
      \   'paste': {
      \      '+': {-> systemlist('wl-paste --no-newline | tr -d "\r"')},
      \      '*': {-> systemlist('wl-paste --no-newline --primary | tr -d "\r"')},
      \   },
      \   'cache_enabled': 1,
      \ }
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
nnoremap <C-+> :call AdjustFontSize(0)<CR>

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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin list
" (used with Vim-plug - https://github.com/junegunn/vim-plug)

" Command Guide
" 	PlugInstall - install plug-ins
" 	PlugClean - uninstall plug-ins
"	source % - refresh neovim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin(stdpath('config').'/plugged-vunguyencoder')
" Theme
  Plug 'joshdick/onedark.vim',                  " Dark theme
    Plug 'ghifarit53/tokyonight-vim'                    " colorscheme tokyonight 
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
    " Plug 'sheerun/vim-polyglot'                 " All language
"  Plug 'yuezk/vim-js'                           " Javascript
"  Plug 'MaxMEllon/vim-jsx-pretty'               " JSX/React
  Plug 'jackguo380/vim-lsp-cxx-highlight'       " C/C++
"  Plug 'uiiaoo/java-syntax.vim'                 " Java
  
" Debugging
"  Plug 'puremourning/vimspector'                " Vimspector

" Source code version control 
"  Plug 'tpope/vim-fugitive'                     " Git infomation 
"  Plug 'tpope/vim-rhubarb' 
"  Plug 'airblade/vim-gitgutter'                 " Git show changes 
"  Plug 'samoshkin/vim-mergetool'                " Git merge
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set theme 
" colorscheme onedark

" " Overwrite some color highlight 
" if (has("autocmd"))
"   augroup colorextend
"     autocmd ColorScheme 
"       \ * call onedark#extend_highlight("Comment",{"fg": {"gui": "#728083"}})
"     autocmd ColorScheme 
"       \ * call onedark#extend_highlight("LineNr", {"fg": {"gui": "#728083"}})
"   augroup END
" endif

" Similar to 'syntax on', but this script can prevent overriding syntax items upon 'source %' 
if !exists('g:syntax_on')			
    syntax enable
endif

" Tokyonight
set termguicolors
let g:tokyonight_style = 'storm'                " Available: night, storm
let g:tokyonight_enable_italic = 0
let g:tokyonight_disable_italic_comment = 0
colorscheme tokyonight

" {{ Statusline }}
" Vim-airline
let g:airline_theme = 'onedark'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Disable automatic comment in newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Other setting
for setting_file in split(glob(stdpath('config').'/settings/*.vim'))
  execute 'source' setting_file
endfor
