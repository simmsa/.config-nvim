" Author: Andrew Simms <andrew@andrewdsimms.com> <https://github.com/simmsa>
" Plugin Manager --------------------------------------------------------{{{

lua << EOF

require('plugins')

EOF


" End Plugin Manager ----------------------------------------------------}}}
" Color Scheme -------------------------------------------------- {{{

" Tabs and Spaces -------------------------------------------------- {{{

"Use spaces instead of tabs
set expandtab
"1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

" }}}

" }}}
" Color Scheme -------------------------------------------------- {{{

" }}}
" Basic Options {{{

lua << EOF

require('startup')

EOF

" }}}
" Should Be Built In -------------------------------------------------- {{{

function! GetVisualSelection()
    " from xolox @
    " http://stackoverflow.com/questions/1533565/how-to-get-visually-selected-text-in-vimscript
    let [l:lnum1, l:col1] = getpos("'<")[1:2]
    let [l:lnum2, l:col2] = getpos("'>")[1:2]
    let l:lines = getline(l:lnum1, l:lnum2)
    let l:lines[-1] = l:lines[-1][: l:col2 - (&selection ==# 'inclusive' ? 1 : 2)]
    let l:lines[0] = l:lines[0][l:col1 - 1:]
    return join(l:lines, "\n")
endfunction

function! GetCurrentBufferVar(var)
    return getbufvar(bufnr(bufname('%')), a:var)
endfunction

function! HexToCTerm()
    let l:hex_color = '"' . expand('<cword>') . '"'
    let l:result = system('python colors/colortrans.py ' . l:hex_color)
    let l:result = split(l:result, ' ')[6]
    call feedkeys('cw')
    call feedkeys(l:result)
    call feedkeys("\<Esc>")
endfunction

" End Should Be Built In ---------------------------------------------- }}}
" Dvorak -------------------------------------------------- {{{

" Map dvorak keys everywhere with noremap explicitly
" Yeah this is weird but it keeps me from getting lazy!
let g:h_t_repeat_message = 'Stop Spamming h/t! Use H, /, *, Tags to Navigate!'
let g:d_n_repeat_message = 'Stop Spamming d/n! Use u, e, to Navigate!'
let g:w_b_repeat_message = 'Stop Spamming w/b! Use u, e, to Navigate!'
" nnoremap <silent> h :<C-U>call WarnOnRepeat("h", "VCountZero\ gj\ j", g:h_t_repeat_message)<CR>
nnoremap <silent> <expr> h (v:count == 0 ? 'gj' : 'j')
nnoremap <silent> <expr> t (v:count == 0 ? 'gk' : 'k')
" nnoremap <silent> t :<C-U>call WarnOnRepeat("t", "VCountZero\ gk\ k", g:h_t_repeat_message)<CR>
nnoremap <silent> d :call WarnOnRepeat("left", 'normal! h', g:d_n_repeat_message)<CR>
nnoremap <silent> n :call WarnOnRepeat("right", 'normal! l', g:d_n_repeat_message)<CR>
nnoremap <silent> w :call WarnOnRepeat("w", 'normal! w', g:w_b_repeat_message)<CR>
nnoremap <silent> b :call WarnOnRepeat("b", 'normal! b', g:w_b_repeat_message)<CR>

xnoremap <silent> <expr> h (v:count == 0 ? 'gj' : 'j')
xnoremap <silent> <expr> t (v:count == 0 ? 'gk' : 'k')
xnoremap d <Left>
xnoremap n <Right>

function! VCountZero(isZero, notZero)
    if v:count == 0
        exe 'normal! ' . a:isZero
    else
        for l:i in range(v:count)
            exe 'normal! ' . a:notZero
        endfor

    endif
endfunction
command! -bar -nargs=* VCountZero call VCountZero(<f-args>)

let g:WarnOnRepeatDict = {}
let g:WarnOnRepeatPassTimes = 0

function! WarnOnRepeat(input, cmd, warn_message)
    let l:max_repeats = 5000
    if !has_key(g:WarnOnRepeatDict, a:input)
        let g:WarnOnRepeatDict[a:input] = []
    endif

    call add(g:WarnOnRepeatDict[a:input], localtime())

    if len(g:WarnOnRepeatDict[a:input]) > l:max_repeats
        call remove(g:WarnOnRepeatDict[a:input], 0)
    endif

    let l:isWithinRepeatRange = len(g:WarnOnRepeatDict[a:input]) < l:max_repeats
    let l:isWithinTimeRange = g:WarnOnRepeatDict[a:input][0] != g:WarnOnRepeatDict[a:input][-1]

    if l:isWithinRepeatRange || l:isWithinTimeRange
        exe a:cmd
    else
        echohl Error | echo a:warn_message | echohl None
    endif
endfunction

" Quicker Movement
nnoremap D ^
nnoremap N g_
xnoremap D ^
xnoremap N g_

" j is now jump, swapping with t
noremap j t
" k is now kill swapping with d
noremap k d
" l is now look up next swapping with n
noremap <silent> l :normal! nzz<CR>
noremap <silent> L :normal! Nzz<CR>
" Consistent behavior with C
noremap K d$
noremap Y y$
"easier navigation of finds
noremap - :
" Faster Movements (lookUps)
" u -> f mapped with vim-sneak
" I Fudged up
noremap f u

xmap n <Right>

" }}}
" Convience Mappings ------------------------------------------------- {{{

"<Ctrl-l> redraws the screen and removes any search highlighting
nnoremap <silent> <C-l> :nohl<CR><C-l>
"Changing number incrementing
nnoremap <C-j> <C-a>
nnoremap <C-k> <C-x>
"Quicker Commands
nnoremap ; :
xmap ; :
nnoremap : ;
" Insert multiple lines (o stays in normal mode and works with a count)
nnoremap o o<Esc>S
nnoremap O @='O<C-V><Esc>'<CR>S
" Easier tabbing of selections
xnoremap < <gv
xnoremap > >gv
" Faster repeat command
nnoremap <C-P> :<C-P><CR>
"Quickfix mappings
augroup qf_map
    autocmd!
    autocmd BufReadPost quickfix nnoremap <buffer> <C-N> <Down>
    autocmd BufReadPost quickfix nnoremap <buffer> <C-T> <Up>
augroup END
" Get to the shell faster
if has('nvim')
    nnoremap S :Term<Space>
    nnoremap <C-s> :TermStayOpen<Space>
else
    nnoremap S :!<Space>
endif
" Make <C-P> behave like it should and also zsh like
cnoremap <C-P> <Up>
cnoremap <C-T> <Up>
" Easier uppercase
inoremap <C-l> <ESC>mzgUiw`zi<Right>
" Faster save
nnoremap sa :w<CR>
" Save All
nnoremap sl :wa<CR>
" Faster window switching
function! SmartSwitchWindow(direction)
    if a:direction ==# 'right'
        let l:switch_command = ':winc w'
    elseif a:direction ==# 'left'
        let l:switch_command = ':winc h'
    endif
    let l:skip_buftypes = ['quickfix']
    exe l:switch_command
    while (index(l:skip_buftypes, &buftype) != -1)
        exe l:switch_command
    endwhile
endfunction
nnoremap <silent> ss :call SmartSwitchWindow("right")<CR>
function! SmartBufferDelete()
    " If the buffer is of the following filetypes close it and exit function
    let l:quick_close_ft_array = ['git', 'org', 'gitcommit', 'qf']
    if index(l:quick_close_ft_array, &filetype) > -1
        exe 'bd'
        return
    endif

    " There are some buffer types that I want to close no matter what
    " window I am in
    let l:buftype_close_keywords = ['nofile', 'quickfix', 'help']
    let l:max_buffers_open = 20
    for l:i in range(l:max_buffers_open)
        if index(l:buftype_close_keywords, getbufvar(l:i, '&buftype')) > -1
            exe 'bd ' . l:i
            return
        endif
    endfor

    " If the current buffer
    " Next two lines from
    " http://stackoverflow.com/questions/2974192/how-can-i-pare-down-vims-buffer-list-to-only-include-active-buffers/2974600#2974600n
    " Changed range min from 0 to 1 see :h bufname() for explanation
    " of the 0 buffer, I think I don't need it here
    let l:buffers_open = len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
    let l:windows_open = len(lh#list#unique_sort(eval(join(map(range(1, tabpagenr()), 'tabpagebuflist(v:val)'), '+'))))
    " If there is only one (or none) buffer(s) open quit vim and only one
    " window open
    if l:buffers_open <= 1 && l:windows_open <= 1
        exe ':q'
    " If there is only window open, close the current window
    elseif l:windows_open == 1
        exe ':bd'
    " If one file is open but split between windows
    elseif l:windows_open > 1 && l:buffers_open == 1
        exe 'winc q'
    " If there are only two windows (splits) open and two buffers close the current buffer
    elseif l:buffers_open == 2 && l:windows_open == 2
        exe ':bd'
    " If there is a split window and more than two buffers, keep the split there just
    " close the current file and put another file in that split
    elseif l:buffers_open > 2 && l:windows_open >= 2
        exe ':b#|bd#'
    endif
endfunction
nnoremap <silent> sx :call SmartBufferDelete()<CR>
" Vertically split the current file
nnoremap sv :vs<CR>
" Remap man command
nnoremap M K
" Faster tab in insert mode.
imap <C-t> <tab>
" I always use A and never use a, so why not save a motion
nnoremap a A
nnoremap A a
" Zipping
" Zip current char to the last char
nmap ze xNp
" Make y jump to the end of the selection
xnoremap <silent> y y`]
xnoremap <silent> p p`]
nnoremap <silent> p p`]
" Go to previous buffer
nnoremap gp <C-^>
nnoremap <S-tab> :bp<CR>
" Use full width of the screen
function! NoDistractions()
    :set norelativenumber
    :set nonumber
    :set nolist
    :silent AirlineToggleWhitespace
