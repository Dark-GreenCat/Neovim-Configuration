"--- C/C++ Format ---------------------------

" Requirement: clang-format executable
" .clang-format file generator: https://zed0.co.uk/clang-format-configurator/
" Indent key: ==
" Format key: gq
augroup c_cpp_indentation
  autocmd!

  " Set formatter to clang-format
  autocmd FileType c,cpp,h,hpp setlocal formatprg=clang-format
augroup END

nnoremap <leader>f    gggqG<C-o><C-o>
