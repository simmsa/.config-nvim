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
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅
set linebreak
" Configuring backup directories
set backupdir=./.backup,.,/tmp
set directory=.,./.backup,/tmp
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
" set nu
set rnu
autocmd InsertEnter * set nornu
autocmd InsertLeave * set rnu
" Fixing Delays?
set ttimeoutlen=10
set timeoutlen=300
" Better tab completion?
set wildmode=longest,list,full
set wildmenu
" Use system clipboard
" set clipboard=unnamed,unnamedplus

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
nnoremap D 0
nnoremap N $
"easier navigation of finds
nmap - :

" }}}
" Convience Mappings ------------------------------------------------- {{{

"<Ctrl-l> redraws the screen and removes any search highlighting
nnoremap <silent> <C-l> :nohl<CR><C-l>
" Map esc to ht
imap ht <Esc>
vmap ht <Esc>
" Set insert mode timeout, cause I keep forgetting
au CursorHoldI * stopinsert
au InsertEnter * let updaterestore=&updatetime | set updatetime=15000
au InsertLeave * let &updatetime=updaterestore
"Remap normal mode
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
" Easy inversion of colorscheme
nnoremap <Leader>ic :colorscheme pychimp-inverted<CR>
" Easier uppercase
nnoremap <Leader>u bgUw
"Easy buffer switching
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>p :bp<CR>
nnoremap <Leader>d :bd<CR>

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


" }}}
" Searching and Movement {{{

"Find the next match as we type the search
set incsearch
"Highlight searches by default
set hlsearch

" }}}
" Quick Editing  ------------------------------------------------- {{{

nnoremap <Leader>ev :e ~/.vim/vimrc<CR>
nnoremap <Leader>ez :e ~/.zshrc<CR>
" Org mode
" nnoremap <Leader>oo :e ~/org/index.org<CR>
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
nnoremap <Leader>od :e `=OrgDayFilename()`<CR>
nnoremap <Leader>ow :e `=OrgWeekFilename()`<CR>
nnoremap <Leader>op :e ~/org/
" nnoremap <Leader>oa :e `=OrgDayFilename()`; :sp `=OrgWeekFilename()`<CR>
nnoremap <Leader>oa :call OrgAgenda()<CR>
nnoremap <Leader>oq :call OrgQuit()<CR>
" inoremap <C-T><C-T> <C-R>=OrgTimestampStart()<CR>
nnoremap <C-T><C-T> :silent call OrgTimestamp()<CR>
" nnoremap <Leader>ts =OrgTimestampStart()<CR>
" inoremap <C-T><C-E> <C-R>=OrgTimestampComplete()<CR>

" }}}
" Folding {{{
set foldenable
set foldlevelstart=0
set foldmethod=marker
" Easier Folding
nnoremap <Leader><Space> za
nnoremap <Leader>z zM

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

" Markdown -------------------------------------------------- {{{

" Forcing vim to read .md as markdown and not as 'modula2' or whatever
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
" Folding for markdown
autocmd Filetype markdown set foldcolumn=4

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
" Ctrl P -------------------------------------------------- {{{

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

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
nnoremap <Leader>gc :Gcommit
nnoremap <Leader>gd :Gdiff<CR>

" }}}
" Gundo -------------------------------------------------- {{{
" Gundo config
" nnoremap gu :GundoToggle<CR>

" }}}
" Rainbow Parens -------------------------------------------------- {{{

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Turn off Rainbow parentheses for Django html
autocmd FileType htmldjango RainbowParenthesesToggle

" }}}
" Syntastic -------------------------------------------------- {{{

let g:syntastic_python_checkers = ['pylint']
let g:syntastic_cpp_compiler = "g++"
let g:syntastic_cpp_compiler_options = "-std=c++11"

" }}}
" Tabularize ------------------------------------------------ {{{

if exists(":Tabularize")
    nnoremap <Leader>ap :Tabularize /\|<CR> | " Align Pipe
    nnoremap <Leader>at :Tabularize /\|<CR> | " Align Table
    nnoremap <Leader>aa :Tabularize /       | " Align Choice
    nnoremap <Leader>av :Tab /\|\ "<CR>     | " Align Vim inline comment
    vmap <Leader>ap :Tabularize /\|<CR>     | " Align Pipe
    vmap <Leader>at :Tabularize /\|<CR>     | " Align Table
    vmap <Leader>aa :Tabularize /           | " Align Choice
    vmap  <Leader>av :Tab /\|\ "<CR>        | " Align Vim inline comment
    " nnoremap <Leader>a| :Tabularize /\|<CR> "Conflicts with ino maps
    " vmap <Leader>a| :Tabularize /\|<CR> "Conflicts with ino maps
endif

" }}}
" UltiSnips -------------------------------------------------- {{{

" UltiSnips Config
let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsExpandTrigger="<C-S>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<C-S>"
" let g:UltiSnipsJumpBackwardTrigger='<C-k>'

" }}}
" vim airline -------------------------------------------------- {{{

let g:airline_powerline_fonts=1
let g:airline_theme='base16'
" let g:airline_left_sep=''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''
let g:airline#extensions#branch#enabled=1
" let g:airline#extensions#branch#displayed_head_limit=10
let g:airline#extensions#syntastic#enabled=1
" let g:airline#extensions#whitespace#enabled=0

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
" vim markdown folding ----------------------------------------------- {{{

let g:markdown_fold_style = 'nested'
let g:markdown_fold_override_foldtext = 0

" }}}
" YouCompleteMe -------------------------------------------------- {{{

" Allows both UltiSnips and YCM to use tab
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

" }}}

" }}}
" Fold Settings -------------------------------------------------- {{{
" vim:foldmethod=marker:foldlevel=0 }}}
