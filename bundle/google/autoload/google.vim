function! google#UriEncode(text)
    return system(printf("ruby -rcgi -e 'print CGI::escape(%s)'", '"' . a:text . '"'))
endfunction

function! google#Google(text)
    let l:google_query_url = 'https://www.google.com/search?q='
    let l:query_string = google#UriEncode(a:text)
    call jobstart(printf("%s \"%s%s\"", g:google_open_browser_command, l:google_query_url, l:query_string))
endfunction

function! google#GoogleGetLucky(text)
    let l:google_query_url = 'https://www.google.com/search?q='
    let l:query_string = google#UriEncode(a:text)
    let l:get_lucky_postfix = '&btnI'
    call jobstart(printf("%s \"%s%s%s\"", g:google_open_browser_command, l:google_query_url, l:query_string, l:get_lucky_postfix))
endfunction

function! google#FindQuickfixErrorAtLocation(input_list)
    let l:current_line_num = line('.')
    let l:current_col_num = col('.')
    let l:errors_on_line = []
    for l:e in a:input_list
        if l:e.lnum == l:current_line_num
            call add(l:errors_on_line, l:e)
        endif
    endfor

    if len(l:errors_on_line) == 0
        echo 'No errors at your current cursor location!'
    elseif len(l:errors_on_line) == 1
        return l:errors_on_line[0].text
    else
        let l:errors_at_cursor = []
        for l:e in l:errors_on_line
            if l:e.col == l:current_col_num
                call add(l:errors_at_cursor, l:e)
            endif
        endfor
        if len(l:errors_at_cursor) >= 1
            return l:errors_at_cursor[0].text
        else
            return l:errors_on_line[0].text
        endif
    endif
    return ''
endfunction

function! google#GoogleCurrentQuickfixError()
    " Used for ycm compilation errors, check this first
    let l:loc_list = getloclist(0)

    if len(l:loc_list) > 0
        let l:loc_error_at_cursor = google#FindQuickfixErrorAtLocation(l:loc_list)
        if strlen(l:loc_error_at_cursor) > 0
            call google#Google(l:loc_error_at_cursor)
        endif
    else
        " Used for ale which shows linting errors
        let l:qf_list = getqflist()
        if len(l:qf_list) > 0
            let l:qf_error_at_cursor = google#FindQuickfixErrorAtLocation(l:qf_list)
            if strlen(l:qf_error_at_cursor) > 0
                call google#Google(l:qf_error_at_cursor)
            endif
        endif
    endif
endfunction

function! google#GoogleCursorWithFiletype()
    let l:filetype = GetCurrentBufferVar('&ft')

    let l:ft_map = {'typescript': 'javascript'}
    let l:mapped_ft = get(l:ft_map, l:filetype, l:filetype)

    let l:word = expand('<cword>')
    call google#GoogleGetLucky(l:mapped_ft . ' ' . l:word)
endfunction

function google#GoogleSelection() range
    " Get the line and column of the visual selection marks
    let [l:lnum1, l:col1] = getpos("'<")[1:2]
    let [l:lnum2, l:col2] = getpos("'>")[1:2]

    " Get all the lines represented by this range
    let l:lines = getline(l:lnum1, l:lnum2)

    " The last line might need to be cut if the visual selection didn't end on the last column
    let l:lines[-1] = l:lines[-1][: l:col2 - (&selection == 'inclusive' ? 1 : 2)]
    " The first line might need to be trimmed if the visual selection didn't start on the first column
    let l:lines[0] = l:lines[0][l:col1 - 1:]

    " Get the desired text
    let l:selected_text = join(l:lines, " ")
    call google#Google(l:selected_text)
endfunction
