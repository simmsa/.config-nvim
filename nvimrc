" .vimrc
" Author: Andrew Simms <andrew@andrewdsimms.com> <https://github.com/simmsa>
" vim plug --------------------------------------- {{{

" set nocompatible
filetype off
call plug#begin('~/.nvim/bundle')
Plug 'tpope/vim-commentary'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'jplaut/vim-arduino-ino'
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'sjl/gundo.vim'
Plug 'SirVer/ultisnips'
Plug 'tmhedberg/SimpylFold'
Plug 'rking/ag.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'calendar.vim'
Plug 'davidhalter/jedi-vim'
Plug 'oblitum/rainbow'
Plug 'godlygeek/tabular'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-markdown'
Plug 'nelstrom/vim-markdown-folding'
Plug 'tpope/vim-repeat'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-speeddating'
Plug 'jmcantrell/vim-journal'
Plug 'ervandew/supertab'
Plug 'kien/rainbow_parentheses.vim'
Plug 'justinmk/vim-sneak'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-expand-region'
Plug 'zaiste/tmux.vim'
Plug 'scrooloose/nerdtree'
Plug 'pangloss/vim-javascript'
Plug 'marijnh/tern_for_vim'
Plug 'heavenshell/vim-jsdoc'
Plug 'gorodinskiy/vim-coloresque'
Plug 'vim-scripts/SyntaxAttr.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| .install' }
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-oblique'
call plug#end()
filetype plugin indent on

" }}}
" Basic Options {{{

