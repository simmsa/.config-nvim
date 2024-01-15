let g:google_open_browser_command = 'open'

command! -nargs=+ Google call google#Google(<q-args>)
" command! -nargs=+ G call google#Google(<q-args>)
command! -range Google <line1>,<line2>call google#GoogleSelection()
" command! -range G <line1>,<line2>call google#GoogleSelection()
command! -range Search <line1>,<line2>call google#GoogleSelection()

nnoremap <silent> ge :call google#GoogleCurrentQuickfixError()<CR>
nnoremap <silent> g. :call google#GoogleCursorWithFiletype()<CR>
