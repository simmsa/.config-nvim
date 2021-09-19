function! pomo#Setup()
    try
        let g:pomo_info = json_decode(readfile(g:pomo_settings_file))
        if !g:pomo_info.is_running
            call pomo#RestartIfNecessary(g:pomo_info.last_start)
        endif
    catch /E484*/
        return
    endtry
endfunction

function! pomo#Teardown()
    let g:pomo_info.is_running = v:false
    let g:pomo_info = json_decode(readfile(g:pomo_settings_file))
endfunction

function! pomo#Save()
    call writefile([json_encode(g:pomo_info)], g:pomo_settings_file)
endfunction

function! pomo#RestartIfNecessary(last_start)
    try
        if (localtime() - a:last_start) < g:pomo_seconds
            let g:pomo_info.is_running = v:true
            call pomo#Save()
            let l:pomo_time_elapsed = localtime() - a:last_start
            let g:pomo_timer_id = timer_start((g:pomo_seconds - l:pomo_time_elapsed) * 1000, function('OsxNotifyPomoEnd'))
            " echo 'Restarting Pomodoro ...'
            " call timer_start(3000, function('ClearCmdLine'))
        endif
    endtry
endfunction

function! PomoRunOsxKeystroke(fname)
    call jobstart(printf('osascript ~/pomo/%s.scpt', a:fname))
endfunction

function! StartPomo()
    echo 'Starting Pomodoro...'
    call PomoRunOsxKeystroke('StartTomighty')
    call timer_start(3000, function('ClearCmdLine'))
    let g:pomo_timer_id = timer_start(g:pomo_minutes * 60 * 1000, function('OsxNotifyPomoEnd'))
    let g:pomo_info.last_start = localtime()
    let g:pomo_info.is_running = v:true

    call pomo#Save()
    " call writefile([g:pomo_start], g:pomo_settings_file)
endfunction

function! ClearCmdLine(timer)
    redraw!
endfunction

function! EndPomo(show_message)
    if a:show_message == v:true
        call PomoRunOsxKeystroke('StopTomighty')
        call PomoOsxNotif('Pomodoro Cancelled!')
    endif

    let g:pomo_info.is_running = v:false
    call pomo#Save()
    " let g:pomo_is_active = v:false
    " let g:pomo_start = 0
    " let g:pomo_count = -1
    " call writefile([0], g:pomo_settings_file)

    if g:pomo_timer_id > -1
        call timer_stop(g:pomo_timer_id)
        let g:pomo_timer_id = -1
    endif
endfunction

function! s:PomoShortBreak()
    call PomoRunOsxKeystroke('ShortBreakTomighty')
    call PomoOsxNotif('Pomodoro Short Break!')
endfunction

function! s:PomoLongBreak()
    call PomoRunOsxKeystroke('LongBreakTomighty')
    call PomoOsxNotif('Pomodoro Long Break!')
endfunction

function! OsxNotifyPomoEnd(timer)
    call PomoOsxNotif('Pomodoro Complete')
    call jobstart(g:pomo_complete_script)
endfunction

function! PomoOsxNotif(message)
    let l:args = []
    call add(l:args, '-title Pomodoro')
    call add(l:args, "-message '" . a:message . "'" )
    call add(l:args, '-sound Glass')
    call add(l:args, '-sender org.tomighty.Tomighty')
    call jobstart('terminal-notifier ' . join(l:args, ' '))
endfunction

function! GetPomoTimeRemainingString()
    if (g:pomo_start == 0 || g:pomo_is_active == v:false)
        return
    endif

    if g:pomo_count == -1
        let g:pomo_count = substitute(system('pomo -c'), '\n\+$', '', 'g')
    endif

    let l:now = localtime()
    let l:sec_elapsed = l:now - g:pomo_start
    if l:sec_elapsed <= g:pomo_seconds
        let l:minutes = float2nr(floor((g:pomo_seconds - l:sec_elapsed) / 60))
        let l:seconds = ((g:pomo_seconds - l:sec_elapsed) % 60)
        if l:minutes > 0
            let l:time_string = printf('%s minute%s remaining', l:minutes, l:minutes == 1 ? '' : 's')
        else
            let l:time_string = printf('%s second%s remaining', l:seconds, l:seconds == 1 ? '' : 's')
        endif
        return printf('%s : %s Pomo%s Today', l:time_string, g:pomo_count, g:pomo_count == 1 ? '' : 's')
    else
        call EndPomo(v:false)
        return ''
    endif
endfunction

function! pomo#ShowPomoChoices()
    let l:pomo_options = [
        \ '&Start',
        \ '&Cancel',
        \ '&Break',
        \ '&Long Break',
    \]

    let l:choice = confirm("Pomo Choice\n", join(l:pomo_options, "\n"))

    if l:choice == 1
        call StartPomo()
    elseif l:choice == 2
        call EndPomo(v:true)
    elseif l:choice == 3
        call s:PomoShortBreak()
    elseif l:choice == 4
        call s:PomoLongBreak()
    endif

    return
endfunction