set encoding=utf-8
set modelines=0
set textwidth=0
set wrap
set autoindent
set cindent
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
set list " Messes up line break, but shows list chars
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
set wildignore+=*/.git/*,*/.sass-cache/*,*/lib/*,*/migrations/*
" Ignore files
set wildignore+=*.pyc,*.jpg,*.png,*.log,*.o,*.so,*.gif,*.class
" Spelling
set dictionary=/usr/share/dict/words
set spelllang=en_us
" Use zsh if available
if system("which zsh")
    set shell=`echo system("which zsh")`
endif
" Make test-name and test_name auto completable
set iskeyword+=\-,\_
" Don't highlight really long lines
set synmaxcol=500
" Window titles for tmux
function! TruncateFilename(max_len)
    let filename=expand("%:t")
    if len(filename) <= a:max_len
        return filename
    else
        let filename_len=len(filename)
        let half = a:max_len / 2
        return filename[0:half-1] . "…" . filename[filename_len-(half):filename_len-1]
endfunction
autocmd BufReadPost,FileReadPost,BufNewFile,BufEnter * call system("tmux rename-window " . TruncateFilename($TRUNCATE_MAX_WORD_LEN))
let g:terminal_scrollback_buffer_size = 100000
" Prefer splits to open below and on the right
set splitbelow
set splitright

" Color scheme -------------------------------------------------- {{{

syntax on
colorscheme sustain
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

" Map dvorak keys everywhere with noremap explicitly
" noremap as opposed to nnoremap maps a command in every mode
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
" Consistent behavior with C
noremap K d$
noremap Y y$
"easier navigation of finds
noremap - :
" Faster Movements (lookUps)
noremap u f
" I Fudged up
noremap f u

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
"Changing number incrementing
nnoremap <C-j> <C-a>
nnoremap <C-k> <C-x>
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
" Faster repeat command
nnoremap <C-P> :<C-P><CR>
"Quickfix mappings
autocmd BufReadPost quickfix nnoremap <buffer> <C-N> <Down>
autocmd BufReadPost quickfix nnoremap <buffer> <C-T> <Up>
" Get to the shell faster
nnoremap S :!<Space>
" Make <C-P> behave like it should and also zsh like
cnoremap <C-P> <Up>
cnoremap <C-T> <Up>
" Easier uppercase
inoremap <C-l> <ESC>mzgUiw`zi<Right>
" Faster window switching
nnoremap ss <C-w><C-w>
nnoremap sh <C-w><Down>
nnoremap st <C-w><Up>
" nnoremap sd <C-w><Left>
" nnoremap sn <C-w><Right>
nnoremap sq <C-w>q
" 'Axe' the current window (close only the current window)
nnoremap sa :b#<bar>bd#<CR>
nnoremap sx :bd<CR>
" Vertically split the current file
nnoremap sv :vs<CR>
" Show open buffers
nnoremap sb :ls<CR>
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
" Easier system copy and paste
vmap <Leader>y "+y
vmap <Leader>k "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
" Make y jump to the end of the selection
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
" Go to tag
nnoremap gt <C-]>
" Go to previous buffer
nnoremap gp :bp<CR>
" Use full width of the screen
function! NoDistractions()
    :set nornu
    :set nonu
    :set nolist
    :silent AirlineToggleWhitespace
endfunction
command! Nd :silent call NoDistractions()
" Quit!
nnoremap Q :qall<CR>
" I never use ; in any commands, but I use : all the time
cnoremap ; :
" Mouse scroll in iterm2
set mouse=nicr
" Fix unwanted action in normal mode
nnoremap <C-f> :echo "Not in insert mode!"<CR>
" Read the file, useful for proofreading
command! Read :! say -v kate -f %
" Go to the next buffer
nnoremap <Tab> :bn<CR>
" Faster semicolon insert
" Note, <C-punctuation> mappings don't work due to term issues
inoremap <C-s> <End>;

" Leader Mappings -------------------------------------------------- {{{

" Map leader key to space
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"
" <Space> w to save a file
nnoremap <Leader>w :w<CR>
"<Space> s to source VIMRC
nnoremap <Leader>s :so ~/.nvimrc<Bar>RainbowLoad<CR>
"Easy buffer switching
" nnoremap <Leader>n :bn<CR>
" nnoremap <Leader>p :bp<CR>
nnoremap <Leader>d :bd<CR>
" Substitute like * (\< and \> select only that word)
nnoremap <Leader>; :%s:\<<C-R><C-W>\>:
" Spell Checking (Change cursorline to underline to retain highlights)
function! ToggleSpellCheck()
    if (&spell == 0)
        setlocal spell
        hi Cursorline ctermfg=NONE ctermbg=NONE cterm=underline
        setlocal complete+=kspell
        echo "Spell Check On!"
    else
        setlocal nospell
        hi Cursorline ctermfg=NONE ctermbg=8 cterm=NONE
        setlocal complete-=kspell
        echo "Spell Check Off!"
    endif
endfunction
nnoremap sc :call ToggleSpellCheck()<CR>
" Spelling suggestions
nnoremap sg z=
" Navigate misspelled words
function! NextMisspelledWord()
    normal ]s
    normal zv
    normal z.
    call repeat#set("sn")
endfunction
command! NextMisspelledWord call NextMisspelledWord()
nnoremap sn :NextMisspelledWord<CR>
function! PreviousMisspelledWord()
    normal [s
    normal zv
    normal z.
    call repeat#set("sp")
endfunction
command! PreviousMisspelledWord call PreviousMisspelledWord()
nnoremap sp :PreviousMisspelledWord<CR>

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

" Vertically split current file and scroll with it
nnoremap <silent> sf :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>

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
" Turn off highlighting when it is not needed
nnoremap <CR> :noh<CR>

" }}}
" Quick Editing  ------------------------------------------------- {{{

nnoremap <Leader>ev :e ~/.vim/vimrc<CR>
nnoremap <Leader>ez :e ~/.zshrc<CR>
nnoremap <Leader>ea :e ~/.aliases.zsh<CR>
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

nmap <Leader>f o<Esc>50i-<Esc>A<Space>{{{<CR>}}}<Esc>gcc2t0gcchkktf<Space>i<Space><Esc>ni
" NeatFoldText -------------------------------------------------- {{{

function! NeatFoldText()
  " let line = ' ' . substitute(getline(v:foldstart), '^\s#*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let line = substitute(getline(v:foldstart), '{{' . '{', '', 'g') . ' '
  let commentless_line = ' ' . substitute(line, '//\|#\|/\*\|\*/\|"\|-', '', 'g')
  let markdown_line = line
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = ' ' . printf("%s", lines_count . ' lines') . ' '
  let foldchar = "─"
  if (&ft=='markdown')
      let foldtextstart = strpart(markdown_line, 0, (winwidth(0)*2)/3)
  else
      let foldtextstart = strpart(commentless_line, 0, (winwidth(0)*2)/3)
  endif
  let foldtextend = lines_count_text
  let foldtextlength = strlen(substitute(foldtextstart, '.', 'x', 'g')) + &foldcolumn
  let foldtextstartlength = strlen(substitute(foldtextstart, '.', 'x', 'g')) + strlen(foldtextend) + &foldcolumn
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength - 17) . foldtextend . "      "
endfunction
set foldtext=NeatFoldText()