endfunction
command! Nd :silent call NoDistractions()
" Exit
nnoremap X :qall<CR>
" navigate quickfix / location list
" I don't like that the quickfix and location list maps are different. This
" combines them into a single mapping by trying each command in order until
" one works. Also centers, opens folds and calls repeat
function! QuickfixMap(inputs, input_map, ...)
    let l:post_inputs = ['normal! zO', 'normal! zz']
    for l:input in a:inputs
        try
            execute l:input
            call add(l:post_inputs, printf('call repeat#set("%s")', a:input_map))
            if a:000[0] > 1 && a:000[1] !=# 'skip_post_input'
                for l:post_input in l:post_inputs
                    try
                        execute l:post_input
                    catch
                    endtry
                endfor
                return
            endif
        catch
            " try next input
        endtry
    endfor
endfunction

" q Macros can still be used, just not the ones below We first want to
" navigate to errors, warnings than other quickfix list items
nnoremap <silent> qq :call QuickfixMap(['lfirst', 'cfirst', 'normal! ]s'], 'qq')<CR>
nnoremap <silent> qh :call QuickfixMap(['lnext', 'cnext'], 'qh')<CR>
nnoremap <silent> qt :call QuickfixMap(['lprev', 'cprev'], 'qt')<CR>
nnoremap <silent> qo :call QuickfixMap(['lopen', 'copen'], 'qo', 'skip_post_input')<CR>
nnoremap <silent> qc :call QuickfixMap(['lclose', 'cclose'], 'qc', 'skip_post_input')<CR>
" I never use ; in any commands, but I use : all the time
cnoremap ; :
cnoremap : ;
" Mouse scroll in iterm2
set mouse=nicr
" Fix unwanted action in normal mode
nnoremap <C-f> :echo "Not in insert mode!"<CR>
" Read the file, useful for proofreading
function! SpeakText(input)
    " Stop any voices
    call StopSpeakText()
    let l:voice = 'Zoe'
    let l:text = ''
    if a:input ==# 'line'
        let l:text = getline(line('.'))
    elseif a:input ==# 'selection'
        let l:text = GetVisualSelection()
    elseif a:input ==# 'buffer'
        let l:end = search('^$') - 1
        let l:text = join(getline(1, l:end), ' ')
    else
        let l:text = a:input
    endif

   call jobstart('say -v ' . l:voice . ' ' . shellescape(l:text), {})

    return
endfunction

function! StopSpeakText()
    call system('killall say')
endfunction

command! Read call SpeakText("buffer")
xnoremap <silent> st :call SpeakText("selection")<CR>
nnoremap <silent> sk :call StopSpeakText()<CR>
nnoremap <silent> st :call SpeakText("line")<CR>
" Go to the next buffer
nnoremap <Tab> :bn<CR>
" Faster semicolon insert
" Note, <C-punctuation> mappings don't work due to term issues
inoremap <C-s> <End>;
" Navigate the quickfix list
nnoremap cc :cc<CR>
" Seriously go to the end of the line in insert mode
inoremap <C-e> <End>
" " Make bottom horizontal split vertical and reverse
function! HorizontalToVerticalSplit()
    execute 'winc H'
    execute 'winc r'
endfunction
augroup leader_h_map
    au VimEnter * nnoremap <silent> <Leader>h :call HorizontalToVerticalSplit()<CR>
augroup END
" Faster window resizing
nnoremap = <C-w>=
" Faster window switching
nnoremap <silent> ) :call SmartSwitchWindow("right")<CR>
nnoremap <silent> ( :call SmartSwitchWindow("left")<CR>

augroup qf_mods
    au!
    autocmd FileType qf execute("winc H|vertical resize 80")
augroup END

" }}}
" Leader Mappings -------------------------------------------------- {{{

" Map leader key to space
let g:mapleader = "\<Space>"
let g:maplocalleader = ","
" <Space> w to save a file
nnoremap <Leader>w :w<CR>
"<Space> s to source VIMRC
" A Complete source sources the current vimrc and resets the filetype to the
" current filetype
if(!exists('*AbsoluteSource'))
    function! AbsoluteSource()
        let l:vimrc = $MYVIMRC
        exe 'source ' . l:vimrc
        let l:ft = GetCurrentBufferVar('&filetype')
        exe 'set ft=' . l:ft
    endfunction
    command! AbsoluteSource call AbsoluteSource()
endif
nnoremap <Leader>s :AbsoluteSource<CR>
" Yank to the system register
vmap <Leader>y "+y
vnoremap <Leader>y "+y

"Easy buffer switching
nnoremap <Leader>d :bd<CR>
" Substitute like * (\< and \> select only that word)
nnoremap <Leader>; :%s:\<<C-R><C-W>\>:
" Spell Checking (Change cursorline to underline to retain highlights)
function! ToggleSpellCheck()
    if (&spell == 0)
        setlocal spell
        hi Cursorline ctermfg=NONE ctermbg=NONE cterm=underline
        setlocal complete+=kspell
        echo 'Spell Check On!'
    else
        setlocal nospell
        hi Cursorline ctermfg=NONE ctermbg=8 cterm=NONE
        setlocal complete-=kspell
        echo 'Spell Check Off!'
    endif
endfunction
nnoremap <silent> cos :call ToggleSpellCheck()<CR>
" Spelling suggestions
nnoremap sg z=
" Navigate misspelled words
function! NextMisspelledWord()
    normal! ]s
    normal! zv
    normal! z.
    call repeat#set('sn')
