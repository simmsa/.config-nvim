" .vimrc
" Author: Andrew Simms <andrew@andrewdsimms.com>
" Preamble --------------------------------------- {{{

filetype off
execute pathogen#infect()
set nocompatible
filetype plugin indent on

" }}}
" Basic Options {{{

set encoding=utf-8
set modelines=0
set textwidth=0
set wrap
set autoindent
set hidden
"Turn on status line
set laststatus=2
"Allow backspacing over everything in insert mode
set backspace=indent,eol,start
"Store lots of :cmdline history
set history=1000
"Show incomplete cmds down the bottom
set showcmd
"Show current mode down the bottom
set showmode
"Show line numbers
set number
"Display tabs and trailing spaces
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅,extends:,precedes:
set linebreak
" Configuring backup and related
set backup
set noswapfile
set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
" Make directory folders
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif
"Autocomplete matches
set wildmenu
"Faster Macros
set lazyredraw
"Break Indent 'Woo!'
set breakindent
" let &showbreak='  ▶'
set breakindentopt=shift:4,sbr
" Turn off parentheses matching, its driving me crazy
let loaded_matchparen = 1
" Toggle from relative numbering to regular numbering in normal/insert
set rnu
autocmd InsertEnter * set nornu
autocmd InsertLeave * set rnu
" Fixing Delays?
set ttimeoutlen=10
set timeoutlen=300
" Better tab completion?
set wildmode=longest,list,full
set wildmenu
" Ignore directories
set wildignore+=*/.git/*,*/bundle/*,*/.sass-cache/*,*/lib/*,*/migrations/*
" Ignore files
set wildignore+=*.pyc,*.jpg,*.png,*.log,*.o,*.so,*.gif
" Spell check dictionary
set dictionary=/usr/share/dict/words
" Use zsh
set shell=/usr/local/bin/zsh
" Make test-name and test_name auto completable
set iskeyword+=\-,\_

" Color scheme -------------------------------------------------- {{{

syntax on
colorscheme pychimp
" Highlight current line
set cursorline

" }}}
" Tabs and Spaces -------------------------------------------------- {{{

"Use spaces instead of tabs
set expandtab
"Be smart when using tabs
set smarttab
"1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

" }}}

" }}}
" Abbreviations {{{
" }}}
" Dvorak -------------------------------------------------- {{{

noremap h gj
noremap t gk
noremap d <Left>
noremap n <Right>

" j is now jump, swapping with t
noremap j t
" k is now kill swapping with d
noremap k d
" l is now look up next swapping with n
noremap l n
nnoremap K dd
"easier navigation of finds
nmap - :

" }}}
" Convience Mappings ------------------------------------------------- {{{

"<Ctrl-l> redraws the screen and removes any search highlighting
nnoremap <silent> <C-l> :nohl<CR><C-l>
" Set insert mode timeout, returns to normal mode after 15 seconds
au CursorHoldI * stopinsert
au InsertEnter * let updaterestore=&updatetime | set updatetime=15000
au InsertLeave * let &updatetime=updaterestore
"Remap command mode
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
"Wrapping and unwrapping lines
command! -nargs=* Wrap set wrap linebreak nolist
command! -nargs=* Nowrap set wrap linebreak list
"Changing number incrementing
nnoremap <C-j> <C-a>
nnoremap <C-k> <C-x>
"Split file vertically <leader>vs
noremap <silent> <Leader>vs :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>
"Quicker Commands
nnoremap ; :
vmap ; :
nnoremap : ;
" Insert multiple lines (o stays in normal mode and works with a count)
nnoremap o o<Esc>S
nnoremap O @='O<C-V><Esc>'<CR>S
" Quicker Movement
nnoremap D ^
nnoremap N g_
nnoremap H %
nnoremap T {
vnoremap D ^
vnoremap N g_
vnoremap H %
vnoremap T {
" Easier tabbing of selections
vnoremap < <gv
vnoremap > >gv
" Easier system copy and paste
vmap <Leader>sy "+y
nnoremap <Leader>sp "+p
" Faster repeat command
nnoremap <C-P> :<C-P><CR>
"Quickfix mappings
autocmd BufReadPost quickfix nnoremap <buffer> <C-N> <Down>
autocmd BufReadPost quickfix nnoremap <buffer> <C-T> <Up>
" Get to the shell faster
nnoremap s :!<Space>

" Leader Mappings -------------------------------------------------- {{{

" Map leader key to space
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"
" <Space> w to save a file
nnoremap <Leader>w :w<CR>
" <Space> t to switch tabs
nnoremap <Leader>t gt
"<Space> s to source VIMRC
nnoremap <Leader>s :so ~/.vimrc<CR>
" Easier uppercase
nnoremap <Leader>u mzgUiW`za
imap <C-u> <ESC>mzgUiW`za

"Easy buffer switching
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>p :bp<CR>
nnoremap <Leader>d :bd<CR>
" Substitute like * (\< and \> select only that word)
nnoremap <Leader>; :%s:\<<C-R><C-W>\>:

" }}}
" Emacs Insert Mode -------------------------------------------------- {{{

imap <C-e> <End>
" Go forward in insert mode
imap <C-f> <Right>
" Go back in insert mode
imap <C-b> <Left>

" }}}

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

" Change cursor shape for different modes
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" }}}
" Searching and Movement {{{

"Find the next match as we type the search
set incsearch
"Highlight searches by default
set hlsearch
set smartcase
set ignorecase
set showmatch
set gdefault
set infercase

" }}}
" Quick Editing  ------------------------------------------------- {{{

nnoremap <Leader>ev :e ~/.vim/vimrc<CR>
nnoremap <Leader>ez :e ~/.zshrc<CR>
nnoremap <Leader>ec :e ~/Desktop/Programming/vim/vim_cheatsheet.md<CR>

" }}}
" Folding {{{
set foldenable
set foldlevelstart=0
set foldmethod=marker
" Easier Folding
nnoremap <Leader><Space> za
nnoremap <Leader>z zM
" Jump to top level fold and fold it
nnoremap zz 10[zzc
" Give me back zz functionality
nnoremap z. zz

nmap <Leader>f o<Esc>50i-<Esc>A<Space>{{{<CR>}}}<Esc>gcc2t0gcchkktf<Space>i<Space><Esc>ni
" NeatFoldText -------------------------------------------------- {{{

function! NeatFoldText()
  let line = ' ' . substitute(getline(v:foldstart), '^\s#*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let commentless_line = substitute(line, '//\|#\|/\*\|\*/\|"\|-', '', 'g')
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = ' ' . printf("%s", lines_count . ' lines') . ' '
  " let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
  " let foldchar = matchstr(&fillchars, 'fold:\zs.')
  let foldchar = "─"
  let foldtextstart = strpart(commentless_line, 0, (winwidth(0)*2)/3)
  " let foldtextend = lines_count_text . repeat(foldchar, 8 + 2)
  let foldtextend = lines_count_text
  " let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  let foldtextlength = strlen(substitute(foldtextstart, '.', 'x', 'g')) + &foldcolumn
  let foldtextstartlength = strlen(substitute(foldtextstart, '.', 'x', 'g')) + strlen(foldtextend) + &foldcolumn
  " return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength - 17) . foldtextend . "      "
  " return repeat(foldchar, winwidth(0))
