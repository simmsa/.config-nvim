" Vim colorscheme -- PyChimp
"
" Created specifically for Python coding ! (For other languages, I do suggest that
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

hi Normal      ctermfg=255  ctermbg=NONE  cterm=NONE

" All the Python related stuff

hi Number      ctermfg=4   ctermbg=NONE  cterm=NONE | "Blue
hi Float       ctermfg=6   ctermbg=NONE  cterm=NONE | "Lighter Blue
hi Include     ctermfg=24  ctermbg=NONE  cterm=bold | "Steelblue
hi Conditional ctermfg=33  ctermbg=NONE  cterm=NONE | "Lighter Steelblue
hi Function    ctermfg=35  ctermbg=NONE  cterm=italic | "Seafoam Green
hi Boolean     ctermfg=38  ctermbg=NONE  cterm=bold | "Steelblue
hi Type        ctermfg=43  ctermbg=NONE  cterm=italic | "Teal
hi Special     ctermfg=81  ctermbg=NONE  cterm=NONE | "Light Blue
hi PreProc     ctermfg=85  ctermbg=NONE  cterm=NONE | "Sea Green 'NONE'
hi Error       ctermfg=88  ctermbg=172   cterm=bold | "Red
hi Character   ctermfg=123 ctermbg=NONE  cterm=NONE | "Light Blue
hi Todo        ctermfg=162 ctermbg=NONE  cterm=bold | "Magenta
hi Constant    ctermfg=178 ctermbg=NONE  cterm=bold | "Yellow
hi Comment     ctermfg=203 ctermbg=NONE  cterm=NONE | "Salmon
hi Operator    ctermfg=208 ctermbg=NONE  cterm=bold | "Orange
hi Statement   ctermfg=13 ctermbg=NONE  cterm=bold | "Purple
hi String      ctermfg=221 ctermbg=NONE  cterm=NONE | "Light Yellow

"Vim Stuff

hi TabLine     ctermfg=3    ctermbg=NONE  cterm=NONE
hi VertSplit   ctermfg=8    ctermbg=NONE  cterm=NONE
hi TabLineSel  ctermfg=14   ctermbg=NONE  cterm=bold
hi MatchParen  ctermfg=46   ctermbg=215   cterm=bold
hi NonText     ctermfg=25   ctermbg=NONE  cterm=NONE
hi TabLineFill ctermfg=46   ctermbg=NONE  cterm=NONE
hi FoldColumn  ctermfg=50    ctermbg=NONE   cterm=NONE
hi Folded      ctermfg=50   ctermbg=8     cterm=NONE
hi Search      ctermfg=190   ctermbg=233    cterm=NONE | " Search complete
hi LineNr      ctermfg=73   ctermbg=NONE  cterm=NONE
hi PmenuThumb  ctermfg=81   ctermbg=16    cterm=NONE
hi PmenuSbar   ctermfg=81   ctermbg=16    cterm=NONE
hi Pmenu       ctermfg=81   ctermbg=16    cterm=NONE
hi ErrorMsg    ctermfg=88   ctermbg=172   cterm=bold
hi PmenuSel    ctermfg=202  ctermbg=16    cterm=NONE
hi IncSearch   ctermfg=233  ctermbg=190    cterm=NONE | " When typing
hi Visual      ctermfg=NONE ctermbg=8     cterm=italic | " Visual Selection

" I added this shizzle
hi CursorLine  ctermfg=NONE   ctermbg=8    cterm=NONE
hi CursorLineNR ctermfg=196 ctermbg=8 cterm=underline

" For Python
hi pythonColon ctermfg=5 ctermbg=NONE cterm=NONE

" For Django
hi djangoTagStart ctermfg=45  ctermbg=NONE  cterm=NONE
hi djangoTagEnd   ctermfg=45  ctermbg=NONE  cterm=NONE
hi djangoVarStart ctermfg=48  ctermbg=NONE  cterm=NONE
hi djangoVarEnd   ctermfg=48  ctermbg=NONE  cterm=NONE

" Fixing html red
hi htmlLink ctermfg=253 ctermbg=NONE  cterm=NONE
hi htmlH1 ctermfg=196   ctermbg=NONE  cterm=NONE
hi htmlH2 ctermfg=197   ctermbg=NONE  cterm=NONE
hi htmlH3 ctermfg=198   ctermbg=NONE  cterm=NONE
hi htmlH4 ctermfg=199   ctermbg=NONE  cterm=NONE
hi htmlH5 ctermfg=200   ctermbg=NONE  cterm=NONE
hi htmlH6 ctermfg=201   ctermbg=NONE  cterm=NONE

" Fugitive Syntax
" White on green
hi DiffAdd ctermfg=255 ctermbg=2 cterm=NONE
" White on orange
hi DiffChange ctermfg=255 ctermbg=166 cterm=NONE
" White on red
hi DiffDelete ctermfg=255 ctermbg=88 cterm=NONE
" White on darker orange, slightly darker than DiffChange
hi DiffText ctermfg=255 ctermbg=9 cterm=NONE

" Org Mode
hi org_1_header ctermfg=14 ctermbg=NONE cterm=NONE
hi org_1_line ctermfg=190 ctermbg=NONE cterm=NONE
hi org_2_header ctermfg=4 ctermbg=NONE cterm=NONE
hi org_3_header ctermfg=21 ctermbg=NONE cterm=NONE
hi org_4_header ctermfg=19 ctermbg=NONE cterm=NONE
hi org_5_header ctermfg=17 ctermbg=NONE cterm=NONE
hi org_todo ctermfg=196 ctermbg=NONE cterm=NONE
hi org_1_todo ctermfg=196 ctermbg=NONE cterm=NONE
hi org_underway ctermfg=226 ctermbg=NONE cterm=NONE
hi org_1_underway ctermfg=226 ctermbg=NONE cterm=NONE
hi org_done ctermfg=39 ctermbg=NONE cterm=NONE
hi org_1_done ctermfg=39 ctermbg=NONE cterm=NONE
hi org_time ctermfg=27 ctermbg=NONE cterm=NONE
hi org_time_1_header ctermfg=27 ctermbg=NONE cterm=NONE


" End of Colour scheme ! (Pretty small !:) )
" Will add support for more languages eventually. !