endfunction
command! NextMisspelledWord call NextMisspelledWord()
nnoremap sn :NextMisspelledWord<CR>
function! PreviousMisspelledWord()
    normal! [s
    normal! zv
    normal! z.
    call repeat#set('sp')
endfunction
command! PreviousMisspelledWord call PreviousMisspelledWord()
nnoremap sp :PreviousMisspelledWord<CR>

let g:log_file = '~/.local/share/nvim/verbose.log'

function! StartLogging()
    call system('rm ' . g:log_file)
    echo 'Turning on logging'
    exe 'profile start ' . g:log_file
    exe 'profile func *'
endfunction

function! StopLogging()
    echo 'Turning off logging'
    exe 'profile stop'
endfunction

function! OpenLog()
    exe 'e ' . g:log_file
endfunction

nnoremap <silent> <Leader>ls :call StartLogging()<CR>
nnoremap <silent> <Leader>lk :call StopLogging()<CR>
nnoremap <silent> <Leader>lo :call OpenLog()<CR>

" }}}
" Cool Functions -------------------------------------------------- {{{

"Make sure vim returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   execute 'normal! g`"zvzz' |
        \ endif
augroup END

" Center first search result
cnoremap <expr> <CR> getcmdtype() =~ '[/?]' ? '<CR>zz' : '<CR>'

" Vertically split current file and scroll with it
nnoremap <silent> sf :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>

" Window titles for tmux
function! TruncateFilename(max_len)
    let l:filename = expand('%:t')
    if len(l:filename) <= a:max_len
        return l:filename
    else
        let l:filename_len = len(l:filename)
        let l:half = a:max_len / 2
        return l:filename[0:l:half-1] . '…' . l:filename[l:filename_len-(l:half):l:filename_len-1]
    endif
endfunction

augroup tmux_rename_window
    autocmd!
    autocmd BufReadPost,FileReadPost,BufNewFile,BufEnter * call jobstart("tmux rename-window " . TruncateFilename($TRUNCATE_MAX_WORD_LEN))
augroup END

" Open terminals in a vertical buffer 80 chars wide.
" Note: Resizing a terminal does not re wrap the lines.
let s:term_open_cmd = '80vnew'
let s:h_term_open_cmd = '10new'

let s:Term = {}
function! s:Term.on_exit(job_id, exit_code, event_type)
    echom printf('"%s" completed with status %s!', l:self.input_command, a:exit_code)

    " If the command completed successfully close the buffer
    if (a:exit_code == 0)
        exe 'bd!'
    endif
endfunction

function! StartTermAutoExit(input_command, open_new_buffer)
    if a:open_new_buffer
        exe s:term_open_cmd
    else
        exe s:term_open_cmd
        exe 'winc p'
    endif

    let l:term_options = {
        \'input_command': a:input_command,
    \}

    let l:auto_exit_dict = extend(copy(s:Term), l:term_options)
    call termopen(a:input_command, l:auto_exit_dict)

    exe 'startinsert'
endfunction

function! StartHTermAutoExit(input_command, open_new_buffer)
    if a:open_new_buffer
        exe s:h_term_open_cmd
    else
        exe s:h_term_open_cmd
        exe 'winc p'
    endif

    let l:term_options = {
        \'input_command': a:input_command,
    \}

    let l:auto_exit_dict = extend(copy(s:Term), l:term_options)
    call termopen(a:input_command, l:auto_exit_dict)

    exe 'startinsert'
endfunction


function! TermSameBuf(cmd)
    call StartTermAutoExit(a:cmd, '', v:false)
endfunction

function! Term(cmd)
    if empty(a:cmd)
        exe s:term_open_cmd
        exe 'term'
    else
        call StartTermAutoExit(a:cmd, v:true)
    endif
endfunction

function! TermStayOpen(cmd)
    exe s:term_open_cmd
    call termopen(a:cmd, {'cwd': a:cwd})
endfunction

function! BackgroundTerm(cmd)
    call jobstart(a:cmd)
endfunction

command! -bar -nargs=* -complete=shellcmd Term :call Term(<q-args>)
command! -bar -nargs=* -complete=shellcmd TermSameBuf :call TermSameBuf(<q-args>)
command! -bar -nargs=* -complete=shellcmd TermStayOpen :call TermStayOpen(<q-args>)
command! -bar -nargs=* -complete=shellcmd BackgroundTerm :call BackgroundTerm(<q-args>)

augroup Term
    au!
    " Turn off line numbers in the terminal
    " See https://github.com/neovim/neovim/issues/6832
    au TermOpen * setlocal nonumber norelativenumber
    au TermOpen * startinsert
augroup END

" Enable custom vim commands in any directory
function! SourceDirectory()
    let l:vim_dir_file = '.lvimrc'
    let l:vim_parent_file = '../' . l:vim_dir_file
    if filereadable(l:vim_dir_file)
        exe ':source ' . l:vim_dir_file
    endif
    if filereadable(l:vim_parent_file)
        exe ':source ' . l:vim_parent_file
    endif
endfunction

function! AsyncCTags()
    let l:ctags_command = 'ctags -R'
    let l:ctags_job_id = jobstart(l:ctags_command, {'on_exit': function('AsyncCTagsComplete')})
endfunction

function! AsyncCTagsComplete()
    echo 'Tags generated successfully!'
endfunction

function! NumActiveWindows(max)
    let l:buffers = split(execute('ls!'), '\n')
    let l:windows_active = []
    for l:buf in l:buffers
        " We are looking for an 'a' in the first part of the string which
        " indicates that that buffer is active (visible)
        let l:match_pos = match(l:buf, 'a.*"')
        if l:match_pos < 9 && l:match_pos != -1
            call insert(l:windows_active, l:buf)
            if len(l:windows_active) > a:max
                return -1
            endif
        endif
    endfor
    return len(l:windows_active)
endfunction

nnoremap <silent> s. :Inspect<CR>

function! FixTrailingWhitespace()
    let l:save_pos = winsaveview()
    exe '%s:\s\+$::e'
    call winrestview(l:save_pos)
endfunction

command! FixTrailingWhitespace call FixTrailingWhitespace()

" Add to vim unimpaired co mappings
let g:toggle_opts = {}
function! ToggleOption(key, input_command, ...)
    " Plugins are loaded after vimrc, this forces any plugin mapping to be
    " overridden
    execute printf("autocmd VimEnter * nnoremap <silent> co%s :call ExecuteToggleOption('%s', '%s', '%s')<CR>", a:key, a:key, a:input_command, len(a:000) > 0 ? a:000[0] : a:input_command)
endfunction

function! ExecuteToggleOption(key, first_cmd, second_cmd)
    if a:first_cmd != a:second_cmd
        let l:cmd_pos = get(g:toggle_opts, a:key, 0)
        let l:cmd = l:cmd_pos % 2 == 0 ? a:first_cmd : a:second_cmd
        let g:toggle_opts[a:key] = l:cmd_pos + 1
    else
        let l:cmd = a:first_cmd
    endif
    execute l:cmd
endfunction

call ToggleOption('p', 'set paste!')
call ToggleOption('r', 'RainbowParenthesesDeactivate', 'RainbowParenthesesActivate')

nnoremap <silent> coh :noh<CR>

function! CloseBuffer(key, input_command)
    let l:start_of_map = 'cu'
    execute printf('nnoremap <silent> %s%s :%s<CR>', l:start_of_map, a:key, a:input_command)
endfunction

call CloseBuffer('q', 'cclose<bar>lclose')
call CloseBuffer('p', 'pclose')
call CloseBuffer('t', 'bd! *term*')
call CloseBuffer('h', 'helpclose')
call CloseBuffer('u', 'bd')
" Close the window to the right
call CloseBuffer('r', 'winc l <bar> bd')

nnoremap sf :vs <bar> winc w <bar> normal gp<CR>:winc w<CR>

let g:triangle = '▸'

function! Link()
    let l:text = GetVisualSelection()
    let l:result = ''
    echo 'Fetching url for "' . l:text . '"...'

python3 << EOF
import vim
from googlesearch import search

query = vim.eval("l:text")
result = next(search(query))
vim.command("let l:result = '{}'".format(result))
EOF

    let l:replacement_text = printf('[%s](%s)', l:text, l:result)
    let l:line_num = line('.')
    let l:current_line = getline(l:line_num)
    let l:fixed_line = substitute(l:current_line, l:text, l:replacement_text, '')
    call setline(l:line_num, l:fixed_line)
endfunction
command! -range Link :call Link()

" Center search result
function! CenteredFindNext(forward)
    let s:so_curr = &scrolloff
    set scrolloff=999
    try
        if a:forward
            silent normal! n
        else
            silent normal! N
        endif
    finally
        "Restore scrolloff
        let &scrolloff = s:so_curr
    endtry
endfunction

nnoremap <silent>l :call CenteredFindNext(1)<CR>
nnoremap <silent>L :call CenteredFindNext(0)<CR>

function TrimWhitespace()
    let l:current_window_position = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:current_window_position)
endfunction

command! TrimWhitespace call TrimWhitespace()

" }}}
" Searching and Movement {{{

set smartcase
set ignorecase
set showmatch
set gdefault
set infercase

" }}}
" Quick Editing  ------------------------------------------------- {{{

nnoremap <Leader>ev :e ~/.config/nvim/init.vim<CR>
nnoremap <Leader>ez :e ~/dotfiles/zshrc<CR>
nnoremap <Leader>ea :e ~/dotfiles/aliases.zsh<CR>
nnoremap <Leader>ec :e ~/Desktop/Programming/vim/vim_cheatsheet.md<CR>

