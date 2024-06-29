"""""""""""""""""""""""""""""""""""""""""""""
"------------ GENERAL SETTINGS -------------"
"""""""""""""""""""""""""""""""""""""""""""""

" Syntax highlight
syntax enable
syntax on

" Basic settings
set mouse=a                 " Enable mouse
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set listchars=tab:\¦\       " Tab charactor
set list
set foldmethod=syntax
set foldnestmax=1
set foldlevelstart=0
set nofoldenable
set number                  " Show line number
set ignorecase              " Enable case-sensitive
set cursorline              " Highlight line of cursor
set nobomb
set nomodeline
set noshowmode
set termguicolors
set inccommand=split

" Disable backup
set nobackup
set nowb
set noswapfile

" Optimize
set synmaxcol=512
set lazyredraw

" Change foldmethod for specific filetype
au! BufNewFile,BufRead *.json set foldmethod=indent

" Enable auto completion menu after pressing TAB
set wildmenu
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

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

" Set indentation for specific filetype
autocmd FileType vim,lua setlocal shiftwidth=2 softtabstop=2 expandtab




"""""""""""""""""""""""""""""""""""""""""""""
"-------------- KEY MAPPINGS ---------------"
"""""""""""""""""""""""""""""""""""""""""""""

" Resize panel
nnoremap <M-Right> :vertical resize +1<CR>
nnoremap <M-Left> :vertical resize -1<CR>
nnoremap <M-Down> :resize +1<CR>
nnoremap <M-Up> :resize -1<CR>

" Resize font
nnoremap <M-=> :call AdjustFontSize(1)<CR>
nnoremap <M--> :call AdjustFontSize(-1)<CR>
nnoremap <M-0> :call AdjustFontSize(0)<CR>

let s:fontsize = 10
function! AdjustFontSize(amount)
  if a:amount == 0
      let s:fontsize = 10
  else
      let s:fontsize = s:fontsize+a:amount
  endif
  :execute "GuiFont! " . g:GuiFont .":h" . s:fontsize
endfunction

" Paste yanked text in command mode
cnoremap <C-S-v> <C-r><S-">
" Paste from system clipboard in command mode
cnoremap <C-V> <C-R>+
" Paste from system clipboard in insert mode
inoremap <C-V> <ESC><ESC>p<ESC>a

" Return to normal mode from terminal mode
tnoremap <leader><ESC> <C-\><C-n>

" Split panel
nnoremap <leader>v <C-w>v
nnoremap <leader>s <C-w>s

" Line moving
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==

inoremap <M-j> <ESC>:m .+1<CR>==gi
inoremap <M-k> <ESC>:m .-2<CR>==gi

vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv

" Line duplicating
nnoremap <M-S-j> yyp
nnoremap <M-S-k> yyP

inoremap <M-S-j> <ESC>yypgi
inoremap <M-S-k> <ESC>yyPgi

vnoremap <M-S-j> y`]pgv
vnoremap <M-S-k> y`]pgv

" Switch buffer
noremap <C-TAB> :bn<CR>
noremap <C-S-TAB> :bp<CR>

" Close current buffer
noremap <leader>bd :bp<bar>sp<bar>bn<bar>bd<CR>

" Search hightlighted text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>
nnoremap /\ :noh<CR>

" Quickly insert blank lines without leaving normal mode and without moving cursor
nnoremap <silent> <leader>o :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
nnoremap <silent> <leader>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>

" Switch split window
nnoremap <C-Right> <C-w>l
nnoremap <C-Left> <C-w>h
nnoremap <C-Up> <C-w>k
nnoremap <C-Down> <C-w>j

inoremap <C-Right> <ESC><C-w>l<ESC>a
inoremap <C-Left> <ESC><C-w>h<ESC>a
inoremap <C-Up> <ESC><C-w>k<ESC>a
inoremap <C-Down> <ESC><C-w>j<ESC>a

tnoremap <C-Right> <C-\><C-n><C-w>l
tnoremap <C-Left> <C-\><C-n><C-w>h
tnoremap <C-Up> <C-\><C-n><C-w>k
tnoremap <C-Down> <C-\><C-n><C-w>j




"""""""""""""""""""""""""""""""""""""""""""""
"------------ PLUG-IN SETTINGS -------------"
"""""""""""""""""""""""""""""""""""""""""""""

" Load plug-in using Vim-Plug
call plug#begin(stdpath('config').'/plugged')

    "--- UI Themes --------------------------
    Plug 'joshdick/onedark.vim'
    Plug 'ghifarit53/tokyonight-vim'
    Plug 'drewtempelmeyer/palenight.vim'

    "--- Statusline --------------------------
    Plug 'itchyny/lightline.vim'
    Plug 'mengelbrecht/lightline-bufferline'

    "--- File Browser -----------------------
    Plug 'lambdalisue/fern.vim'
    Plug 'lambdalisue/fern-git-status.vim'
    Plug 'lambdalisue/glyph-palette.vim'
    Plug 'lambdalisue/nerdfont.vim'
    Plug 'lambdalisue/fern-renderer-nerdfont.vim'
    Plug 'lambdalisue/fern-hijack.vim'
    Plug 'andykog/fern-copynode.vim'

    "--- File Search -------------------------
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    "--- Git Inside Vim ----------------------
    Plug 'tpope/vim-fugitive'
    Plug 'rbong/vim-flog'
    Plug 'airblade/vim-gitgutter'

    "--- Code Productivity -------------------
    Plug 'tpope/vim-commentary'
    Plug 'cohama/lexima.vim'        " Auto close parentheses and repeat by dot dot dot...
    Plug 'ntpeters/vim-better-whitespace'     " Highlight trailling whitespace
    Plug 'lambdalisue/battery.vim'

    "--- Code Intellisense -------------------
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'ray-x/lsp_signature.nvim'
    Plug 'smjonas/inc-rename.nvim'

    "--- Markdown -----------------------------
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

    "--- Debugger -----------------------------
    Plug 'puremourning/vimspector'

    " For vsnip users.
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'

    "--- Inside Terminal ----------------------
    Plug 'voldikss/vim-floaterm'

    "--- Fast Neovim Setup --------------------
    Plug 'echasnovski/mini.nvim', { 'branch': 'stable' }
    Plug 'rcarriga/nvim-notify'
    Plug '907th/vim-auto-save'
    Plug 'j-hui/fidget.nvim'

call plug#end()


"--- Config UI Themes -----------------------
if (has("termguicolors"))
 set termguicolors
endif

" set background=dark
let g:tokyonight_style = 'storm'                " Available: night, storm
let g:tokyonight_enable_italic = 0
let g:tokyonight_disable_italic_comment = 0
colorscheme tokyonight

" neovim (lsp) diagnostics
hi FloatBorder guibg=#24283b guifg=#8087a6
hi NormalFloat guibg=#24283b

"--- Config File Browser --------------------
let g:fern#renderer = "nerdfont"

augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END


"--- Other Settings -------------------------
for setting_file in split(glob(stdpath('config').'/settings/*.vim'))
  execute 'source' setting_file
endfor

for setting_file in split(glob(stdpath('config').'/settings/*.lua'))
  execute 'source' setting_file
endfor

"--- Startup Configuaration ------------------
augroup my-nvim-startup
  autocmd! *
  autocmd VimEnter * ++nested Fern ~/ -drawer -stay -keep
augroup END
