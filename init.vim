" .vimrc
" Author: Andrew Simms <andrew@andrewdsimms.com> <https://github.com/simmsa>
" vim plug --------------------------------------- {{{

" set nocompatible
" filetype off
call plug#begin('~/.nvim/bundle')
Plug 'tpope/vim-commentary'
Plug 'mattn/emmet-vim'
Plug 'benekastah/neomake'
Plug 'tpope/vim-fugitive'
Plug 'jplaut/vim-arduino-ino'
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'sjl/gundo.vim'
Plug 'SirVer/ultisnips'
Plug 'jiangmiao/auto-pairs'
Plug 'calendar.vim'
Plug 'junegunn/vim-easy-align'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tpope/vim-markdown'
Plug 'nelstrom/vim-markdown-folding'
Plug 'tpope/vim-repeat'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-speeddating'
Plug 'jmcantrell/vim-journal'
Plug 'ervandew/supertab'
Plug 'justinmk/vim-sneak'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-expand-region'
Plug 'zaiste/tmux.vim'
Plug 'scrooloose/nerdtree' , { 'on': 'NERDTreeToggle' }
Plug 'marijnh/tern_for_vim'
Plug 'heavenshell/vim-jsdoc'
Plug 'vim-scripts/SyntaxAttr.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-oblique'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --gocode-completer' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'gregsexton/MatchTag'
Plug 'JulesWang/css.vim'
Plug 'vim-scripts/a.vim'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-abolish'
Plug 'rdolgushin/gitignore.vim'
Plug 'leafgarland/typescript-vim'
Plug 'vim-scripts/lh-vim-lib'
Plug 'airblade/vim-rooter'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/CmdlineComplete'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'rhysd/vim-clang-format'
Plug 'drmikehenry/vim-headerguard'
Plug 'vim-utils/vim-man'
Plug 'artoj/qmake-syntax-vim'
Plug 'sunaku/vim-dasht'
Plug 'peterhoeg/vim-qml'
Plug 'junegunn/gv.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'mxw/vim-jsx'
Plug 'kassio/neoterm'

let g:plugin_dir = '~/.nvim/bundle/'
Plug g:plugin_dir . 'simple-org-mode'
Plug g:plugin_dir . 'syntax-highlight-html-code'

call plug#end()
filetype plugin indent on

" }}}
" Basic Options {{{

" Automatically break newly inserted lines at 78 characters
set textwidth=78
" Wrap lines that are too wide for the current window
set wrap
" Shift wrapped lines by 4 characters
set breakindent
set breakindentopt=shift:4
" Wrap long lines at a character in 'breakat' rather than the last character
" that fits on the screen. Only affects the way the file is displayed, not its
" contents.
set linebreak
" Copy indent from current line to new line
set autoindent
" Enables automatic C program indenting
set cindent
" Allow buffers to be put in the 'background' without saving them
set hidden
"Turn on status line
set laststatus=2
"Allow backspacing over everything in insert mode
set backspace=indent,eol,start
"Store lots of :cmdline history
set history=10000
"Show incomplete cmds down the bottom
set showcmd
"Don't show current mode down the bottom, airline does this better
set noshowmode
"Display tabs and trailing spaces
set list " Messes up line break, but shows list chars
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅,extends:,precedes:
" Configuring backup and related
set backup
set noswapfile
set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
" Make directory folders
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
" No redraws in macros
set lazyredraw
" Turn off parentheses matching, its driving me crazy
let loaded_matchparen = 1
" Toggle from relative numbering to regular numbering in normal/insert
set relativenumber
autocmd InsertEnter * set norelativenumber number
autocmd InsertLeave * set relativenumber
" Fixing Delays?
set ttimeoutlen=10
set timeoutlen=300
"Autocomplete matches in the command line
set wildmenu
" Better tab completion in the command line
set wildmode=longest,list,full
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
" Make test_name auto completable
set iskeyword+=\_
" Don't highlight really long lines
set synmaxcol=500
" Use gui colors in the terminal
set termguicolors
let g:terminal_scrollback_buffer_size = 100000
" Prefer splits to open below and on the right
set splitbelow
set splitright
" From justinmk's vimrc
" Tell vimball to get lost
let g:loaded_vimballPlugin = 1
let g:loaded_rrhelper = 1
let g:did_install_default_menus = 1 " avoid stupid menu.vim (saves ~100ms)

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

syntax on

let g:sustain#code#brightness = 5
let g:sustain#code#contrast = 1
let g:sustain#ui#brightness = 5
let g:sustain#ui#contrast = 2

