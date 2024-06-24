"--- C/C++ Format ---------------------------

" Requirement: clang-format executable
" .clang-format file generator: https://zed0.co.uk/clang-format-configurator/
" Indent key: ==
" Format key: gq
augroup c_cpp_indentation
    autocmd!
    autocmd FileType c,cpp,h,hpp setlocal formatprg=clangformat
augroup END