" }}}

" }}}
" Filetype Specific -------------------------------------------------- {{{

" C -------------------------------------------------- {{{

if has("nvim")
    tnoremap <Esc> <C-\><C-n>
endif

function! TermEscape(str)
    return substitute(a:str, " ", "\\\\ ", "g")
endfunction

function! IsQuickWindowOpen()
    for i in range(1, winnr('$'))
        let bnum = winbufnr(i)
        if getbufvar(bnum, '&buftype') == 'quickfix'
            return 1
        endif
    endfor
    return 0
endfunction

function! MakeC(check_syntax)
    if(a:check_syntax != "false")
        :w|SyntasticCheck
    else
        :w
    endif
    if IsQuickWindowOpen() > 0
        return
    endif
    let l:filename = expand("%:r")
    execute ":silent ! make f=" . l:filename
endfunction

function! MakeRunC(option)
    if IsQuickWindowOpen() > 0
        return
    endif
    let l:filename = expand("%:r")
    let l:run_command = "make run f=" . l:filename
    let l:valgrind_command = "make valgrind f=" . l:filename
    let l:scan_build_command = "make scan-build f=" . l:filename
    let l:gdb_command = "make gdb f=" . l:filename
    let l:gdv_command = "gdv ./" . l:filename
    let l:gdh_command = "gdh ./" . l:filename
    let l:gds_command = "gds ./" . l:filename
    if(a:option == "valgrind")
        let l:run_command = l:valgrind_command
    elseif(a:option == "scan-build")
        let l:run_command = l:scan_build_command
    elseif(a:option == "gdb")
        let l:run_command = l:gdb_command
    elseif(a:option == "gdv")
        let l:run_command = l:gdv_command
    elseif(a:option == "gdh")
        let l:run_command = l:gdh_command
    elseif(a:option == "gds")
        let l:run_command = l:gds_command
    endif
    if has("nvim") && !(index(["gdv", "gdh", "gds"], a:option) >= 0)
        " gdb tui mode works best with the full screen
        if(a:option != "gdb")
            execute ":10sp"
        endif
        execute ":term " . l:run_command
    else
        execute ":! " . l:run_command
    endif
    " Cleanup files when the buffer is deleted
    au! BufDelete <buffer> call MakeClean()
endfunction

function! MakeRunCWithArgs(...)
    if IsQuickWindowOpen() > 0
        return
    endif
    " a:000 is a list of the given args
    let l:args = join(a:000, " ")
    let l:filename = expand("%:r")
    let l:run_command = "./" . l:filename . " " . l:args
    echo l:run_command
    if has("nvim")
        execute ":10sp"
        execute ":term " . run_command
    else
        execute ":! " . run_command
    endif
    " Cleanup files when the buffer is deleted
    au! BufDelete <buffer> call MakeClean()
endfunction

function! MakeClean()
    let l:filename = expand("%:r")
    execute ":silent ! make clean f=" . l:filename
    echo l:filename