let g:sustain#link_colors = 1

let g:sustain#custom_colors_file = "~/.nvim/sustain_settings.txt"

" Highlight current line
set cursorline

colorscheme sustain

" }}}
" Should Be Built In -------------------------------------------------- {{{

function! GetVisualSelection()
    " from xolox @
    " http://stackoverflow.com/questions/1533565/how-to-get-visually-selected-text-in-vimscript
    let [lnum1, col1] = getpos("'<")[1:2]
    let [lnum2, col2] = getpos("'>")[1:2]
    let lines = getline(lnum1, lnum2)
    let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][col1 - 1:]
    return join(lines, "\n")
endfunction

function! GetCurrentBufferVar(var)
    return getbufvar(bufnr(bufname("%")), a:var)
endfunction

function! HexToCTerm()
    let l:hex_color = '"' . expand('<cword>') . '"'
    let l:result = system("python colors/colortrans.py " . l:hex_color)
    let l:result = split(l:result, ' ')[6]
    call feedkeys("cw")
    call feedkeys(l:result)
    call feedkeys("\<Esc>")
endfunction

" End Should Be Built In ---------------------------------------------- }}}
" Dvorak -------------------------------------------------- {{{

" Map dvorak keys everywhere with noremap explicitly
" noremap as opposed to nnoremap maps a command in every mode
noremap <silent> <expr> h (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> t (v:count == 0 ? 'gk' : 'k')
noremap d <Left>
noremap n <Right>

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
noremap l n
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
autocmd BufReadPost quickfix nnoremap <buffer> <C-N> <Down>
autocmd BufReadPost quickfix nnoremap <buffer> <C-T> <Up>
" Get to the shell faster
if has("nvim")
    nnoremap S :Term<Space>
    nnoremap <C-s> :TermStayOpen<Space>
else
    nnoremap S :!<Space>
endif
" Make <C-P> behave like it should and also zsh like
cnoremap <C-P> <Up>
cnoremap <C-T> <Up>
" Easier uppercase (ycm bricks <C-u>)
inoremap <C-l> <ESC>mzgUiw`zi<Right>
" Faster save
nnoremap sa :w<CR>
" Faster window switching
function! SmartSwitchWindow()
    let l:switch_command = ':winc w'
    let l:skip_buftypes = ['quickfix']
    exe l:switch_command
    while(index(l:skip_buftypes, &buftype) != -1)
        exe l:switch_command
    endwhile
endfunction
nnoremap <silent> ss :call SmartSwitchWindow()<CR>
nnoremap <silent> sx :call SmartBufferDelete()<CR>
function! SmartBufferDelete()
    " If the buffer is of the following filetypes close it and exit function
    let l:quick_close_ft_array = ['git', 'org', 'gitcommit']
    if index(l:quick_close_ft_array, &filetype) > -1
        exe "bd"
        return
    endif

    " There are some buffer types that I want to close no matter what
    " window I am in
    let l:buftype_close_keywords = ['nofile', 'quickfix', 'help']
    let l:max_buffers_open = 20
    for i in range(max_buffers_open)
        if index(l:buftype_close_keywords, getbufvar(i, "&buftype")) > -1
            exe "bd " . i
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
        exe ":q"
    " If there is only window open, close the current window
    elseif l:windows_open == 1
        exe ":bd"
    " If one file is open but split between windows
    elseif l:windows_open > 1 && l:buffers_open == 1
        exe "winc q"
    " If there are only two windows (splits) open and two buffers close the current buffer
    elseif l:buffers_open == 2 && l:windows_open == 2
        exe ":bd"
    " If there is a split window and more than two buffers, keep the split there just
    " close the current file and put another file in that split
    elseif l:buffers_open > 2 && l:windows_open >= 2
        exe ":b#|bd#"
    endif
endfunction
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
" Easier system copy and paste
xmap <Leader>y "+y
xmap <Leader>k "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
xmap <Leader>p "+p
xmap <Leader>P "+P
" Make y jump to the end of the selection
xnoremap <silent> y y`]
xnoremap <silent> p p`]
nnoremap <silent> p p`]
" Go to tag
nnoremap gt <C-]>
" Go to previous buffer
nnoremap gp <C-^>
nnoremap <S-tab> :bp<CR>
" Use full width of the screen
function! NoDistractions()
    :set nornu
    :set nonu
    :set nolist
    :silent AirlineToggleWhitespace