endfunction
set foldtext=NeatFoldText()

" }}}

" }}}
" Filetype Specific -------------------------------------------------- {{{

" C -------------------------------------------------- {{{

au FileType c setlocal foldmethod=syntax
au FileType c syn match Function /\w\+(/me=e-1

" }}}
" Html -------------------------------------------------- {{{

augroup ft_html
    au!

    au BufNewFile,BufRead *.html setlocal filetype=htmldjango
    au FileType xhtml setlocal filetype=htmldjango
    au FileType htmldjango setlocal foldmethod=indent

    " Django tags
    au FileType htmldjango inoremap <buffer> <C-T> {%<Space><Space>%}<Left><Left><Left>

    " Django variables
    au FileType htmldjango inoremap <buffer> <C-V> {{<Space><Space>}}<Left><Left><Left>

    " Two space indenting for max screen real estate usage
    autocmd Filetype htmldjango setlocal ts=2 sw=2 expandtab

    " Set comments
    au FileType htmldjango setlocal commentstring={#\ %s\ #}

augroup END

" }}}
" Man -------------------------------------------------- {{{

au Filetype man nnoremap h <Down>
au Filetype man nnoremap t <Up>
au Filetype man nnoremap <C-D> <PageDown>
au Filetype man nnoremap <C-U> <PageUp>

" }}}
" Markdown -------------------------------------------------- {{{

" Forcing vim to read .md as markdown and not as 'modula2' or whatever
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
" Folding for markdown
autocmd Filetype markdown set foldcolumn=4

" }}}
" Org -------------------------------------------------- {{{

function! OrgDayFilename()
    silent !org -day
    redraw!
    return "/Users/macuser/org/days/" . strftime("%Y-%m-%d") . ".org"
endfunction
function! OrgWeekFilename()
    silent !org -week
    redraw!
    return "/Users/macuser/org/weeks/" . strftime("%Y-%W") . ".org"
endfunction
function! OrgAgenda()
    " silent !echo Hello, world.
    " redraw!
    execute ":e " . OrgWeekFilename()
    execute ":sp " . OrgDayFilename()
endfunction
function! OrgQuit()
    execute ":w"
    execute ":bd"
    execute ":w"
    execute ":bd"
endfunction
function! OrgTimestamp()
    let line=getline('.')

    let org_states = ["* ", "* TODO ","* UNDERWAY ", "* DONE "]

    " Testing for org state
    for test_state in range(3, 0, -1)
        if match(line, org_states[test_state]) != -1
            let current_org_state = test_state
            break
        else
            let current_org_state = 1000
        endif
    endfor

    " substituting current org state for next org state
    if current_org_state < 1000
        let org_state_substituted_line = substitute(line, org_states[current_org_state], org_states[(current_org_state + 1) % 4], "")
        let line = org_state_substituted_line
    endif

    " Handling insertion of timestamp
    let timestamp_regex = "\[.*"
    let timestamp = "[" . strftime("%b %d, %I:%M:%S %p") . "]"

    " if the timestamp exists, replace it with the current timestamp
    if match(line, timestamp_regex) != -1
        let new_time_stamp_line = substitute(line, "\[.*", timestamp, "")
        let line = new_time_stamp_line
    " or else append the timestamp
    else
        let line = line  . " " . timestamp
    endif

    call repeat#set("\<C-T>\<C-T>")
    call setline('.', line)
endfunction
function! OrgSort()
    normal zM
    normal gg
    execute ":/\*"
    normal VG
    " normal :SortUnfolded
    " execute ":normal gv :vi :SortUnfolded"
    " visual :SortUnfolded
    " visual ":'<,'>:SortUnfolded"
    " execute ":%s/%x00/\r"
endfunction
nnoremap <Leader>od :e `=OrgDayFilename()`<CR>
nnoremap <Leader>ow :e `=OrgWeekFilename()`<CR>
nnoremap <Leader>op :e ~/org/
nnoremap <Leader>oa :call OrgAgenda()<CR>
autocmd Filetype org nnoremap <Leader>oq :call OrgQuit()<CR>
autocmd Filetype org nnoremap <C-T><C-T> :silent call OrgTimestamp()<CR>
autocmd Filetype org nnoremap <Leader>os zMgg/\*VG:SortUnfolded:%s/\%x00/\rzM

" }}}
" Python -------------------------------------------------- {{{

let python_highlight_all = 1

" }}}
" Ruby -------------------------------------------------- {{{

" 2 space tabs in ruby
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype eruby setlocal ts=3 sw=2 expandtab

" }}}

" }}}
" Plugin Settings -------------------------------------------------- {{{

" Ag -------------------------------------------------- {{{

nnoremap <Leader>/ :Ag<Space>

" }}}
" Bundles {{{

" Bundle 'gmarik/vundle'
" Bundle 'altercation/vim-colors-solarized'
" Bundle 'mattn/emmet-vim'
" Bundle 'kien/ctrlp.vim'
" Bundle 'scrooloose/syntastic'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'terryma/vim-multiple-cursors'
" Bundle 'tpope/vim-fugitive'
" Bundle 'mklabs/vim-fetch'
" Bundle 'Townk/vim-autoclose'
" Bundle 'fatih/vim-go'
" Bundle 'ervandew/supertab'
" Bundle 'tpope/vim-commentary'
" Bundle 'Kazark/vim-SimpleSmoothScroll'
" Bundle 'jplaut/vim-arduino-ino'
" Bundle 'kien/rainbow_parentheses.vim'
" Bundle 'tpope/vim-surround'
" Bundle 'bling/vim-airline'
" Bundle 'bling/vim-bufferline'
" Bundle 'sjl/gundo.vim'
" Bundle 'SirVer/ultisnips'
" Bundle 'plasticboy/vim-markdown'

" }}}
" Buffergator -------------------------------------------------- {{{

let g:buffergator_suppress_keymaps=1
nnoremap <Leader>b :BuffergatorToggle<CR>

" }}}
" Buffer line -------------------------------------------------- {{{

" let g:bufferline_active_buffer_left = ""
" let g:bufferline_active_buffer_right = ""


" }}}
" Ctrl P -------------------------------------------------- {{{

let g:ctrlp_map = '<Leader>o'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_prompt_mappings = {'PrtSelectMove("k")': ['<c-t>'], 'ToggleByFName()':['<c-f>'], 'AcceptSelection("t")': ['<c-y>'], 'PrtCurLeft()': ['<left>'], 'PrtSelectMove("j")':['<c-n>'], 'PrtHistory(-1)': ['<c-l>'],}

" }}}
" Fugitive --------------------------------------------------" {{{

" Fugitive custom mappings
function! ToggleGStatus()
    if buflisted(bufname('.git/index'))
        bd .git/index
    else
        Gstatus
    endif
endfunction
command! ToggleGStatus :call ToggleGStatus()
nnoremap <Leader>g :ToggleGStatus<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gd :Gdiff<CR>

" }}}
" Gundo -------------------------------------------------- {{{
" Gundo config
" nnoremap gu :GundoToggle<CR>

" }}}
" Jedi -------------------------------------------------- {{{

let g:jedi#completions_command = "<C-P>"
let g:jedi#goto_assignments_command = "<Leader>pg"
let g:jedi#goto_definitions_command = "<Leader>pg"
let g:jedi#documentation_command = "<Leader>pd"
let g:jedi#rename_command = "<Leader>pr"
let g:jedi#usages_command = "<Leader>pu"
let g:jedi#show_call_signatures = "1"

" }}}
" Matchit -------------------------------------------------- {{{

runtime macros/matchit.vim

" }}}
" Rainbow -------------------------------------------------- {{{

let g:rainbow_active=1
" Turn off Rainbow parentheses for Django html
autocmd FileType htmldjango RainbowParenthesesToggle
let g:rainbow_ctermfgs = [196, 129, 202, 126, 184, 21, 40]

" }}}
" Syntastic -------------------------------------------------- {{{

let g:syntastic_python_checkers = ['python']
let g:syntastic_cpp_compiler = "g++"
let g:syntastic_cpp_compiler_options = "-std=c++11"
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_full_redraws = 1
let g:syntastic_auto_jump = 2         " Jump to syntax errors
let g:syntastic_auto_loc_list = 1     " Auto-open the error list

" }}}
" Tabularize ------------------------------------------------ {{{

nnoremap <Leader>ap :Tabularize /\|<CR> | " Align Pipe
nnoremap <Leader>at :Tabularize /\|<CR> | " Align Table
nnoremap <Leader>aa :Tabularize /       | " Align Choice
nnoremap <Leader>av :Tab /\|\ "<CR>     | " Align Vim inline comment
vmap <Leader>ap :Tabularize /\|<CR>     | " Align Pipe
vmap <Leader>at :Tabularize /\|<CR>     | " Align Table
vmap <Leader>aa :Tabularize /           | " Align Choice
vmap  <Leader>av :Tab /\|\ "<CR>        | " Align Vim inline comment

" }}}
" UltiSnips -------------------------------------------------- {{{

" UltiSnips Config
let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsExpandTrigger="<C-S>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<C-S>"
" let g:UltiSnipsJumpBackwardTrigger='<C-k>'

" }}}
" Unite -------------------------------------------------- {{{

let g:unite_enable_start_insert = 1
let g:unite_force_overwrite_statusline = 0
let g:unite_winheight = 10
let g:unite_split_rule = "botright"
" Quick Buffer Switching
" nnoremap <Leader>b :Unite -quick-match buffer<CR>

" }}}
" vim airline -------------------------------------------------- {{{

let g:airline_powerline_fonts=1
let g:airline_theme='base16'
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#branch#displayed_head_limit=10
let g:airline#extensions#syntastic#enabled=1
let g:airline#extensions#eclim#enabled = 0

" }}}
" vim go -------------------------------------------------- {{{

let g:go_disable_autoinstall = 1

" }}}
" vim indent guides -------------------------------------------------- {{{

let g:indent_guides_start_level = 2
let g:indent_guides_auto_colors = 0
autocmd VimEnter,ColorScheme * :hi IndentGuidesOdd ctermbg=18
autocmd VimEnter,ColorScheme * :hi IndentGuidesEven ctermbg=8

" }}}
" vim journal -------------------------------------------------- {{{

let g:journal_directory="~/.journal"
let g:journal_extension="md"

" }}}
" vim markdown folding ----------------------------------------------- {{{

let g:markdown_fold_style = 'nested'
let g:markdown_fold_override_foldtext = 0

" }}}
" vim org mode -------------------------------------------------- {{{

autocmd Filetype org setl noai nocin nosi inde=

" }}}

" }}}
" Fold Settings -------------------------------------------------- {{{
" vim:foldmethod=marker:foldlevel=0 }}}
