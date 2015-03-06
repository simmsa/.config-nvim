" Vim colorscheme -- PyChimp
"
" Created specifically for Python coding ! (For other languages, I do
" suggest that you find other colorschemes, there are loads !)
"
" Author: Pratheek <pratheek.i@gmail.com>
"
" Note: This theme uses ideas from Python IDLE, (and has some
" similarities) from Molokai theme created by Thomas Restrepo
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
hi Function    ctermfg=35  ctermbg=NONE  cterm=NONE | "Seafoam Green
hi Boolean     ctermfg=38  ctermbg=NONE  cterm=bold | "Steelblue
hi Label       ctermfg=42  ctermbg=NONE  cterm=NONE | "Light Green
hi Type        ctermfg=43  ctermbg=NONE  cterm=NONE | "Teal
hi Statement   ctermfg=75  ctermbg=NONE  cterm=NONE | "Cerulean
hi Special     ctermfg=81  ctermbg=NONE  cterm=NONE | "Light Blue
hi PreProc     ctermfg=215 ctermbg=NONE  cterm=NONE | "Sea Green 'NONE'
hi Character   ctermfg=123 ctermbg=NONE  cterm=NONE | "Light Blue
hi Repeat      ctermfg=148 ctermbg=NONE  cterm=NONE | "Yellow
hi Todo        ctermfg=162 ctermbg=NONE  cterm=bold | "Magenta
hi Identifier  ctermfg=NONE ctermbg=NONE cterm=NONE | "Purple
hi Keyword     ctermfg=166 ctermbg=NONE  cterm=NONE | "Orange
hi Constant    ctermfg=178 ctermbg=NONE  cterm=bold | "Yellow
hi Error       ctermfg=196 ctermbg=NONE  cterm=bold | "Red
hi Comment     ctermfg=203 ctermbg=NONE  cterm=NONE | "Salmon
hi Exception   ctermfg=206 ctermbg=NONE  cterm=NONE | "Lavender
hi Operator    ctermfg=208 ctermbg=NONE  cterm=bold | "Orange
hi String      ctermfg=221 ctermbg=NONE  cterm=NONE | "Light Yellow

"Vim Specific
hi TabLine     ctermfg=3    ctermbg=NONE  cterm=NONE
hi VertSplit   ctermfg=8    ctermbg=NONE  cterm=NONE
hi NonText     ctermfg=8    ctermbg=NONE  cterm=NONE
hi SpecialKey  ctermfg=84   ctermbg=NONE  cterm=NONE
hi TabLineSel  ctermfg=23   ctermbg=NONE  cterm=bold
hi MatchParen  ctermfg=46   ctermbg=215   cterm=bold
hi TabLineFill ctermfg=46   ctermbg=NONE  cterm=NONE
hi FoldColumn  ctermfg=50   ctermbg=NONE  cterm=NONE
hi Folded      ctermfg=50   ctermbg=8     cterm=NONE
hi LineNr      ctermfg=24   ctermbg=NONE  cterm=NONE
hi PmenuThumb  ctermfg=81   ctermbg=16    cterm=NONE
hi PmenuSbar   ctermfg=81   ctermbg=16    cterm=NONE
hi Pmenu       ctermfg=8    ctermbg=237   cterm=NONE
hi ErrorMsg    ctermfg=88   ctermbg=172   cterm=bold
hi Search      ctermfg=255  ctermbg=57   cterm=NONE | " Search complete
hi SpellBad    ctermfg=255  ctermbg=196   cterm=underline | "Red
hi SpellCap    ctermfg=255  ctermbg=198   cterm=underline | "Red
hi SpellLocal  ctermfg=255  ctermbg=198   cterm=underline | "Red
hi SpellRare   ctermfg=255  ctermbg=200   cterm=underline | "Red
hi PmenuSel    ctermfg=9    ctermbg=255   cterm=NONE
hi IncSearch   ctermfg=9  ctermbg=255   cterm=underline | " When typing
hi Visual      ctermfg=NONE ctermbg=8     cterm=NONE | " Visual Selection
hi Cursor       ctermfg=NONE ctermbg=NONE cterm=NONE
hi CursorLine   ctermfg=NONE ctermbg=8    cterm=NONE
hi CursorLineNR ctermfg=196  ctermbg=8    cterm=underline