endfunction
command! Nd :silent call NoDistractions()
" Exit
nnoremap X :qall<CR>
" navigate quickfix / location list
" Macros can still be used, just not the ones below
nnoremap qq :cfirst<CR>
nnoremap qh :cnext<CR>
nnoremap qt :cprevious<CR>
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
    let l:voice = "ava"
    let l:text = ""
    if a:input == "line"
        let l:text = getline(line("."))
    elseif a:input == "selection"
        let l:text = GetVisualSelection()
    elseif a:input == "buffer"
        let l:end = search("^$") - 1
        let l:text = join(getline(1, end), " ")
    else
        let l:text = a:input
    endif

    call jobstart('say -v ' . l:voice . ' ' . shellescape(l:text), {})
    return
endfunction

function! StopSpeakText()
    call system("killall say")
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

" Leader Mappings -------------------------------------------------- {{{

" Map leader key to space
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"
" <Space> w to save a file
nnoremap <Leader>w :w<CR>
"<Space> s to source VIMRC
" A Complete source sources the current vimrc and resets the filetype to the
" current filetype
if(!exists("*AbsoluteSource"))
    function! AbsoluteSource()
        let l:vimrc = $MYVIMRC
        exe "source " . l:vimrc
        let l:ft = GetCurrentBufferVar('&filetype')
        exe "set ft=" . l:ft
    endfunction
    command! AbsoluteSource call AbsoluteSource()
endif
nnoremap <Leader>s :AbsoluteSource<CR>

" Reset colors
nnoremap <Leader>c :colorscheme sustain<CR>

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

function! ToggleVerbose()
    if !&verbose
        echo "Turning on logging"
        set verbosefile=~/.nvim/verbose.log
        set verbose=15
    else
        echo "Turning off logging"
        set verbose=0
        set verbosefile=
    endif
endfunction
nnoremap <silent> <Leader>l :call ToggleVerbose()<CR>
nnoremap <silent> <Leader>L :e ~/.nvim/verbose.log<CR>

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

" Functions for making the term more customizable

" Close a :term when the process is complete
let g:TermAutoExit = {}
function! TermAutoExit.on_exit(id, code)
    " If the command fails, i.e. the exit code is not zero don't close the buffer
    if (a:code == 0)
        " exe 'bd!' self.bufid
        " echo self.exit_message
        " call feedkeys("\<CR>")
    endif
endfunction

let s:true = 1
let s:false = 0

function! StartTermAutoExit(command, exit_message, open_new_buffer)
    if a:open_new_buffer
        exe "10sp | enew"
    else
        exe "enew"
        exe "winc r"
    endif
    let auto_exit_dict = extend(copy(g:TermAutoExit), {'bufid': bufnr("%"), 'exit_message': a:exit_message})
    call termopen(a:command, auto_exit_dict)

    if !a:open_new_buffer
        exe "startinsert"
    endif
endfunction


function! TermSameBuf(command)
    call StartTermAutoExit(a:command, "", s:false)
endfunction

function! Term(command)
    exe StartTermAutoExit(a:command, a:command . " completed cleanly!", s:true)
endfunction

function! TermStayOpen(command)
    " Open term in a split
    silent exe "10sp | enew"
    " Commands are split for TermClose feedkeys compatability
    silent exe "te " . a:command
endfunction

function! BackgroundTerm(command)
    call jobstart(a:command)
endfunction

command! -bar -nargs=* Term :call Term(<q-args>)
command! -bar -nargs=* TermSameBuf :call TermSameBuf(<q-args>)
command! -bar -nargs=* TermStayOpen :call TermStayOpen(<q-args>)
command! -bar -nargs=* BackgroundTerm :call BackgroundTerm(<q-args>)

" Don't show term process exited
au TermClose * exe expand('<abuf>') . 'bd!'

" Enable custom vim commands in any directory
function! SourceDirectory()
    let vim_dir_file = ".lvimrc"
    let vim_parent_file = '../' . vim_dir_file
    if filereadable(vim_dir_file)
        exe ":source " . vim_dir_file
    endif
    if filereadable(vim_parent_file)
        exe ":source " . vim_parent_file
    endif
endfunction

function! AsyncCTags()
    let l:ctags_command = "ctags -R"
    let l:ctags_job_id = jobstart(l:ctags_command, {"on_exit": function('AsyncCTagsComplete')})
endfunction

function! AsyncCTagsComplete()
    echo "Tags generated successfully!"
endfunction