" }}}
" Folding {{{
set foldenable
set foldlevelstart=0
set foldmethod=marker
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo
" Easier Folding
nnoremap <Leader><Space> za
nnoremap <Leader>z zM
" Jump to top level fold and fold it
nnoremap zz 10[zzc
" Give me back zz functionality
nnoremap z. zz
" Dvorak fold movement
nnoremap zh zj
nnoremap zt zk

function! CreateFold(fold_name)
    let l:fold_line_len = 75
    let l:fold_markers = split(&foldmarker, ',')
    let l:fold_marker_start = l:fold_markers[0]
    let l:fold_marker_end = l:fold_markers[1]
    let l:current_line = line('.')
    let l:current_line_content = getline('.')
    " Number of spaces before the first non whitespace character
    let l:current_line_indent = match(l:current_line_content, '\S')

    if &tabstop != 0
        let l:indent_number = l:current_line_indent / &tabstop
    else
        let l:indent_number = 0
    endif

    let l:comment_string = &commentstring
    let l:last_fold_name = 'End ' . a:fold_name

    " Account for space after comment
    let l:comment_len = len(substitute(l:comment_string, '%s', '', '')) + 1
    let l:name_len = len(a:fold_name)

    " Create First Line
    let l:first_line_repeat = l:fold_line_len - len(a:fold_name) - l:comment_len - 1 - len(l:fold_marker_start) - l:current_line_indent
    let l:first_line_content = ' ' . a:fold_name . ' ' . repeat('-', l:first_line_repeat) . l:fold_marker_start
    let l:first_line = substitute(l:comment_string, '%s', l:first_line_content, '')
    " Add indent spaces
    let l:first_line = repeat(' ', l:current_line_indent) . l:first_line

    " Create Last Line
    let l:last_line_repeat = l:fold_line_len - len(l:last_fold_name) - l:comment_len - 1 - len(l:fold_marker_end) - l:current_line_indent
    let l:last_line_content = ' ' . l:last_fold_name . ' ' . repeat('-', l:last_line_repeat) . l:fold_marker_end
    let l:last_line = substitute(l:comment_string, '%s', l:last_line_content, '')
    " Add indent spaces
    let l:last_line = repeat(' ', l:current_line_indent) . l:last_line

    " Add the fold
    let l:complete_create_fold = [l:first_line, '', '', '', l:last_line]
    call append(l:current_line, l:complete_create_fold)

    " Move to the middle
    exe 'normal! jjj'

    " Tab in to current indent level
    exe 'startinsert'
    for l:x in range(l:indent_number)
        call feedkeys("\<Tab>")
    endfor
    call feedkeys("\<Esc>")

endfunction

function! CreateFoldSection(fold_name)
    set nofoldenable
    " Save selection into the z register
    execute ":'<,'>delete z"
    exe 'normal! k'
    call CreateFold(a:fold_name)
    " Clean up some weirdness here
    exe 'normal! ddk'
    execute 'put z'
    set foldenable
endfunction

command! -nargs=1 CreateFold call CreateFold(<f-args>)
nnoremap <Leader>f :CreateFold<Space>
command! -range -nargs=1 CreateFoldSection call CreateFoldSection(<f-args>)
xnoremap <Leader>f :CreateFoldSection<Space>

" NeatFoldText -------------------------------------------------- {{{

function! NeatFoldText()
    " If this function is slow scrolling will be painfully slow
    let l:line = getline(v:foldstart)
    let l:win_width = winwidth(0)
    let l:lines_count = v:foldend - v:foldstart + 1 - 4
    " Separator character between start and end
    let l:foldchar = '─'

    " Remove comments, foldmarkers and dashes from the foldstart line
    let l:fold_text_removal_array = []
    call extend(l:fold_text_removal_array, split(escape(&commentstring, '*'), '%s'))
    call extend(l:fold_text_removal_array, split(&foldmarker, ','))
    call add(l:fold_text_removal_array, '-')
    for l:x in range(len(l:fold_text_removal_array))
        let l:line = substitute(l:line, l:fold_text_removal_array[l:x], '', 'g')
    endfor

    " Don't let the first character be a space
    let l:foldtextstart = l:line[0] ==# ' ' ? l:line[1:-1] : l:line

    let l:lines_count_text = printf(' %s line%s', l:lines_count > 0 ? l:lines_count : 0, l:lines_count != 1 ? 's' : '')
    let l:foldtextend = l:lines_count_text

    let l:foldtext_start_len = strlen(l:foldtextstart)
    let l:foldtext_end_len = strlen(l:foldtextend)

    " Lines up the end numbers accounting for:
    " 1. A 4 digit line length which makes lines_count_text 12 chars long
    " 2. A Gutter that is 8 characters wide
    let l:line_up_ending = 20
    " Add spaces at the end to make up for foldtextends shorter than 12 chars
    return l:foldtextstart . repeat(l:foldchar, l:win_width - l:foldtext_start_len - l:line_up_ending) . l:foldtextend . repeat(' ', 8)
endfunction

set foldtext=NeatFoldText()

" }}}

" }}}
" Filetype Specific -------------------------------------------------- {{{

" C -------------------------------------------------- {{{

function! TermEscape(str)
    return substitute(a:str, ' ', '\\\\ ', 'g')
endfunction

function! IsQuickWindowOpen()
    for l:i in range(1, winnr('$'))
        let l:bnum = winbufnr(l:i)
        if getbufvar(l:bnum, '&buftype') ==# 'quickfix'
            return 1
        endif
    endfor
    return 0
endfunction

function! MakeC(check_syntax)
    if(a:check_syntax !=# 'false')
        execute ':w | silent YcmDiags'
    else
        :w
    endif
    if IsQuickWindowOpen() > 0
        " Compilation failed, handle appropriately
        echoerr 'Compilation failed! See loc list for errors'
        execute 'sleep 2 | call feedkeys("\<CR>")'
        return
    endif
    let l:filename = expand('%:r')
    execute ':silent ! make f=' . l:filename
endfunction

function! NoWarnMake()
    execute ':silent ! make no_warn f=' . expand('%:r')
endfunction

function! MakeRunC(option)
    if IsQuickWindowOpen() > 0
        return
    endif
    let l:filename = expand('%:r')
    let l:run_command = 'make run f=' . l:filename
    let l:valgrind_command = 'make valgrind f=' . l:filename
    let l:scan_build_command = 'make scan-build f=' . l:filename
    let l:gdb_command = 'make gdb f=' . l:filename
    let l:gdv_command = 'gdv ./' . l:filename
    let l:gdh_command = 'gdh ./' . l:filename
    let l:gds_command = 'gds ./' . l:filename
    let l:lldb_command = 'make lldb f=' . l:filename
    if(a:option ==# 'valgrind')
        let l:run_command = l:valgrind_command
    elseif(a:option ==# 'scan-build')
        let l:run_command = l:scan_build_command
    elseif(a:option ==# 'gdb')
        let l:run_command = l:gdb_command
    elseif(a:option ==# 'gdv')
        let l:run_command = l:gdv_command
    elseif(a:option ==# 'gdh')
        let l:run_command = l:gdh_command
    elseif(a:option ==# 'gds')
        let l:run_command = l:gds_command
    elseif(a:option ==# 'lldb')
        let l:run_command = l:lldb_command
        set norelativenumber
    endif
    if has('nvim') && !(index(['gdv', 'gdh', 'gds'], a:option) >= 0)
        if(a:option ==# 'gdb')
            ' Do Nothing, gdb tui works best with fullscreen
        elseif(a:option ==# 'lldb' && (winwidth(0) > 90))
            execute 'vs'
            execute 'winc r'
        else
            execute ':10sp'
        endif
        if (index(['lldb', 'gdb'], a:option) >= 0)
            execute ':TermSameBuf ' . l:run_command
        else
            execute ':term ' . l:run_command
        endif
    else
        execute ':! ' . l:run_command
    endif
    set norelativenumber
    " Cleanup files when the buffer is deleted
    augroup c_cleanup
        au!
        au! BufDelete <buffer> call MakeClean()
    augroup END
endfunction

function! MakeRunCWithArgs(...)
    if IsQuickWindowOpen() > 0
        return
    endif
    " a:000 is a list of the given args
    let l:args = join(a:000, ' ')
    let l:filename = expand('%:r')
    let l:run_command = './' . l:filename . ' ' . l:args
    echo l:run_command
    if has('nvim')
        execute ':10sp'
        execute ':term ' . l:run_command
    else
        execute ':! ' . l:run_command
    endif
    " Cleanup files when the buffer is deleted
    augroup c_cleanup
        au!
        au! BufDelete <buffer> call MakeClean()
    augroup END
endfunction

function! RunWithInput(input)
    let l:filename = expand('%:r')
    let l:directory = ''
    let l:split_filename = split(l:filename, '/')
    if len(l:split_filename) > 1
        let l:directory = join(l:split_filename[:-2], '/') . '/'
    endif
    let l:input_file = l:directory . a:input
    let l:run_command = './' . l:filename . ' < ' . l:input_file
    if has('nvim')
        execute ':10sp'
        execute ':term ' . l:run_command
    else
        execute ':! ' . l:run_command
    endif
    " Cleanup files when the buffer is deleted
    augroup c_cleanup
        au!
        au! BufDelete <buffer> call MakeClean()
    augroup END
endfunction

function! MakeClean()
    let l:filename = expand('%:r')
    execute ':silent ! make clean f=' . l:filename
endfunction

command! -bar Make :call MakeC("true")
command! -bar ForceMake :call MakeC("false")
command! -bar NoWarnMake :call NoWarnMake()
command! Run :call MakeRunC("normal")
command! RunValgrind :call MakeRunC("valgrind")
command! RunScanBuild :call MakeRunC("scan-build")
command! RunGDB :call MakeRunC("gdb")
command! RunGDV :call MakeRunC("gdv")
command! RunGDH :call MakeRunC("gdh")
command! RunGDS :call MakeRunC("gds")
command! RunLLDB :call MakeRunC("lldb")
command! -nargs=1 RunWithInput :call RunWithInput(<f-args>)
command! -nargs=* RunWithArgs :call MakeRunCWithArgs(<f-args>)
augroup ft_c
    autocmd!
    au BufNewFile,BufRead *.h set filetype=c
    au FileType c setlocal foldmethod=syntax
    au FileType c setlocal commentstring=//\ %s
    au FileType c syn match Function /\w\+(/me=e-1
    au FileType c syn match Emphasize /\w\+\*/
    au FileType c syn match Emphasize /\*\w\+/
    au FileType c syn match Emphasize /==/
    au FileType c syn match Type /\w\+_t\s/
    au FileType c setlocal makeprg=make\ f=%:r
    au FileType c nnoremap <buffer> cp :Make<bar>Run<CR><CR>
    au FileType c nnoremap <buffer> cv :Make<bar>RunValgrind<CR><CR>
    au FileType c nnoremap <buffer> cd :Make<bar>RunLLDB<CR><CR>
    au FileType c nnoremap <buffer> cg :Make<bar>RunGDB<CR><CR>
    au FileType c nnoremap <buffer> ch :Make<bar>RunGDH<CR><CR>
    au FileType c nnoremap <buffer> cm :Make<bar>RunGDS<CR><CR>
    au FileType c nnoremap <buffer> co :ForceMake<bar>Run<CR><CR>
    au FileType c nnoremap <buffer> ca :Make<bar>RunWithArgs<Space>
    au FileType c nnoremap <buffer> ci :Make<bar>RunWithInput<Space>
augroup END

" }}}
" C++ -------------------------------------------------- {{{

augroup ft_cpp
    au!
    au FileType cpp syn match Special /*\s\|+\s\|-\s\|\/\s\|%\s/
    au FileType cpp syn match Operator /=/
    au FileType cpp syn match Exception />\|</
    au FileType cpp syn match Emphasize /==/
    " Make pointers and references stand out
    au FileType cpp syn match Emphasize /\*/
    au FileType cpp syn match Emphasize /&/
    au FileType cpp syn match Identifier /\w\+::/me=e-2
    au FileType cpp setlocal commentstring=/*%s*/
augroup END

function! CppMan()
    exe 'Sman std::' . expand('<cword>')
    exe 'res 10'
endfunction

command! -nargs=+ Cppman silent! call CppMan(<f-args>)

augroup ft_cpp
    autocmd!
    au FileType cpp setlocal makeprg=make\ f=%:r
    au FileType cpp nnoremap <silent><buffer> M :call CppMan()<CR>
    au FileType cpp nnoremap <buffer> cp :Make<bar>Run<CR><CR>
    au FileType cpp nnoremap <buffer> co :NoWarnMake<bar>Run<CR><CR>
    au FileType cpp nnoremap <buffer> ca :Make<bar>RunWithArgs<Space>
    au FileType cpp nnoremap <buffer> ci :Make<bar>RunWithInput<Space>
    au FileType cpp nnoremap <buffer> cg :Make<bar>RunGDB<CR><CR>
    au FileType cpp nnoremap <buffer> cd :Make<bar>RunLLDB<CR><CR>
augroup END

" }}}
" CSS -------------------------------------------------- {{{

augroup ft_css
    au FileType css hi link cssVendor StorageClass
    au FileType css setlocal iskeyword+=\-
augroup END

" }}}
" Git -------------------------------------------------- {{{

function! SpeakCommit()
    " Mark the current position
    exe 'normal! mp'
    let l:commit_text_end = search('\n# ') - 1
    let l:text = join(getline(1, l:commit_text_end), ' ')
    call SpeakText(l:text)
    exe "normal 'p"
endfunction

augroup ft_git
    au!
    au FileType gitcommit setlocal spell
    au FileType gitcommit nnoremap <silent> st :call SpeakCommit()<CR>
augroup END

" }}}
" Go --------------------------------------------------------------------{{{

function! GoRun()
    let l:filename = expand('%')
    execute ':TermStayOpen go run ' . l:filename
endfunction


let g:go_fmt_command = ''
let g:go_auto_type_info = 1
let g:go_info_mode = 'guru'

augroup ft_go
    au FileType go set shiftwidth=2 tabstop=2 softtabstop=2
    au FileType go let g:airline#extensions#whitespace#enabled=0
    au FileType go execute("imap <C-T> := ")
    au FileType go nnoremap gr :call GoRun()<CR>
    au FileType go nnoremap gi :GoImport<Space>
augroup END


" End Go ----------------------------------------------------------------}}}
" Html -------------------------------------------------- {{{

" Let html comments have fold markers and whatever else
let g:html_wrong_comments = 1
augroup ft_html
    au!

    au BufNewFile,BufRead *.html setlocal filetype=html
    au FileType xhtml setlocal filetype=html

    " Django tags
    au FileType htmldjango inoremap <buffer> <C-T> {%<Space><Space>%}<Left><Left><Left>

    " Django variables
    au FileType htmldjango inoremap <buffer> <C-V> {{<Space><Space>}}<Left><Left><Left>

    " Two space indenting for max screen real estate usage
    au FileType htmldjango,html setlocal ts=2 sw=2 expandtab

    " Set comments
    au FileType htmldjango setlocal commentstring={#\ %s\ #}
    au FileType html,css nnoremap <Leader>r :silent call ReloadChrome()<CR>
augroup END

function! ReloadChrome()
    exe ':w'
    silent execute ':! chrome_reload'
endfunction

" }}}
" Java -------------------------------------------------- {{{

function! CompileJava(input_type)
    let l:filename = expand('%:r')
    let l:dot_filename = substitute(l:filename, '/', '.', 'g')
    let l:compilecommand = 'javac -cp '.'' . l:filename . '.java'
    let l:runcommand = 'java -cp '.' ' . l:filename
    let l:runcommand_escaped = TermEscape(l:runcommand)
    " Syntastic has to compile the file to run the checker
    " :w|SyntasticCheck
    :w

    " If the quickfix window is open there are errors so don't
    " run anything.
    for l:i in range(1, winnr('$'))
        let l:bnum = winbufnr(l:i)
        if getbufvar(l:bnum, '&buftype') ==# 'quickfix'
            return
        endif
    endfor

    if has('nvim')
        execute ':10sp term://' . l:runcommand_escaped
        :winc r
        if(a:input_type ==# 'normal')
            exec("startinsert")
        endif
    else
        execute ':! java ' . l:filename
    endif
endfunction

augroup ft_java
    au!
    " au Filetype java nnoremap <buffer> cp :call CompileJava("normal")<CR>
    " au Filetype java nnoremap <buffer> cn :call CompileJava("input")<CR>
    " au Filetype java nnoremap <buffer> <Leader>w :w<bar>SyntasticCheck<CR>
augroup END

" }}}
" JavaScript -------------------------------------------------- {{{

augroup ft_javascript
    au!
    " Add indent settings for jsx
    au FileType javascript setlocal nosmartindent
    " docuMentation
    " au FileType javascript nnoremap <buffer> gm :JsDoc<CR>
    " Have tern and Ycm play nicely together
    " au FileType javascript setlocal omnifunc=tern#Complete
augroup END

" }}}
" Markdown -------------------------------------------------- {{{

function! CompileMDPDF()
    execute ':! md2pdf ' . expand('%:r')
endfunction

function! CompileMDHtml()
    let l:filename_with_extension = expand('%')
    let l:filename = expand('%:r')
    " Create the comp for include files
    silent execute ':w'
    silent execute ':! cp ' . l:filename . '.md ' . l:filename . '.mdpp'
    silent execute ':! markdown-pp ' . l:filename . '.mdpp ' . l:filename . '_comp.md'
    silent execute ':! md2html ' . l:filename . '_comp.md > ' . l:filename . '.html'
    silent execute ':! rm ' . l:filename . '_comp.md'
endfunction

function! CompileHtmlAndOpen()
    silent call CompileMDHtml()
    silent execute ':! open ' . expand('%:r') . '.html'
endfunction

function! CompileHtmlAndReload()
    silent call CompileMDHtml()
    silent execute ':! chrome_reload'
endfunction

function! CreateIncludeFile()
    ' !INCLUDE 'File Path'
    let l:line = getline('.')
    if(match(l:line, '!INCLUDE') < 0)
        echo('Error: Not an includes line!')
        return
    endif
    let l:filename = matchstr(l:line, '".*"')[1:-2]
    call MakeDirsForNewFile(l:filename)

    if winwidth(0) > 90
        exe 'vs'
    else
        exe '10sp'
    endif
    execute ':e ' . l:filename
    return
endfunction

function! MakeDirsForNewFile(filename)
    try
        let l:dir = join(split(a:filename, '/')[0:-2], '/')
        call mkdir(l:dir, 'p')
    endtry
endfunction

augroup ft_md
    autocmd!
    " Forcing vim to read .md as markdown and not as 'modula2' or whatever
    au BufNewFile,BufReadPost *.md set filetype=markdown
    " Folding for markdown
    au Filetype markdown set foldcolumn=4
    au Filetype markdown set breakat-=\*
    au Filetype markdown set textwidth=1000
    au Filetype markdown nnoremap <buffer> cp :call CompileMDPDF()<CR>
    au Filetype markdown nnoremap <buffer> ch :silent call CompileHtmlAndOpen()<CR>
    au Filetype markdown nnoremap <buffer> cr :silent call CompileHtmlAndReload()<CR>
    au Filetype markdown nnoremap <buffer> gi :call CreateIncludeFile()<CR>
    au Filetype markdown nnoremap <buffer> mh :call CompileMDHtml()<CR>
    " Concise way to kill all indenting
    au FileType markdown setl noai nocin nosi inde=
    " Autosave markdown files when you leave insert mode - Not sure if this is a good idea yet...
    au FileType markdown au InsertLeave <buffer> silent write
augroup END

let g:markdown_fenced_languages = ['python', 'bash=sh', 'c', 'html', 'css', 'javascript', 'java', 'xml', 'cpp', 'vim', 'typescript']

" }}}
" Python -------------------------------------------------- {{{

let g:python_highlight_all = 1

function! RunPython(input_type)
    :w
    let l:filename = expand('%:p')
    let l:command = 'python3 ' . l:filename
    let l:command_escaped = 'python3\\ ' . l:filename
    let l:root_directory = FindRootDirectory()
    execute ':cd %:p:h'
    if has('nvim')
        execute ':15sp term://' . l:command
        :winc r
        if(a:input_type ==# 'normal')
            exe('startinsert')
        endif
    else
        execute ':! ' . l:command
    endif
    execute ":cd " . l:root_directory
endfunction

augroup ft_python
    autocmd!
    au BufNewFile,BufRead *.py set keywordprg=pydoc
    au FileType python nnoremap <buffer> cp :call RunPython("normal")<CR>
    " au FileType python nnoremap <buffer> cn :call RunPython("input")<CR>
augroup END

" }}}
" Quarto ----------------------------------------------------------------{{{

function! PreviewQuarto()
    :w
    let l:filename = expand('%:p')
    let l:filename = expand('%')
    let l:command = 'quarto preview ' . l:filename
    call StartHTermAutoExit(l:command, v:true)
    :winc p
endfunction

" Do not dynamically set quarto comments
" Note: this is probably a bug where the rmd plugin does not recognize a
" python code block, so it does not set the comment string properly
" https://github.com/neovim/neovim/blob/2e2101cf7b0e4a70f5670d9d1317860a47bb8385/runtime/ftplugin/rmd.vim#L43-L51
let g:rmd_dynamic_comments = 0

function! ToggleQuartoFormatPrg()
    let l:current_formatprg = &formatprg

    if(match(l:current_formatprg, "py") > -1)
        :setlocal formatprg=fmt\ -w\ 100
    else
        :setlocal formatprg=python3\ -m\ macchiato
    endif
    let l:current_formatprg = &formatprg
    echom "Formatter set to: ".l:current_formatprg
endfunction

augroup myNvimQuarto
    autocmd!
    au BufRead,BufNewFile *.qmd set ft=quarto
    au FileType quarto set textwidth=100
    au FileType quarto nnoremap <buffer> cp :call PreviewQuarto()<CR>
    au FileType quarto setlocal formatprg=python3\ -m\ macchiato
    au FileType quarto setlocal commentstring=#\ %s
    " Same as the runtime but removes the . for easier code editing
    au FileType quarto setlocal iskeyword=@,48-57,_
    au FileType quarto nnoremap <buffer> cof :call ToggleQuartoFormatPrg()<CR>
augroup END

" End Quarto ------------------------------------------------------------}}}
" R ---------------------------------------------------------------------{{{

" function! BuildRMarkdownPDF()
"     execute("w")
"     call RMakeRmd("pdf_document")
"     call RMakeRmd("html_document")
" endfunction

" augroup ft_R
"     autocmd!
"     au FileType R,rmd nnoremap <buffer> cp :call BuildRMarkdownPDF()<CR>
"     " au BufWritePost *.rmd call BuildRMarkdownPDF()<CR>
"     au BufRead,BufNewFile *.rmd setlocal textwidth=80
" augroup END

function! s:customNvimRMappings()
   nmap <buffer> cp <Plug>RMakePDF
   imap <buffer> cp <Plug>RMakePDF
   vmap <buffer> cp <Plug>RMakePDF
endfunction
augroup myNvimR
   au!
   autocmd filetype rmd call s:customNvimRMappings()
augroup END

" End R -----------------------------------------------------------------}}}
" Ruby -------------------------------------------------- {{{

" 2 space tabs in ruby
augroup ft_ruby
    autocmd!
    autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
    autocmd Filetype eruby setlocal ts=3 sw=2 expandtab
augroup END

" }}}
" Swift -------------------------------------------------- {{{

function! RunSwift()
    execute ':w'
    if IsQuickWindowOpen()
        return
    endif
    let l:fname = expand('%')
    let l:command = 'swift ' . l:fname
    if has('nvim')
        execute ':10sp'
        execute ':winc r'
        execute ':term ' . l:command
    else
        execute ':! ' . l:command
    endif
endfunction

command! RunSwift :call RunSwift()

augroup ft_swift
    autocmd!
    au FileType swift syn match Function /\w\+(/me=e-1
    au FileType swift nnoremap <buffer> cp :RunSwift<CR><CR>

augroup END


" }}}
" TeX -------------------------------------------------- {{{

augroup ft_tex
    autocmd!
    au FileType tex set tabstop=2 shiftwidth=2 softtabstop=2
    " au FileType tex set textwidth=72
    au FileType tex set textwidth=5000
augroup END

" }}}
" Typescript --------------------------------------------------------------- {{{

augroup ft_ts
    au!
    au FileType typescript setlocal makeprg=tsc
    au FileType typescript nnoremap <buffer> sj :call ToggleTSComments()<CR>
    au FileType typescript nnoremap <buffer> cp :Term gulp<CR>
    au FileType typescript syn match Emphasize /!/
augroup END

" Allow toggling between jsx comments and typescript comments
function! ToggleTSComments()
    if &commentstring ==? '// %s'
        setlocal commentstring={/*\ %s\ */}
    elseif &commentstring ==? '{/*\ %s\ */}'
        setlocal commentstring=//\ %s
    endif
endfunction

" Run gulp command in the background while vim is running
let g:gulp_async_id = 0
function! StartAsyncGulp(cmd)
    if g:gulp_async_id == 0
        let g:gulp_async_id = jobstart(a:cmd)
        echo 'Starting Async cmd: ' . a:cmd
    endif
endfunction

function! StopAsyncGulp()
    if g:gulp_async_id > 0
        call jobstop(g:gulp_async_id)
    endif
endfunction

" autocmd! VimLeave call StopAsyncGulp()


" End Typescript ----------------------------------------------------------- }}}

" }}}
" Plugin Settings -------------------------------------------------- {{{

" A.vim-------------------------------------------------- {{{

nnoremap gh :A<CR>

" }}}
" auto pairs -------------------------------------------------- {{{

let g:AutoPairsCenterLine = 0
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', "`":"`", '```':'```', '"""':'"""', "'''":"'''", '$': '$', '$$': '$$'}

" }}}
" CmdlineComplete ---------------------------------------------------------- {{{

cmap <C-N> <Plug>CmdlineCompleteForward
cmap <C-S> <Plug>CmdlineCompleteBackward

" End CmdlineComplete ------------------------------------------------------ }}}
" COC.nvim --------------------------------------------------------------{{{

set hidden
set nobackup
set nowritebackup
set cmdheight=1
set updatetime=300
set shortmess+=c

let g:coc_enable_locationlist = 1

function! CheckBackSpace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
\ coc#pum#visible() ? coc#_select_confirm() :
\ coc#expandableOrJumpable() ?
\ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
\ CheckBackSpace() ? "\<TAB>" :
\ coc#refresh()

let g:coc_snippet_next = '<tab>'

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use K to show documentation in preview window
nnoremap <silent> M :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

" End COC.nvim ----------------------------------------------------------}}}
" Fugitive --------------------------------------------------" {{{

" Fugitive custom mappings
function! ToggleGStatus()
    if buflisted(bufname('.git/index'))
        bd .git/index
    else
        exe 'Gstatus | winc H | vertical resize 78'
    endif
endfunction
command! ToggleGStatus :call ToggleGStatus()
nnoremap <Leader>g :ToggleGStatus<CR>
nnoremap gs :ToggleGStatus<CR>

function! RunOrUpdateGDiff()
    " Clear the cmd line
    echo ''
    " Close any fugitive windows, Gdiff will not update a diff window
    exe 'silent! bd *fugitive*'
    exe 'Gdiff'
    " Go to the last window (A hack due to `exe winc p` not working correctly)
    call feedkeys('ss')
    exe 'normal! z.'
endfunction
" Show/Kill diff
nnoremap sd :call RunOrUpdateGDiff()<CR>
nnoremap kd :bd fugitive*<CR>zAz.

function! SternlyWarnIfThereAreLotsOfChanges()
    if &filetype ==# 'gcommit'
        return
    endif
    let l:max_inserts = 100
    let l:max_deletions = 100
    let l:max_files_changed = 5
    let l:temp_file = 'git_diff_stats.txt'

    " Get the stats from git, relevant line is the last line
    try
        let l:diff_stats = systemlist('git diff --stat')[-1]

        let l:diff_stats = split(l:diff_stats, ' ')
        let l:files_changed = str2nr(split(l:diff_stats[0], ' ')[0])
        let l:insertions = str2nr(split(l:diff_stats[3], ' ')[0])
        let l:deletions = str2nr(split(l:diff_stats[5], ' ')[0])

        if (l:files_changed > l:max_files_changed) || (l:insertions > l:max_inserts) || (l:deletions > l:max_deletions)
            let l:message = printf('Large Commit Warning: %s', join(l:diff_stats, ' '))
            " Dismiss the file written message
            redraw
            echohl WarningMsg | echo l:message | echohl None
        endif
    catch
        return
    endtry
endfunction

augroup commit_warning
    au!
    au BufWritePost * call SternlyWarnIfThereAreLotsOfChanges()
augroup END

function! GoToNextGitFile()
    if buflisted(bufname('.git/index'))
        execute 'winc P'
        call feedkeys("\<C-n>\<CR>")
    else
        exe 'normal! gn'
    endif
endfunction

nnoremap <silent> gn :call GoToNextGitFile()<CR>

nnoremap cd :Gcommit --amend --verbose<CR>
nnoremap cm :Gcommit --verbose<CR>
nnoremap cf :Gwrite<CR>

" Status Update
nnoremap <silent> su :Gstatus<CR>

augroup plug_fugitive
    au!
    au FileType gitcommit setlocal nolist nofoldenable
    au FileType gitcommit let g:airline#extensions#whitespace#enabled = 0
    au BufWinEnter .git/index call feedkeys("\<C-n>")
augroup END

" }}}
" FZF -------------------------------------------------- {{{

let g:fzf_action = {
    \ 'ctrl-s': 'vsplit',
\}


au TermOpen term://*fzf* tmap <buffer> <C-t> <Up>
au TermOpen term://*fzf* tmap <buffer> <Esc> <Esc>

nnoremap <silent> gu :Buffers<CR>
nnoremap <silent> gw :Windows<CR>

function! GoToWindowOrOpenFile(args)
    let l:fzf_action = a:args[0]
    let l:filename = a:args[1]

    " Avoid any weirdness from trying to edit files from a preview window
    let l:started_in_preview_window = &previewwindow == 1

    if (match(l:filename, expand('%')) != -1) || (match(expand('%'), l:filename) != -1)
        return
    endif

    let l:useful_open_windows = eval(join(map(range(1, tabpagenr()), 'tabpagebuflist(v:val)'), '+'))
    let l:filenames_open_in_windows = map(copy(l:useful_open_windows), 'bufname(v:val)')

    let l:file_window = match(l:filenames_open_in_windows, l:filename)

    if l:file_window != -1
        " Oddly enough win_getid uses the actual window position listed from
        " left to right starting at 1 and not the window numbers from
        " useful_open_windows
        let l:win_num = l:file_window + 1
        let l:win_id = win_getid(l:win_num)
        call win_gotoid(l:win_id)
    else
        if l:started_in_preview_window
            execute 'vsplit ' . l:filename
        else
            execute get(g:fzf_action, l:fzf_action, 'e') . ' ' . l:filename
        endif
    endif
endfunction

"
function! SmartFiles()
    let l:expect = ' --expect=' . join(keys(g:fzf_action), ',')
    let l:prompt = ' --prompt="File> "'
    let l:fzf_dict = {'sink*': function('GoToWindowOrOpenFile'), 'options': l:expect . l:prompt}

    " If we are in a git project use git. systemlist chomps the system output
    if systemlist('git rev-parse --git-dir')[0] ==# '.git'
        " Include git files and git untracked files
        let l:fzf_dict.source = 'git ls-files -co --exclude-standard'
    else
        let l:fzf_dict.source = 'ag --hidden -g ""'
    endif

    call fzf#run(fzf#wrap(l:fzf_dict))
endfunction

nnoremap <silent> go :call mru#MRUFiles()<CR>

let g:fzf_buffers_jump = 1

" nnoremap gt <C-]>

" fzf.vim Ag search
nnoremap g/ :Ag<CR>

command! H :Helptags
nnoremap g- :Helptags<CR>

augroup plug_fzf
    au!
    au VimEnter * nnoremap g* :Ag <C-r><C-w><CR>
augroup END

" }}}
" GV (Git Log Viewer) -------------------------------------------------- {{{

nnoremap <silent> gl :GV<CR>
" Display patches properly
augroup plug_gv
    autocmd!
    autocmd FileType git setlocal nofoldenable nolist
augroup END

" End GV (Git Log Viewer) ---------------------------------------------- }}}
" Matchit -------------------------------------------------- {{{

runtime macros/matchit.vim

" }}}
" Nerdtree -------------------------------------------------- {{{

nnoremap <C-b> :NERDTreeToggle<CR>

augroup nerdtree_fix
    autocmd!
    autocmd filetype nerdtree call Mod_NerdTree_Maps()
augroup END

function! Mod_NerdTree_Maps()
    nnoremap <buffer> h gj
    nnoremap <buffer> t gk
endfunction

" }}}
" Nvim-R ----------------------------------------------------------------{{{

" let R_assign = 0

" End Nvim-R ------------------------------------------------------------}}}
" nvim treesitter -------------------------------------------------------{{{

lua <<EOF
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
EOF

" End nvim treesitter ---------------------------------------------------}}}
" pomo ------------------------------------------------------------------{{{

nnoremap <silent> <Leader>p :call pomo#ShowMenu()<CR>

" End pomo --------------------------------------------------------------}}}
" Rainbow Parens ----------------------------------------------------------- {{{

let g:rainbow#max_level = 16

" End Rainbow Parens ------------------------------------------------------- }}}
" Tabularize ------------------------------------------------ {{{

nnoremap <Leader>ap :Tabularize /\|<CR> | " Align Pipe
nnoremap <Leader>at :Tabularize /\|<CR> | " Align Table
nnoremap <Leader>aa :Tabularize /       | " Align Choice
nnoremap <Leader>av :Tab /\|\ "<CR>     | " Align Vim inline comment
xmap <Leader>ap :Tabularize /\|<CR>     | " Align Pipe
xmap <Leader>at :Tabularize /\|<CR>     | " Align Table
xmap <Leader>aa :Tabularize /           | " Align Choice
xmap <Leader>av :Tab /\|\ "<CR>         | " Align Vim inline comment
xmap <Leader>ae :Tab /=<CR>             | " Align equals

" }}}
" vim airline -------------------------------------------------- {{{

let g:airline_powerline_fonts=1
let g:airline_skip_empty_sections = 1
let g:airline_theme='relative'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#branch#notexists = ' (Untracked)'
let g:airline#extensions#branch#displayed_head_limit=35
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#branch#format = 0
let g:airline#extensions#tabline#show_tabs = 0


augroup vim_airline
    au!
    " Remove '[No Name]' buffers
    " autocmd BufEnter * call airline#extensions#tabline#buflist#invalidate()
augroup END

function! AirlineFilename()
    return '/' . TruncateFilename(24)
endfunction
let g:airline_section_c='%{AirlineFilename()}'

function! AirlineNull()
    return ''
endfunction
let g:airline_section_y='%{AirlineNull()}'

function! SimpleFileProgress()
    return printf('%s/%s', str2nr(line('.')), str2nr(line('$')))
endfunction

let g:airline_section_z='%{SimpleFileProgress()}'

" }}}
" vim abolish -------------------------------------------------- {{{

" Abolish abbreviations are in ~/.nvim/after/plugins/abolish.vim

" }}}
" vim ale ---------------------------------------------------------------{{{

let g:ale_disable_lsp = 1
let g:ale_use_neovim_diagnostics_api = 1

" End vim ale -----------------------------------------------------------}}}
" vim commentary ----------------------------------------------------------- {{{

nmap gcp gccyypgcc
nmap gcu gccyytpgcc

" End vim commentary ------------------------------------------------------- }}}
" vim dasht ------------------------------------------------------------ {{{

au TermOpen term://*dasht* tmap <buffer> h <Down>
au TermOpen term://*dasht* tmap <buffer> t <Up>

let g:dasht_filetype_docsets = {
    \ 'cpp': ['^c$', 'qt']
\ }

" End vim-dasht -------------------------------------------------------- }}}
" vim easymotion ----------------------------------------------------------- {{{

" Disable easy motion mappings
let g:EasyMotion_do_mapping = 0
map H <Plug>(easymotion-bd-jk)
map T <Plug>(easymotion-jumptoanywhere)
let g:EasyMotion_keys = 'HUTENOPGCRYFLBKJWQVZXIDSA'
let g:EasyMotion_use_upper = 1

" End vim easymotion ------------------------------------------------------- }}}
" vim easy align ------------------------------------------------------- {{{

nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
xmap gA :EasyAlign<Space>

" End vim easy align --------------------------------------------------- }}}
" vim expand region -------------------------------------------------- {{{

xmap v <Plug>(expand_region_expand)
xmap <C-v> <Plug>(expand_region_shrink)

" }}}
" vim gitgutter -------------------------------------------------- {{{

function! JumpToHunkAndUnfold(keypress)
    if(a:keypress ==# 'n')
        :GitGutterNextHunk
    endif

    if(a:keypress ==# 'p')
        :GitGutterPrevHunk
    endif
    " Unfold just where the cursor is (supposed to be)
    normal! zv
    " Move cursor to the middle of the screen
    normal! z.
    call repeat#set('c' . a:keypress)
endfunction

nnoremap <silent> sh :GitGutterStageHunk<CR>
nnoremap <silent> cn :call JumpToHunkAndUnfold('n')<CR>
" nnoremap <silent> cp :call JumpToHunkAndUnfold('p')<CR>

let g:gitgutter_set_sign_backgrounds = 1
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = 'x'
let g:gitgutter_sign_modified_removed = '~ˣ'

let g:gitgutter_max_signs = 5000
let g:gitgutter_map_keys = 0

" }}}
" vim go -------------------------------------------------- {{{

let g:go_disable_autoinstall = 1

" }}}
" vim journal -------------------------------------------------- {{{

let g:journal_directory='~/.journal'
let g:journal_extension='md'

" }}}
" vim js doc -------------------------------------------------- {{{

" See javascript FileType commands

" }}}
" vim jsx ------------------------------------------------------------- {{{

let g:jsx_ext_required = 0

" End vim jsx --------------------------------------------------------- }}}
" vim license -----------------------------------------------------------{{{

let g:licenses_copyright_holders_name = 'Andrew Simms'
let g:licenses_authors_name = 'Andrew Simms <simms.andrew@gmail.com>'

" End vim license -------------------------------------------------------}}}
" vim markdown folding ----------------------------------------------- {{{

let g:markdown_fold_style = 'nested'
let g:markdown_fold_override_foldtext = 0

" }}}
" vim pandoc ------------------------------------------------------------{{{

let g:pandoc#modules#enabled  = ["folding"]

" End vim pandoc --------------------------------------------------------}}}
" vim pandoc syntax -----------------------------------------------------{{{

let g:pandoc#syntax#conceal#use = 0

" End vim pandoc syntax -------------------------------------------------}}}
" vim rooter --------------------------------------------------------------- {{{

let g:rooter_silent_chdir = 1
" Disable rooter for projects without version control
let g:rooter_change_directory_for_non_project_files = 'current'

" End vim rooter ----------------------------------------------------------- }}}
" vim-sneak -------------------------------------------------- {{{

let g:sneak#label = 0

noremap <silent> <C-E> :normal! e<CR>
nmap e <Plug>Sneak_s
nmap E <Plug>Sneak_S
xmap e <Plug>Sneak_s
xmap E <Plug>Sneak_S
omap e <Plug>Sneak_s
omap E <Plug>Sneak_S

nmap - <Plug>SneakNext
nmap _ <Plug>SneakPrevious
xmap - <Plug>SneakNext
xmap _ <Plug>SneakPrevious
omap - <Plug>SneakNext
omap _ <Plug>SneakPrevious

nmap u <Plug>Sneak_f
nmap U <Plug>Sneak_F
xmap u <Plug>Sneak_f
xmap U <Plug>Sneak_F
omap u <Plug>Sneak_f
omap U <Plug>Sneak_F

nmap j <Plug>Sneak_t
nmap J <Plug>Sneak_T
xmap j <Plug>Sneak_t
xmap J <Plug>Sneak_T
omap j <Plug>Sneak_t
omap J <Plug>Sneak_T

" }}}
" vim test --------------------------------------------------------------{{{

let g:test#strategy = 'neovim'
let g:test#typescript#jest#file_pattern = '\v(tests/.*|(spec|test))\.(js|jsx|ts|tsx;)$'

" End vim test ----------------------------------------------------------}}}
" vimtex ----------------------------------------------------------------{{{

let g:vimtex_view_method = 'skim'
let g:vimtex_view_sync_skim = 1

let g:vimtex_quickfix_ignore_filters = [
\  'arrayparboxrestore',
\  'tocloft',
\  'perthousand',
\  'micro',
\  'Underfull',
\  "<namepart>inits",
\]
" \  "Conflicting options. '<namepart>inits' conflicts with 'uniquename=minfull'",

" End vimtex ------------------------------------------------------------}}}

" }}}
" Directory Specific Commands {{{

call SourceDirectory()

" }}}
" Fold Settings -------------------------------------------------- {{{
" vim:foldmethod=marker
" }}}
