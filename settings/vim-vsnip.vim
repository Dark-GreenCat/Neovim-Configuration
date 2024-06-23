" Expand
imap <expr> <C-a>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-a>'
smap <expr> <C-a>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-a>'

" Expand or jump
imap <expr> <C-b>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-b>'
smap <expr> <C-b>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-b>'

" Jump forward or backward
imap <expr> <C-m>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-m>'
smap <expr> <C-m>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-m>'
imap <expr> <C-n>   vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-n>'
smap <expr> <C-n>   vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-n>'