function! NumActiveWindows(max)
    let l:buffers = split(execute("ls!"), '\n')
    let l:windows_active = []
    for buf in l:buffers
        " We are looking for an 'a' in the first part of the string which
        " indicates that that buffer is active (visible)
        let l:match_pos = match(buf, 'a.*"')
        if l:match_pos < 9 && l:match_pos != -1
            call insert(l:windows_active, buf)
            if len(l:windows_active) > a:max
                return -1
            endif
        endif
    endfor
    return len(windows_active)
endfunction

function! DynamicallyChangeLayout()
    " If there are two windows open side by side and the whole term gets
    " smaller make two horizontal windows and vice versa

    " For this to work there needs to be exactly two open windows
    if NumActiveWindows(2) != 2
        return
    endif

    let l:full_height = 33
    let l:full_width = 173
    let l:term_height = system("echo $LINES")
    let l:term_width = system("echo $COLUMNS")

    " Go to the first window, either the window on the top or the left
    let l:current_win = winnr()
    exe "1winc w"

    if abs(winwidth(1) + winwidth(2)) > l:term_width
        " There are two horizontal splits open one on top of the other
        if abs(l:full_width - l:term_width) < 20
            " The window is open fully, we can turn this into two vertical
            " splits
            exe "winc H"
        endif
    else
        " There are two vertical splits open next to each other
        if abs((l:full_width / 2) - l:term_width) < 10
            " The window is half width
            " Change the two vertically split windows to horizontal splits
            exe "winc K"

            " Make the bottom split a little bit smaller than the top
            exe "2winc w"
            exe "res 12"
            exe "1winc w"
        endif
    endif

    " Return to the previous window
    exe l:current_win . "winc w"
endfunction

autocmd VimResized * :call DynamicallyChangeLayout()

nnoremap <silent> s. :call SyntaxAttr()<CR>

function! FixTrailingWhitespace()
    let l:save_pos = winsaveview()
    exe '%s:\s\+$::e'
    call winrestview(l:save_pos)
endfunction

command! FixTrailingWhitespace call FixTrailingWhitespace()

" }}}
" Searching and Movement {{{

"Find the next match as we type the search
set incsearch
"Highlight searches by default
" set hlsearch
set smartcase
set ignorecase
set showmatch
set gdefault
set infercase
" Turn off highlighting when it is not needed
nnoremap <CR> :noh<CR>

" }}}
" Quick Editing  ------------------------------------------------- {{{

nnoremap <Leader>ev :e ~/.nvim/nvimrc<CR>
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
    let fold_line_len = 75
    let fold_marker_start = " {{{"
    let fold_marker_end = " }}}"
    let current_line = line(".")
    let current_line_content = getline(".")
    " Number of spaces before the first non whitespace character
    let current_line_indent = match(current_line_content, '\S')

    if &ts != 0
        let indent_number = current_line_indent / &ts
    else
        let indent_number = 0
    endif

    let comment_string = &commentstring
    let last_fold_name = "End " . a:fold_name

    " Account for space after comment
    let comment_len = len(substitute(comment_string, "%s", "", "")) + 1
    let name_len = len(a:fold_name)

    " Create First Line
    let first_line_repeat = fold_line_len - len(a:fold_name) - comment_len - 1 - len(fold_marker_start) - current_line_indent
    let first_line_content = " " . a:fold_name . " " . repeat("-", first_line_repeat) . fold_marker_start
    let first_line = substitute(comment_string, "%s", first_line_content, "")
    " Add indent spaces
    let first_line = repeat(" ", current_line_indent) . first_line

    " Create Last Line
    let last_line_repeat = fold_line_len - len(last_fold_name) - comment_len - 1 - len(fold_marker_end) - current_line_indent
    let last_line_content = " " . last_fold_name . " " . repeat("-", last_line_repeat) . fold_marker_end
    let last_line = substitute(comment_string, "%s", last_line_content, "")
    " Add indent spaces
    let last_line = repeat(" ", current_line_indent) . last_line

    " Add the fold
    let complete_create_fold = [first_line, "", "", "", last_line]
    call append(current_line, complete_create_fold)

    " Move to the middle
    exe "normal! jjj"

    " Tab in to current indent level
    exe "startinsert"
    for x in range(indent_number)
        call feedkeys("\<Tab>")
    endfor
    call feedkeys("\<Esc>")

endfunction

function! CreateFoldSection(fold_name)
    set nofoldenable
    " Save selection into the z register
    execute ":'<,'>delete z"
    exe "normal! k"
    call CreateFold(a:fold_name)
    " Clean up some weirdness here
    exe "normal! ddk"
    execute "put z"
    set foldenable
