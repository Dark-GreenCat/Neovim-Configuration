" Jump forward or backward
imap <expr> <TAB>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-m>'
smap <expr> <TAB>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<C-m>'
imap <expr> <S-TAB>   vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-n>'
smap <expr> <S-TAB>   vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-n>'