endfunction

command! -bar Make :call MakeC("true")
command! -bar ForceMake :call MakeC("false")
command! Run :call MakeRunC("normal")
command! RunValgrind :call MakeRunC("valgrind")
command! RunScanBuild :call MakeRunC("scan-build")
command! RunGDB :call MakeRunC("gdb")
command! RunGDV :call MakeRunC("gdv")
command! RunGDH :call MakeRunC("gdh")
command! RunGDS :call MakeRunC("gds")
command! -nargs=* RunWithArgs :call MakeRunCWithArgs(<f-args>)
augroup ft_c
    autocmd!
    au BufNewFile,BufRead *.h set filetype=c
    au FileType c setlocal foldmethod=syntax
    au FileType c setlocal commentstring=//\ %s
    au FileType c syn match Function /\w\+(/me=e-1
    au FileType c setlocal makeprg=make\ f=%:r
    au FileType c nnoremap <buffer> cp :Make<bar>Run<CR><CR>
    au FileType c nnoremap <buffer> cv :Make<bar>RunValgrind<CR><CR>
    au FileType c nnoremap <buffer> cd :Make<bar>RunScanBuild<CR><CR>
    au FileType c nnoremap <buffer> cg :Make<bar>RunGDB<CR><CR>
    au FileType c nnoremap <buffer> cv :Make<bar>RunGDV<CR><CR>
    au FileType c nnoremap <buffer> ch :Make<bar>RunGDH<CR><CR>
    au FileType c nnoremap <buffer> cm :Make<bar>RunGDS<CR><CR>
    au FileType c nnoremap <buffer> co :ForceMake<bar>Run<CR><CR>
    au FileType c nnoremap <buffer> ca :Make<bar>RunWithArgs<Space>
    au FileType c setlocal nofoldenable
augroup END

" }}}
" C++ -------------------------------------------------- {{{

au FileType cpp syn match Special /*\s\|+\s\|-\s\|\/\s\|%\s/
au FileType cpp syn match Operator /=/
au FileType cpp syn match Todo /==/
au FileType cpp syn match Exception />\|</
au FileType cpp setlocal commentstring=//\ %s

" }}}
" CSS -------------------------------------------------- {{{

augroup ft_css
    au FileType css hi link cssVendor StorageClass
augroup END

" }}}
" Git -------------------------------------------------- {{{

au FileType gitcommit setlocal spell

" }}}
" Html -------------------------------------------------- {{{

augroup ft_html
    au!

    au BufNewFile,BufRead *.html setlocal filetype=htmldjango
    au FileType xhtml setlocal filetype=htmldjango

    " Django tags
    au FileType htmldjango inoremap <buffer> <C-T> {%<Space><Space>%}<Left><Left><Left>

    " Django variables
    au FileType htmldjango inoremap <buffer> <C-V> {{<Space><Space>}}<Left><Left><Left>

    " Two space indenting for max screen real estate usage
    au Filetype htmldjango setlocal ts=2 sw=2 expandtab

    " Set comments
    au FileType htmldjango setlocal commentstring={#\ %s\ #}
    if &foldmethod != "indent"
        au FileType htmldjango setlocal foldmethod=indent
    endif

augroup END

" }}}
" Java -------------------------------------------------- {{{

function! CompileJava(input_type)
    let filename = expand("%:r")
    let dot_filename = substitute(filename, "/", ".", "g")
    let compilecommand = "javac -cp '.'" . filename . ".java"
    let runcommand = "java -cp '.' " . filename
    let runcommand_escaped = TermEscape(runcommand)
    " Syntastic has to compile the file to run the checker
    :w|SyntasticCheck

    " If the quickfix window is open there are errors so don't
    " run anything.
    for i in range(1, winnr('$'))
        let bnum = winbufnr(i)
        if getbufvar(bnum, '&buftype') == 'quickfix'
            return
        endif
    endfor

    if has("nvim")
        execute ":10sp term://" . runcommand_escaped
        :winc r
        if(a:input_type =="normal")
            :startinsert
        endif
    else
        execute ":! java " . filename
    endif
endfunction

augroup ft_java
    au Filetype java nnoremap <buffer> cp :call CompileJava("normal")<CR>
    au Filetype java nnoremap <buffer> cn :call CompileJava("input")<CR>
    au Filetype java nnoremap <buffer> <Leader>w :w<bar>SyntasticCheck<CR>
augroup end

" }}}
" JavaScript -------------------------------------------------- {{{

augroup ft_javascript
    au!
    au FileType javascript let g:term_show_argument_hints="on_hold"
    " Pave the way for rainbow parens
    au FileType javascript syntax clear jsFuncBlock
    au FileType javascript syntax clear jsFuncArgs
    " docuMentation
    au FileType javascript nnoremap <buffer> gm :JsDoc<CR>
augroup end

" }}}
" Markdown -------------------------------------------------- {{{

function! CompileMDPDF()
    execute ":! md2pdf " . expand("%:r")
endfunction

function! CompileMDHtml()
    let filename_with_extension = expand("%")
    let filename = expand("%:r")
    " Create the comp for include files
    silent execute ":w"
    silent execute ":! cp " . filename . ".md " . filename . ".mdpp"
    silent execute ":! markdown-pp " . filename . ".mdpp " . filename . "_comp.md"
    silent execute ":! md2html " . filename . "_comp.md > " . filename . ".html"
    silent execute ":! rm " . filename . "_comp.md"
endfunction

function! CompileHtmlAndOpen()
    silent call CompileMDHtml()
    silent execute ":! open " . expand("%:r") . ".html"
endfunction

function! CompileHtmlAndReload()
    silent call CompileMDHtml()
    silent execute ":! chrome_reload"
endfunction

function! CreateIncludeFile()
    " !INCLUDE "File Path"
    let line = getline(".")
    if(match(line, "!INCLUDE") < 0)
        echo("Error: Not an includes line!")
        return
    endif
    let filename = matchstr(line, '".*"')[1:-2]
    execute ":e " . filename
    return
endfunction

augroup ft_md
    autocmd!
    " Forcing vim to read .md as markdown and not as 'modula2' or whatever
    au BufNewFile,BufReadPost *.md set filetype=markdown
    " Folding for markdown
    au Filetype markdown set foldcolumn=4
    au Filetype markdown set breakat-=\*
    au Filetype markdown nnoremap <buffer> cp :call CompileMDPDF()<CR>
    au Filetype markdown nnoremap <buffer> ch :silent call CompileHtmlAndOpen()<CR>
    au Filetype markdown nnoremap <buffer> cr :silent call CompileHtmlAndReload()<CR>
    au Filetype markdown nnoremap <buffer> gi :call CreateIncludeFile()<CR>
augroup END

let g:markdown_fenced_languages = ['python', 'bash=sh', 'c', 'html', 'css', 'javascript', 'java', 'xml']

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

function! RunPython(input_type)
    :w
    let filename = expand("%")
    let command = "python " . filename
    let command_escaped = "python\\ " . filename
    if has("nvim")
        execute ":10sp term://" . command_escaped
        :winc r
        if(a:input_type == "normal")
            :startinsert
        endif
    else
        execute ":! " . command
    endif
endfunction

augroup ft_python
    autocmd!
    au BufNewFile,BufRead *.py set keywordprg=pydoc
    au Filetype python nnoremap <buffer> cp :call RunPython("normal")<CR>
    au Filetype python nnoremap <buffer> cn :call RunPython("input")<CR>
augroup end

" }}}
" Ruby -------------------------------------------------- {{{

" 2 space tabs in ruby
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype eruby setlocal ts=3 sw=2 expandtab

" }}}
" Swift -------------------------------------------------- {{{

function! RunSwift()
    execute ":w"
    if IsQuickWindowOpen()
        return
    endif
    let s:fname = expand("%")
    let s:command = "swift " . s:fname
    if has("nvim")
        execute ":10sp"
        execute ":winc r"
        execute ":term " . s:command
    else
        execute ":! " . s:command
    endif
endfunction

command! RunSwift :call RunSwift()

augroup ft_swift
    autocmd!
    au FileType swift syn match Function /\w\+(/me=e-1
    au FileType swift nnoremap <buffer> cp :RunSwift<CR><CR>

augroup END


" }}}

" }}}
" Plugin Settings -------------------------------------------------- {{{

" Ag -------------------------------------------------- {{{

nnoremap <Leader>/ :Ag<Space>

" }}}
" auto pairs -------------------------------------------------- {{{

let g:AutoPairsCenterLine = 0

" }}}
" Fugitive --------------------------------------------------" {{{

" Fugitive custom mappings
function! ToggleGStatus()
    if buflisted(bufname('.git/index'))
        bd .git/index
    else
        Gstatus
        " Move to the first file in the list
        exe "normal \<C-n>"
    endif
endfunction
command! ToggleGStatus :call ToggleGStatus()
nnoremap <Leader>g :ToggleGStatus<CR>
nnoremap gs :ToggleGStatus<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap gm :Gcommit<CR>

" }}}
" FZF -------------------------------------------------- {{{

nnoremap go :FZF<CR>

au TermOpen term://*:FZF tnoremap <buffer> <C-t> <Up>
au TermOpen term://*:FZF tnoremap <buffer> <Esc> <C-c>

function! FZF_fileopen(e)
    execute 'e ' a:e
endfunction

" Open buffer list with fzf, modified from fzf wiki
" Removes the current buffer from the list and automatically
" goes to the next buffer if there is only one result.
function! FZF_buflist()
    redir => ls
    silent ls
    redir END
    " Remove the current active buffer from the buffer list
    let FZF_all_buffers = split(ls, '\n')
    let current_list_item = 0
    for FZF_buf in FZF_all_buffers
        if match(FZF_buf, "\%a") > 0
            call remove(FZF_all_buffers, current_list_item)
        endif
        let current_list_item += 1
    endfor
    return FZF_all_buffers
endfunction

function! FZF_bufopen(e)
    execute 'buffer ' matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> gu :call fzf#run({
\ 'down': len(FZF_buflist()) + 2,
\ 'source': reverse(FZF_buflist()),
\ 'sink': function('FZF_bufopen'),
\ 'options': '+m -1 -0'
\ })<CR>

" Jump to tags with fzf, directly from fzf wiki
command! -bar FZFTags if !empty(tagfiles()) | call fzf#run({
\   'source': "sed '/^\\!/d;s/\t.*//' " . join(tagfiles()) . ' | uniq',
\   'sink':   'tag',
\ }) | else | echo 'Preparing tags' | call system('ctags -R') | FZFTag | endif