endfunction

command! -nargs=1 CreateFold call CreateFold(<f-args>)
nnoremap <Leader>f :CreateFold<Space>
command! -range -nargs=1 CreateFoldSection call CreateFoldSection(<f-args>)
xnoremap <Leader>f :CreateFoldSection<Space>

" NeatFoldText -------------------------------------------------- {{{

function! NeatFoldText()
    " If this function is slow scrolling will be painfully slow
    let line = getline(v:foldstart)
    let win_width = winwidth(0)
    let lines_count = v:foldend - v:foldstart + 1 - 4
    " Separator character between start and end
    " This character slows iterm2 a lot!
    " let foldchar = "─"
    " This character is close but does not slow down iterm2
    let foldchar = "―"

    " Remove comments, foldmarkers and dashes from the foldstart line
    let fold_text_removal_array = []
    call extend(fold_text_removal_array, split(escape(&commentstring, "*"), "%s"))
    call extend(fold_text_removal_array, split(&foldmarker, ","))
    call add(fold_text_removal_array, "-")
    for x in range(len(fold_text_removal_array))
        let line = substitute(line, fold_text_removal_array[x], '', 'g')
    endfor

    let foldtextstart = line

    let lines_count_text = printf("  %s line%s ", lines_count > 0 ? lines_count : 0, lines_count != 1 ? "s" : "")
    let foldtextend = lines_count_text

    let foldtextlength = strlen(foldtextstart) + &foldcolumn
    return foldtextstart . repeat(foldchar, win_width - foldtextlength - 17) . foldtextend . "    "
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
        execute ":w | silent YcmDiags"
    else
        :w
    endif
    if IsQuickWindowOpen() > 0
        " Compilation failed, handle appropriately
        echoerr "Compilation failed! See loc list for errors"
        execute 'sleep 2 | call feedkeys("\<CR>")'
        return
    endif
    let l:filename = expand("%:r")
    execute ":silent ! make f=" . l:filename
endfunction

function! NoWarnMake()
    execute ":silent ! make no_warn f=" . expand("%:r")
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
    let l:lldb_command = "make lldb f=" . l:filename
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
    elseif(a:option == "lldb")
        let l:run_command = l:lldb_command
        set norelativenumber
    endif
    if has("nvim") && !(index(["gdv", "gdh", "gds"], a:option) >= 0)
        if(a:option == "gdb")
            " Do Nothing, gdb tui works best with fullscreen
        elseif(a:option == "lldb" && (winwidth(0) > 90))
            execute "vs"
            execute "winc r"
        else
            execute ":10sp"
        endif
        if (index(["lldb", "gdb"], a:option) >= 0)
            execute ":TermSameBuf " . l:run_command
        else
            execute ":term " . l:run_command
        endif
    else
        execute ":! " . l:run_command
    endif
    set norelativenumber
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

function! RunWithInput(input)
    let l:filename = expand("%:r")
    let l:directory = ""
    let l:split_filename = split(l:filename, "/")
    if len(l:split_filename) > 1
        let l:directory = join(l:split_filename[:-2], "/") . "/"
    endif
    let l:input_file = l:directory . a:input
    let l:run_command = "./" . l:filename . " < " . l:input_file
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

au FileType cpp syn match Special /*\s\|+\s\|-\s\|\/\s\|%\s/
au FileType cpp syn match Operator /=/
au FileType cpp syn match Exception />\|</
au FileType cpp syn match Emphasize /==/
" Make pointers and references stand out
au FileType cpp syn match Emphasize /\*/
au FileType cpp syn match Emphasize /&/
au FileType cpp syn match Identifier /\w\+::/me=e-2
au FileType cpp setlocal commentstring=/*%s*/

function! CppMan()
    exe "Sman std::" . expand("<cword>")
    exe "res 10"
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

function! VSGitCommit()
    call DynamicallyChangeLayout()
endfunction

au FileType gitcommit setlocal spell
au FileType gitcommit call VSGitCommit()

function! SpeakCommit()
    " Mark the current position
    exe "normal! mp"
    let l:commit_text_end = search('\n# ') - 1
    let l:text = join(getline(1, l:commit_text_end), " ")
    call SpeakText(l:text)
    exe "normal 'p"
endfunction

au FileType gitcommit nnoremap <silent> st :call SpeakCommit()<CR>

" }}}
" Html -------------------------------------------------- {{{

