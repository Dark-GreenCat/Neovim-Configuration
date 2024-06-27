" Jump forward or backward
imap <expr> <TAB>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<TAB>'
smap <expr> <TAB>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<TAB>'
imap <expr> <S-TAB>   vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-TAB>'
smap <expr> <S-TAB>   vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-TAB>'
