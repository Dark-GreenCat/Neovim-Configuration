call plug#begin(stdpath('config').'/plugged')

    "--- UI Themes --------------------------
    Plug 'joshdick/onedark.vim'
    Plug 'ghifarit53/tokyonight-vim'
    Plug 'drewtempelmeyer/palenight.vim'

call plug#end()


"--- Config UI Themes -----------------------
if (has("termguicolors"))
 set termguicolors
endif

set background=dark
colorscheme tokyonight