" Let html comments have fold markers and whatever else
let html_wrong_comments = 1
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

augroup END

function! ReloadChrome()
    exe ":w"
    silent execute ":! chrome_reload"
endfunction

au FileType html,css nnoremap <Leader>r :silent call ReloadChrome()<CR>

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
    " Force matches in javascript, my solution to add syntax highlights to ES6
    " and jsx while still allowing rainbow parentheses
    " These regexes are admitally weird see zero-width for regex help
    " regex matches whats before it up to the = sign
    " <NotHere this={not.this} />
    au FileType javascript :call matchadd('Keyword', '\w\+\(=\)\@=')
    " Match word( to add function highlight
    " thisFunctionName()
    au FileType javascript :call matchadd('Function', '\w\+\((\)\@=')
    " thisFunctionName()
    au FileType javascript :call matchadd('Statement', '\(if\|return\)\((\)\@=')
    " <This notThis={test}>
    au FileType javascript :call matchadd('Type', '\(<\)\@<=\w\+\s')
    " </This>
    au FileType javascript :call matchadd('Type', '\(</\)\@<=\w\+')
    " <This
    "   notThis={thing}
    au FileType javascript :call matchadd('Type', '\(<\)\@<=\w\+$')
    " <This>
    au FileType javascript :call matchadd('Type', '\(<\)\@<=\w\+\(>\)\@=')

    " Add indent settings for jsx
    " Relevant indent settings
    " autoindent: take indent for new line from previous line
    " cindent: do C program indenting (I think the problem is here)
    " au FileType javascript setlocal nocindent
    " cinkeys
    " cinoptions
    " cinwords
    " indentexpr: expression used to optain the indent of a line
    " indent keys: keys that trigger indenting with 'indentexpr'
    " smartindent: smart autoindenting for c programs
    au FileType javascript setlocal nosmartindent
    " docuMentation
    " au FileType javascript nnoremap <buffer> gm :JsDoc<CR>
    " Have tern and Ycm play nicely together
    " au FileType javascript setlocal omnifunc=tern#Complete
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
    call MakeDirsForNewFile(filename)

    if winwidth(0) > 90
        exe "vs"
    else
        exe "10sp"
    endif
    execute ":e " . filename
    return
endfunction

function! MakeDirsForNewFile(filename)
    try
        let l:dir = join(split(a:filename, "/")[0:-2], "/")
        call mkdir(l:dir, "p")
    endtry
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
    " Concise way to kill all indenting
    au FileType markdown setl noai nocin nosi inde=
augroup END

let g:markdown_fenced_languages = ['python', 'bash=sh', 'c', 'html', 'css', 'javascript', 'java', 'xml', 'cpp']

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
    au FileType python nnoremap <buffer> cp :call RunPython("normal")<CR>
    au FileType python nnoremap <buffer> cn :call RunPython("input")<CR>
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
" Typescript --------------------------------------------------------------- {{{

au FileType typescript setlocal makeprg=tsc
au FileType typescript nnoremap <buffer> sj :call ToggleTSComments()<CR>
au FileType typescript nnoremap <buffer> M :YcmCompleter GetDoc<CR>
au FileType typescript nnoremap <buffer> cp :Term gulp<CR>

" Allow toggling between jsx comments and typescript comments
function! ToggleTSComments()
    if &commentstring == "// %s"
        setlocal commentstring={/*\ %s\ */}
    elseif &commentstring == "{/*\ %s\ */}"
        setlocal commentstring=//\ %s
    endif
endfunction

" Run gulp command in the background while vim is running
let g:gulp_async_id = 0
function! StartAsyncGulp(command)
    if g:gulp_async_id == 0
        let g:gulp_async_id = jobstart(a:command)
        echo "Starting Async Command: " . a:command
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

" }}}
" CmdlineComplete ---------------------------------------------------------- {{{

cmap <C-N> <Plug>CmdlineCompleteForward
cmap <C-S> <Plug>CmdlineCompleteBackward

" End CmdlineComplete ------------------------------------------------------ }}}
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

function! RunOrUpdateGDiff()
    " clear cmd line
    echo ""
    exe "silent! bd *fugitive*"
    exe ":Gdiff"
    call feedkeys("ss")
    exe "normal! z."
endfunction

command! ToggleGStatus :call ToggleGStatus()
nnoremap <Leader>g :ToggleGStatus<CR>
nnoremap gs :ToggleGStatus<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap sd :call RunOrUpdateGDiff()<CR>
nnoremap cm :Gcommit<CR>
" Kill diff
nnoremap kd :bd fugitive*<CR>zAz.

