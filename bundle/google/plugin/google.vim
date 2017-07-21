let g:google_open_browser_command = 'open'

command! -nargs=+ Google call google#Google(<q-args>)
command! -nargs=+ G call google#Google(<q-args>)

nnoremap <silent> ge :call google#GoogleCurrentQuickfixError()<CR>
nnoremap <silent> g. :call google#GoogleCursorWithFiletype()<CR>
