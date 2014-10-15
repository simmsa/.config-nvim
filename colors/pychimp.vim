" Vim colorscheme -- PyChimp
"
" Crated specifically for Python coding ! (For other languages, I do suggest that
" you find other colorschemes, there are loads !)
"
" Author: Pratheek <pratheek.i@gmail.com>
"
" Note: This theme uses ideas from Python IDLE, (and has some similarities) from Molokai theme
" created by Thomas Restrepo
" <http://www.vim.org/scripts/script.php?script_id=2340>
"
" This colorscheme is specifically created, to work in a translucent
" background provided by terminal and supports 256 color terminals
"
" Tip -- add <t_Co=256> in your ~/.vimrc to utilize the theme well.
"
" Thats it ! Hope you like it ! :)

let g:colors_name = "pychimp"

" The Basic (Normal) Text Style

hi Normal      ctermfg=253  ctermbg=NONE  cterm=NONE

" All the Python related stuff

hi Todo        ctermfg=253  ctermbg=NONE  cterm=bold
hi String      ctermfg=221  ctermbg=NONE  cterm=NONE
hi Operator    ctermfg=208  ctermbg=NONE  cterm=bold
hi Statement   ctermfg=208  ctermbg=NONE  cterm=bold
hi Comment     ctermfg=203  ctermbg=NONE      cterm=NONE
hi Constant    ctermfg=178  ctermbg=NONE  cterm=bold
hi Character   ctermfg=123  ctermbg=NONE  cterm=NONE
hi Error       ctermfg=88   ctermbg=172   cterm=bold
hi PreProc     ctermfg=81   ctermbg=NONE  cterm=NONE
hi Special     ctermfg=81   ctermbg=NONE  cterm=NONE
hi Boolean     ctermfg=38   ctermbg=NONE  cterm=bold
hi Function    ctermfg=35   ctermbg=NONE  cterm=NONE
hi Conditional ctermfg=33  ctermbg=NONE  cterm=NONE
hi Include     ctermfg=24  ctermbg=NONE  cterm=bold
hi Float       ctermfg=4  ctermbg=NONE  cterm=NONE
hi Number      ctermfg=4  ctermbg=NONE  cterm=NONE

"Vim Stuff

hi IncSearch   ctermfg=253  ctermbg=66    cterm=NONE
hi Search      ctermfg=253  ctermbg=66    cterm=NONE
hi Visual      ctermfg=253  ctermbg=235   cterm=NONE
hi VertSplit   ctermfg=8  ctermbg=NONE   cterm=NONE
hi PmenuSel    ctermfg=202  ctermbg=16    cterm=NONE
hi ErrorMsg    ctermfg=88   ctermbg=172   cterm=bold
hi PmenuThumb  ctermfg=81   ctermbg=16    cterm=NONE
hi PmenuSbar   ctermfg=81   ctermbg=16    cterm=NONE
hi Pmenu       ctermfg=81   ctermbg=16    cterm=NONE
hi LineNr      ctermfg=73   ctermbg=NONE  cterm=NONE
hi NonText     ctermfg=25   ctermbg=NONE  cterm=NONE
hi TabLineFill ctermfg=46   ctermbg=NONE  cterm=NONE
hi MatchParen  ctermfg=16   ctermbg=215   cterm=bold
hi TabLineSel  ctermfg=14   ctermbg=NONE  cterm=bold
hi FoldColumn  ctermfg=9   ctermbg=255    cterm=NONE
hi Folded      ctermfg=50   ctermbg=8    cterm=NONE
hi TabLine     ctermfg=3    ctermbg=NONE  cterm=NONE

" I added this shizzle
hi CursorLine  ctermfg=NONE   ctermbg=8    cterm=NONE

" For Python
hi pythonColon ctermfg=5 ctermbg=NONE cterm=NONE

" For Django
hi djangoTagStart   ctermfg=45  ctermbg=NONE cterm=NONE
hi djangoTagEnd   ctermfg=45  ctermbg=NONE cterm=NONE
hi djangoVarStart  ctermfg=48  ctermbg=NONE  cterm=NONE
hi djangoVarEnd  ctermfg=48  ctermbg=NONE  cterm=NONE

" Fixing html red
hi htmlLink ctermfg=253   ctermbg=NONE   cterm=NONE
hi htmlH1 ctermfg=196  ctermbg=NONE   cterm=NONE
hi htmlH2 ctermfg=197  ctermbg=NONE   cterm=NONE
hi htmlH3 ctermfg=198  ctermbg=NONE   cterm=NONE
hi htmlH4 ctermfg=199  ctermbg=NONE   cterm=NONE
hi htmlH5 ctermfg=200  ctermbg=NONE   cterm=NONE
hi htmlH6 ctermfg=201  ctermbg=NONE   cterm=NONE

" Fugitive Syntax
" White on green
hi DiffAdd ctermfg=255 ctermbg=2 cterm=NONE
" White on orange
hi DiffChange ctermfg=255 ctermbg=166 cterm=NONE
" White on red
hi DiffDelete ctermfg=255 ctermbg=88 cterm=NONE
" White on darker orange, slightly darker than DiffChange
hi DiffText ctermfg=255 ctermbg=9 cterm=NONE

" End of Colour scheme ! (Pretty small !:) )
" Will add support for more languages eventually. !