" }}}
" FZF -------------------------------------------------- {{{

nnoremap go :GitFiles<CR>
nnoremap g. :Files<CR>

au TermOpen term://*fzf* tmap <buffer> <C-t> <Up>
au TermOpen term://*fzf* tmap <buffer> <Esc> <Esc>

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

function! FZF_should_run_bufopen()
    let l:current_buf_list = FZF_buflist()
    if len(l:current_buf_list) > 1
        call fzf#run({
        \ 'down': len(l:current_buf_list) + 2,
        \ 'source': reverse(l:current_buf_list),
        \ 'sink': function('FZF_bufopen'),
        \ 'options': '+m -1 -0'
        \ })
    elseif len(l:current_buf_list) == 1
        call FZF_bufopen(l:current_buf_list[0])
    else
        echo "Cannot switch buffers: There are no other active buffers!"
    endif
endfunction

nnoremap <silent> gu :call FZF_should_run_bufopen()<CR>

nnoremap gt :Tags<CR>

" fzf.vim Ag search
nnoremap g/ :Ag<CR>

command! H :Helptags
nnoremap g- :Helptags<CR>

" }}}
" GV (Git Log Viewer) -------------------------------------------------- {{{

nnoremap <silent> gl :GV<CR>
" Display patches properly
autocmd FileType git setlocal nofoldenable nolist

" End GV (Git Log Viewer) ---------------------------------------------- }}}
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
" Matchit -------------------------------------------------- {{{

runtime macros/matchit.vim

" }}}
" Neomake ------------------------------------------------------------------ {{{

" Only run neomake on the current file, basically syntax checking
autocmd! BufWritePost *.js,*.json Neomake
" Run neomake using makeprg in the cwd
autocmd! BufWritePost *.ts,*.tsx Neomake!

let g:neomake_list_height = 3
let g:neomake_open_list = 2
let g:neomake_error_sign = { 'text': "✗>", 'texthl': 'Error' }
let g:neomake_warning_sign = { 'text': "?>", 'texthl': 'Visual' }

let g:neomake_javascript_enabled_makers = ["eslint"]

" End Neomake -------------------------------------------------------------- }}}
" Neoterm -------------------------------------------------------------- {{{

let g:neoterm_size = 10
let g:neoterm_keep_open = 0
let g:neoterm_autoinsert = 1

" End Neoterm ---------------------------------------------------------- }}}
" Nerdtree -------------------------------------------------- {{{

nnoremap <C-b> :NERDTreeToggle<CR>

augroup nerdtree_fix
    autocmd!
    autocmd filetype nerdtree call Mod_NerdTree_Maps()
augroup end

function! Mod_NerdTree_Maps()
    nnoremap <buffer> h gj
    nnoremap <buffer> t gk
endfunction

" }}}
" Rainbow Parens ----------------------------------------------------------- {{{

let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}'], ['<', '>']]
let g:rainbow#include = [': ', ' ; ',  ', ', ' = ', ' \. ',  ', ', ' < ', ' > ', ' !', ' & ', ' | ', ' + ', ' - ', ' += ', ' -= ', ' >= ',  '<= ', ' \\ ', ';\n', '; ', '::', ' \* ', '++', '\.', '->', ' != ', ' == ', ',\_$', ' && ', ' || ', ' << ', ' >> ', ' != ', '-- ', ' \*= ', ' === ', ' !== ', ' ? ']

let g:rainbow#additional_regions = ['']

