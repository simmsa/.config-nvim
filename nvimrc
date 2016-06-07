" .vimrc
" Author: Andrew Simms <andrew@andrewdsimms.com> <https://github.com/simmsa>
" vim plug --------------------------------------- {{{

" set nocompatible
filetype off
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
Plug 'godlygeek/tabular'
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
Plug 'scrooloose/nerdtree'
Plug 'pangloss/vim-javascript'
Plug 'marijnh/tern_for_vim'
Plug 'heavenshell/vim-jsdoc'
Plug 'chrisbra/Colorizer'
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
Plug '~/.nvim/bundle/simple-org-mode'
Plug 'airblade/vim-rooter'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/CmdlineComplete'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/rainbow_parentheses.vim'
call plug#end()
filetype plugin indent on

" }}}
" Basic Options {{{

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
set relativenumber
autocmd InsertEnter * set norelativenumber
autocmd InsertLeave * set relativenumber
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
set termguicolors
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
nnoremap ss :silent call SmartSwitchWindow()<CR>
nnoremap sx :call SmartBufferDelete()<CR>
function! SmartBufferDelete()
    " Clear the command line
    echo ""
    " If the buffer is of the following filetypes close it and exit function
    let l:quick_close_ft_array = ['git', 'org', 'gitcommit']
    if index(l:quick_close_ft_array, &filetype) > -1
        exe "bd"
        return
    endif

    " There are some buffer types that I want to close no matter what
    " window I am in
    let l:buftype_close_keywords = ['nofile', 'quickfix']
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
cnoremap : ;
" Mouse scroll in iterm2
set mouse=nicr
" Fix unwanted action in normal mode
nnoremap <C-f> :echo "Not in insert mode!"<CR>
" Read the file, useful for proofreading
command! Read  -range=% :! say -v ava -f %
xnoremap st "xy :call system('say -v ava '. shellescape(@x) .' &')<CR>
" Go to the next buffer
nnoremap <Tab> :bn<CR>
" Faster semicolon insert
" Note, <C-punctuation> mappings don't work due to term issues
inoremap <C-s> <End>;
" Navigate the quickfix list
nnoremap cc :cc<CR>

" Leader Mappings -------------------------------------------------- {{{

" Map leader key to space
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"
" <Space> w to save a file
nnoremap <Leader>w :w<CR>
"<Space> s to source VIMRC
nnoremap <Leader>s :so ~/.nvimrc<CR>
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

" Functions for making the term more customizable

" Close a :term when the process is complete
let g:TermAutoExit = {}
function! TermAutoExit.on_exit(id, code)
    " If the command fails, i.e. the exit code is not zero don't close the buffer
    if (a:code == 0)
        exe 'bd!' self.bufid
        echo self.exit_message
    endif
endfunction

function! StartTermAutoExit(command, exit_message)
    exe "10sp | enew"
    let auto_exit_dict = extend(copy(g:TermAutoExit), {'bufid': bufnr("%"), 'exit_message': a:exit_message})
    call termopen(a:command, auto_exit_dict)
endfunction

function! Term(command)
    " Open term in a split
    silent exe "10sp | enew"
    " Commands are split for TermClose feedkeys compatability
    silent exe "te " . a:command
endfunction

command! -bar -nargs=* Term :call Term(<q-args>)

" Don't show term process exited
au TermClose * call feedkeys('<cr>')

" Enable custom vim commands in any directory
function! SourceDirectory()
    let vim_dir_file = "vim_dir_commands.vim"
    if filereadable(vim_dir_file)
        exe "source " . vim_dir_file
    endif
endfunction

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
  let line = getline(v:foldstart)
  let fold_text_removal_array = []
  call extend(fold_text_removal_array, split(escape(&commentstring, "*"), "%s"))
  call extend(fold_text_removal_array, split(&foldmarker, ","))
  call add(fold_text_removal_array, "-")
  let commentless_line = line
  for x in range(len(fold_text_removal_array))
      let commentless_line = substitute(commentless_line, fold_text_removal_array[x], '', 'g')
  endfor
  let markdown_line = line
  let lines_count = v:foldend - v:foldstart + 1 - 4
  if lines_count != 1
      let lines_count_text = ' ' . printf("%s", lines_count . ' lines') . ' '
  else
      let lines_count_text = ' ' . printf("%s", lines_count . ' line') . ' '
  endif
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
    " Have tern and Ycm play nicely together
    au FileType javascript setlocal omnifunc=tern#Complete
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
" Typescript --------------------------------------------------------------- {{{

au FileType typescript setlocal makeprg=tsc
au FileType typescript nnoremap <buffer> sj :call ToggleTSComments()<CR>
au FileType typescript nnoremap <buffer> M :YcmCompleter GetDoc<CR>

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

" autocmd! BufEnter *.ts call StartAsyncGulp("gulp chrome-watch")
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
    call feedkeys("]c")
endfunction

command! ToggleGStatus :call ToggleGStatus()
nnoremap <Leader>g :ToggleGStatus<CR>
nnoremap gs :ToggleGStatus<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap sd :call RunOrUpdateGDiff()<CR>
nnoremap cm :Gcommit<CR>
nnoremap gl :Term tig<CR>

" }}}
" FZF -------------------------------------------------- {{{

nnoremap go :GitFiles<CR>

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
nnoremap ga :Ag<CR>

command! H :Helptags
nnoremap g- :Helptags<CR>

" }}}
" Git Gutter -------------------------------------------------- {{{

nnoremap sh :GitGutterStageHunk<CR>

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

" End Neomake -------------------------------------------------------------- }}}
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
" Rainbow Parens ----------------------------------------------------------- {{{

let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
let g:rainbow#include = [':', ';', ',', '=']

let g:rainbow#colors = {'dark': g:sustain_kien_rainbow_parens, 'light': g:sustain_kien_rainbow_parens}

augroup rainbow_ft
    autocmd!
    autocmd FileType vim,typescript RainbowParentheses
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
" vim easymotion ----------------------------------------------------------- {{{

" Disable easy motion mappings
let g:EasyMotion_do_mapping = 0
map H <Plug>(easymotion-bd-jk)
map T <Plug>(easymotion-jumptoanywhere)
let g:EasyMotion_keys = "HUTENOPGCRYFLBKJWQVZXIDSA"
let g:EasyMotion_use_upper = 1

" End vim easymotion ------------------------------------------------------- }}}
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

nnoremap cn :call JumpToHunkAndUnfold("n")<CR>
nnoremap cp :call JumpToHunkAndUnfold("p")<CR>

let g:gitgutter_sign_removed = '-'

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

let g:ycm_key_list_select_completion = [ '<C-n>', '<Down>' , '<Enter>']
let g:ycm_key_list_previous_completion = [ '<C-p>', '<Up>' ]
let g:SuperTabDefaultCompletionType = '<C-n>'

" let g:ycm_key_invoke_completion = '<C-o>'

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

" }}}

" }}}
" Directory Specific Commands {{{

call SourceDirectory()

" }}}
" Fold Settings -------------------------------------------------- {{{
" vim:foldmethod=marker:foldlevel=0 }}}