nnoremap gt :FZFTags<CR>

" Narrow ag results within vim, directly from fzf wiki
function! s:ag_to_qf(line)
  let parts = split(a:line, ':')
  return {'filename': parts[0], 'lnum': parts[1], 'col': parts[2],
        \ 'text': join(parts[3:], ':')}
endfunction

function! s:ag_handler(lines)
  if len(a:lines) < 2 | return | endif

  let cmd = get({'ctrl-x': 'split',
               \ 'ctrl-v': 'vertical split',
               \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')
  let list = map(a:lines[1:], 's:ag_to_qf(v:val)')

  let first = list[0]
  execute cmd escape(first.filename, ' %#\')
  execute first.lnum
  execute 'normal!' first.col.'|zz'

  if len(list) > 1
    call setqflist(list)
    copen
    wincmd p
  endif
endfunction

command! -nargs=* FZFSilverSearch call fzf#run({
\ 'source':  printf('ag --nogroup --column --color "%s"',
\                   escape(empty(<q-args>) ? '^(?=.)' : <q-args>, '"\')),
\ 'sink*':    function('<sid>ag_handler'),
\ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x '.
\            '--multi --bind ctrl-a:select-all,ctrl-d:deselect-all '.
\            '--color hl:68,hl+:110',
\ 'down':    '40%'
\ })

nnoremap ga :FZFSilverSearch<Space>

" }}}
" Git Gutter -------------------------------------------------- {{{

nnoremap gh :GitGutterStageHunk<CR>

" }}}
" Gundo -------------------------------------------------- {{{

nnoremap <Leader>u :GundoToggle<CR>

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
" Kien Rainbow -------------------------------------------------- {{{

" let g:rbpt_colorpairs = [
"     \ ['brown',       'RoyalBlue3'],
"     \ ['Darkblue',    'SeaGreen3'],
"     \ ['darkgray',    'DarkOrchid3'],
"     \ ['darkgreen',   'firebrick3'],
"     \ ['darkcyan',    'RoyalBlue3'],
"     \ ['darkred',     'SeaGreen3'],
"     \ ['darkmagenta', 'DarkOrchid3'],
"     \ ['brown',       'firebrick3'],
"     \ ['gray',        'RoyalBlue3'],
"     \ ['black',       'SeaGreen3'],
"     \ ['darkmagenta', 'DarkOrchid3'],
"     \ ['Darkblue',    'firebrick3'],
"     \ ['darkgreen',   'RoyalBlue3'],
"     \ ['darkcyan',    'SeaGreen3'],
"     \ ['166',     'DarkOrchid3'],
"     \ ['163',         'firebrick3'],
"     \ ]

let g:rbpt_colorpairs = g:sustain_kien_rainbow_parens

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au FileType cpp RainbowParenthesesToggle
au FileType cpp RainbowParenthesesLoadRound
au FileType cpp RainbowParenthesesLoadSquare
au FileType cpp RainbowParenthesesLoadBraces

" }}}
" Matchit -------------------------------------------------- {{{

runtime macros/matchit.vim

" }}}
" Nerdtree -------------------------------------------------- {{{

nnoremap <C-b> :NERDTreeToggle<CR>

augroup nerdtree_fix
    autocmd!
    autocmd filetype nerdtree call Mod_NTree_Maps()
augroup end

function! Mod_NTree_Maps()
    nnoremap <buffer> h gj
    nnoremap <buffer> t gk
endfunction

" }}}
" Oblitum Rainbow -------------------------------------------------- {{{

au FileType c,python,java,ruby,arduino,json,javascript,vim,swift call rainbow#load()
" let g:rainbow_ctermfgs = [196, 129, 202, 126, 184, 14, 40]
let g:rainbow_ctermfgs = g:sustain_cterm_rainbow_parens
let g:rainbow_guifgs = g:sustain_gui_rainbow_parens

" }}}
" Syntastic -------------------------------------------------- {{{

let g:syntastic_python_checkers = ['python']
let g:syntastic_cpp_compiler = "g++"
let g:syntastic_cpp_compiler_options = "-std=c++11"
let g:syntastic_java_javac_executable = "javac"
let g:syntastic_java_checkers = ['javac']
let g:syntastic_java_javac_delete_output = 0
" let g:syntastic_java_javac_classpath = "\."
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_full_redraws = 1
" let g:syntastic_auto_jump = 2         " Jump to syntax errors
let g:syntastic_auto_loc_list = 1     " Auto-open the error list
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" }}}
" Tabularize ------------------------------------------------ {{{

nnoremap <Leader>ap :Tabularize /\|<CR> | " Align Pipe
nnoremap <Leader>at :Tabularize /\|<CR> | " Align Table
nnoremap <Leader>aa :Tabularize /       | " Align Choice
nnoremap <Leader>av :Tab /\|\ "<CR>     | " Align Vim inline comment
vmap <Leader>ap :Tabularize /\|<CR>     | " Align Pipe
vmap <Leader>at :Tabularize /\|<CR>     | " Align Table
vmap <Leader>aa :Tabularize /           | " Align Choice
vmap <Leader>av :Tab /\|\ "<CR>         | " Align Vim inline comment
vmap <Leader>ae :Tab /=<CR>             | " Align equals

" }}}
" UltiSnips -------------------------------------------------- {{{

" UltiSnips Config
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"

" }}}
" vim airline -------------------------------------------------- {{{

let g:airline_powerline_fonts=1
let g:airline_theme='relative'
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#branch#displayed_head_limit=7
let g:airline#extensions#syntastic#enabled=1
function! AirlineFilename()
    return "/" . TruncateFilename(24)
endfunction
let g:airline_section_c="%{AirlineFilename()}"

function! AirlineNull()
    return ""
endfunction
let g:airline_section_y="%{AirlineNull()}"

function! FileProgress(total_lines)
    let current_line = str2nr(line("."))
    let total_lines = str2nr(line("$"))
    let percent_of_file = (current_line * a:total_lines / total_lines)
    let actual_percent = (current_line * 100) / (total_lines * 1)
    let percent_left = a:total_lines - percent_of_file
    let indicator = "█"
    let non_indicator = "░"
    let delim="-"
    return repeat(indicator, percent_of_file) . delim . actual_percent . "%" . delim . repeat(non_indicator, percent_left)
endfunction
let g:airline_section_z="%{FileProgress(10)}"

" }}}
" vim expand region -------------------------------------------------- {{{

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" }}}
" vim gitgutter -------------------------------------------------- {{{

function! JumpToHunkAndUnfold(keypress)
    if(a:keypress == "n")
        :GitGutterNextHunk
    endif

    if(a:keypress == "p")
        :GitGutterPrevHunk
    endif
    " Unfold just where the cursor is (supposed to be)
    normal zv
    " Move cursor to the middle of the screen
    normal z.
    call repeat#set("c" . a:keypress)
endfunction

nnoremap cn :call JumpToHunkAndUnfold("n")<CR>
nnoremap cp :call JumpToHunkAndUnfold("p")<CR>

let g:gitgutter_sign_removed = '-'

" }}}
" vim go -------------------------------------------------- {{{

let g:go_disable_autoinstall = 1

" }}}
" vim indent guides -------------------------------------------------- {{{

" let g:indent_guides_start_level = 2
" let g:indent_guides_auto_colors = 0
" autocmd VimEnter,ColorScheme * :hi IndentGuidesOdd ctermbg=NONE
" autocmd VimEnter,ColorScheme * :hi IndentGuidesEven ctermbg=8

" }}}
" vim journal -------------------------------------------------- {{{

let g:journal_directory="~/.journal"
let g:journal_extension="md"

" }}}
" vim js doc -------------------------------------------------- {{{

" See javascript FileType commands

" }}}
" vim markdown folding ----------------------------------------------- {{{

let g:markdown_fold_style = 'nested'
let g:markdown_fold_override_foldtext = 0

" }}}
" vim oblique  -------------------------------------------------- {{{

nmap l <Plug>(Oblique-n)
nmap L <Plug>(Oblique-N)

" }}}
" vim org mode -------------------------------------------------- {{{

autocmd Filetype org setl noai nocin nosi inde=

" }}}
" vim-sneak -------------------------------------------------- {{{

nmap e <Plug>Sneak_s
nmap E <Plug>Sneak_S
nnoremap <C-e> e
nmap - <Plug>SneakNext
nmap _ <Plug>SneakPrevious
nmap u <Plug>Sneak_f
nmap U <Plug>Sneak_F
nmap j <Plug>Sneak_t
nmap J <Plug>Sneak_T

" }}}

" }}}
" Fold Settings -------------------------------------------------- {{{
" vim:foldmethod=marker:foldlevel=0 }}}