let g:rainbow#colors = {'dark': g:sustain#rainbow_parens, 'light': g:sustain#rainbow_parens}
let g:rainbow#ft_exclude = ["help", "gitcommit"]
function! InitRainbowParens()
    let l:current_buf_ft = GetCurrentBufferVar('&ft')
    if index(g:rainbow#ft_exclude, l:current_buf_ft) == -1
        exe "RainbowParentheses"
    else
        " Turn off Rainbow Parens
        exe "RainbowParentheses!"
    endif
endfunction
augroup rainbow_ft
    autocmd!
    autocmd FileType * call InitRainbowParens()
augroup END

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
" UltiSnips -------------------------------------------------- {{{

" UltiSnips Config
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsExpandTrigger="<C-s>"
" let g:UltiSnipsJumpForwardTrigger="<C-s>"

" Enable tabbing through list of results
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        " Execute ycm complete key
        " execute 'startinsert! | call feedkeys("\<C-o>")'
        " execute 'startinsert | call feedkeys("\<Right>\<C-o>")'
        if pumvisible()
            return "\<C-n>"
            " return ""
        else
            " execute 'startinsert! | call feedkeys("\<C-x>\<C-n>")'
            " if pumvisible()
            "     return ""
            " else
                call UltiSnips#JumpForwards()
                if g:ulti_jump_forwards_res == 0
                    return "\<Tab>"
                    " return ""
                endif
            " endif
        endif
    endif
    return ""
endfunction

au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<CR>"

" Expand snippet or return
let g:ulti_expand_res = 0
function! Ulti_ExpandOrEnter()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res
        return ''
    else
        return "\<return>"
    endif
endfunction

" Set <return> as primary trigger
inoremap <return> <C-r>=Ulti_ExpandOrEnter()<CR>

" }}}
" vim airline -------------------------------------------------- {{{

let g:airline_powerline_fonts=1
let g:airline_skip_empty_sections = 1
let g:airline_theme='relative'
let g:airline#extensions#tabline#enabled=1
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
" vim abolish -------------------------------------------------- {{{

" Abolish abbreviations are in ~/.nvim/after/plugins/abolish.vim

" }}}
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
let g:EasyMotion_keys = "HUTENOPGCRYFLBKJWQVZXIDSA"
let g:EasyMotion_use_upper = 1

" End vim easymotion ------------------------------------------------------- }}}
" vim easy align ------------------------------------------------------- {{{

nmap ga <Plug>(EasyAlign)

" End vim easy align --------------------------------------------------- }}}
" vim expand region -------------------------------------------------- {{{

xmap v <Plug>(expand_region_expand)
xmap <C-v> <Plug>(expand_region_shrink)

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

nnoremap <silent> sh :GitGutterStageHunk<CR>
nnoremap <silent> cn :call JumpToHunkAndUnfold("n")<CR>
nnoremap <silent> cp :call JumpToHunkAndUnfold("p")<CR>

let g:gitgutter_sign_removed = '-'
let g:gitgutter_max_signs = 5000

" }}}
" vim go -------------------------------------------------- {{{

let g:go_disable_autoinstall = 1

" }}}
" vim journal -------------------------------------------------- {{{

let g:journal_directory="~/.journal"
let g:journal_extension="md"

" }}}
" vim js doc -------------------------------------------------- {{{

" See javascript FileType commands

" }}}
" vim jsx ------------------------------------------------------------- {{{

let g:jsx_ext_required = 0

" End vim jsx --------------------------------------------------------- }}}
" vim markdown folding ----------------------------------------------- {{{

let g:markdown_fold_style = 'nested'
let g:markdown_fold_override_foldtext = 0

" }}}
" vim oblique  -------------------------------------------------- {{{

nmap l <Plug>(Oblique-n)
nmap L <Plug>(Oblique-N)

" Center cursor after search
autocmd! User Oblique normal! zz
autocmd! User ObliqueStar normal! zz
autocmd! User ObliqueRepeat normal! zz

hi! link ObliquePrompt Search

" }}}
" vim rooter --------------------------------------------------------------- {{{

let g:rooter_silent_chdir = 1

" End vim rooter ----------------------------------------------------------- }}}
" vim-sneak -------------------------------------------------- {{{

let g:sneak#streak = 1

noremap <C-E> :normal! e<CR>
map e <Plug>Sneak_s
map E <Plug>Sneak_S
map - <Plug>SneakNext
map _ <Plug>SneakPrevious
map u <Plug>Sneak_f
map U <Plug>Sneak_F
map j <Plug>Sneak_t
map J <Plug>Sneak_T

" }}}
" YouCompleteMe ------------------------------ {{{

let g:ycm_key_list_select_completion = [ '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = [ '<C-p>', '<Up>' ]
let g:SuperTabDefaultCompletionType = '<C-n>'

let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_use_ultisnips_completer = 0

let g:ycm_seed_identifiers_with_syntax = 1

" Opens automatic popup menu at 3 characters
let g:ycm_min_num_of_chars_for_completion = 3

" Preview window options
" let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

let g:ycm_open_loc_list_on_ycm_diags = 1

let g:ycm_error_symbol = "Er"
let g:ycm_warning_symbol = "Wn"

" }}}

" }}}
" Directory Specific Commands {{{

call SourceDirectory()

" }}}
" Fold Settings -------------------------------------------------- {{{
" vim:foldmethod=marker
" }}}