" Enable AutoSave on Vim startup
let g:auto_save = 1

" Display the auto-save notification
let g:auto_save_silent = 0

let g:auto_save_events = ["InsertLeave", "TextChanged"]

" Write all open buffers as if you would use :wa
let g:auto_save_write_all_buffers = 1