" Airline Settings
" Normal Mode
" Lt BG on White
hi AirlineN1 ctermfg=8 ctermbg=255 cterm=NONE
hi AirlineN2 ctermfg=255 ctermbg=8 cterm=NONE
hi AirlineN3 ctermfg=8 ctermbg=255 cterm=NONE
hi AirlineN3Modified ctermfg=8 ctermbg=255 cterm=bold

" Insert Mode
" Lt BG on Cyan
hi AirlineI1 ctermfg=8 ctermbg=14 cterm=NONE
hi AirlineI2 ctermfg=14 ctermbg=8 cterm=NONE
hi AirlineI3 ctermfg=8 ctermbg=14 cterm=NONE

" Visual Mode
" White on Orange
hi AirlineV1 ctermfg=255 ctermbg=202 cterm=NONE
hi AirlineV2 ctermfg=202 ctermbg=255 cterm=NONE
hi AirlineV3 ctermfg=255 ctermbg=202 cterm=NONE

" Replace Mode
" White on Red
hi AirlineR1 ctermfg=255 ctermbg=196 cterm=NONE
hi AirlineR2 ctermfg=196 ctermbg=255 cterm=NONE
hi AirlineR3 ctermfg=255 ctermbg=196 cterm=NONE

" Inactive
" Lt BG on Gray
" hi AirlineIA1 ctermfg=235 ctermbg=8 cterm=NONE
" hi AirlineIA2 ctermfg=8 ctermbg=235 cterm=NONE
" hi AirlineIA3 ctermfg=235 ctermbg=8 cterm=NONE
hi AirlineIA1 ctermfg=8 ctermbg=240 cterm=NONE
hi AirlineIA2 ctermfg=240 ctermbg=8 cterm=NONE
hi AirlineIA3 ctermfg=8 ctermbg=240 cterm=NONE

" Highlight 81st column
" hi ColorColumn ctermfg=NONE ctermbg=200 cterm=NONE
" call matchadd('ColorColumn', '\%81v', 100)

" For Python
hi pythonColon ctermfg=5 ctermbg=NONE cterm=NONE

" For Django
hi djangoTagStart ctermfg=45  ctermbg=NONE  cterm=NONE
hi djangoTagEnd   ctermfg=45  ctermbg=NONE  cterm=NONE
hi djangoVarStart ctermfg=48  ctermbg=NONE  cterm=NONE
hi djangoVarEnd   ctermfg=48  ctermbg=NONE  cterm=NONE

" Fixing HTML red
hi htmlH1   ctermfg=196 ctermbg=NONE cterm=NONE
hi htmlH2   ctermfg=197 ctermbg=NONE cterm=NONE
hi htmlH3   ctermfg=198 ctermbg=NONE cterm=NONE
hi htmlH4   ctermfg=199 ctermbg=NONE cterm=NONE
hi htmlH5   ctermfg=200 ctermbg=NONE cterm=NONE
hi htmlH6   ctermfg=201 ctermbg=NONE cterm=NONE
hi htmlLink ctermfg=253 ctermbg=NONE cterm=NONE

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
hi org_2_header      ctermfg=4   ctermbg=NONE cterm=NONE
hi org_1_header      ctermfg=14  ctermbg=NONE cterm=NONE
hi org_5_header      ctermfg=17  ctermbg=NONE cterm=NONE
hi org_4_header      ctermfg=19  ctermbg=NONE cterm=NONE
hi org_3_header      ctermfg=21  ctermbg=NONE cterm=NONE
hi org_time_1_header ctermfg=27  ctermbg=NONE cterm=NONE
hi org_time          ctermfg=27  ctermbg=NONE cterm=NONE
hi org_1_done        ctermfg=39  ctermbg=NONE cterm=NONE
hi org_done          ctermfg=39  ctermbg=NONE cterm=NONE
hi org_1_line        ctermfg=190 ctermbg=NONE cterm=NONE
hi org_1_todo        ctermfg=196 ctermbg=NONE cterm=NONE
hi org_todo          ctermfg=196 ctermbg=NONE cterm=NONE
hi org_1_underway    ctermfg=226 ctermbg=NONE cterm=NONE
hi org_underway      ctermfg=226 ctermbg=NONE cterm=NONE


" End of Colour scheme ! (Pretty small !:) )
" Will add support for more languages eventually. !
