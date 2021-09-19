let g:pomo_settings_file = fnamemodify(expand('~/.local/share/nvim'), ':p:h') . '/pomo_save.json'
let g:pomo_minutes = 25
let g:pomo_seconds = g:pomo_minutes * 60
" let g:pomo_is_active = get(g:, 'pomo_is_active', v:false)
let g:pomo_timer_id = get(g:, 'pomo_timer_id', -1)
" Hack to get the dialog window to appear in the foreground
let g:pomo_complete_script = 'open -j ~/pomo/pomo_dialog.app && open -F ~/pomo/pomo_dialog.app '
let g:pomo_count = -1
" let g:pomo_start = pomo#GetPomoLastStart()
let g:pomo_info = {
    \ 'last_start': 0,
    \ 'is_running': v:false,
\ }

augroup pomo_plugin
    au!
    au VimEnter * call pomo#Setup()
    au VimLeave * call pomo#Teardown()
augroup END

nnoremap <silent> <Leader>p :call pomo#ShowPomoChoices()<CR>
