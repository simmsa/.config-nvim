"                _        _
"  ___ _   _ ___| |_ __ _(_)_ __
" / __| | | / __| __/ _` | | '_ \
" \__ \ |_| \__ \ || (_| | | | | |
" |___/\__,_|___/\__\__,_|_|_| |_|
"
" Easy on the eyes. Easy on the mind.
"
" About {{{
"
" By: Andrew Simms, http://andrewdsimms.com
" Available at https://github.com/simmsa/sustain/
"
" A colorscheme using colors with colors of similar contrast ratios for
" similar groups. The desired effect is a colorscheme that offers clear
" syntax differences and is pleasing to read for long periods of time.
"
" Color Palatte from www.google.com/design/spec/style/color.html
" Inspiration and rough template from Badwolf by Steve Losh,
" https://github.com/sjl/badwolf/
"
" }}}
" Initiation {{{

if !has("gui_running") && &t_Co != 88 && &t_Co != 256
    finish
endif

set background=dark

if exists("syntax on")
    syntax reset
endif

let g:colors_name = "sustain"

" }}}
" Colors {{{
" Term colors are approximated as Light, Normal, Dark, and Accent
" Gui colors used are 3, 0, 8, 12

function! TermColors()
    let l:all_colors = [s:ambers, s:yellows, s:limes, s:light_greens, s:greens, s:teals, s:cyans, s:light_blues, s:blues, s:indigos, s:deep_purples, s:purples, s:pinks, s:reds, s:sustain_gui_elements]
    let l:py_command = "python color_approx/colortrans.py "
    let l:command_string = ""
    " for color in l:all_colors[-1][0]
    for color in range(5, 9)
        " let l:command_string .= (l:py_command . color[1:6] . ' && ')
        let l:command_string .= (l:py_command . l:all_colors[-1][0][color][1:6] . ' && ')
        " let l:command_string .= (l:py_command . l:all_colors[color][0][0][1:6] . ' && ')
        " let l:command_string .= (l:py_command . l:all_colors[color][0][8][1:6] . ' && ')
        " let l:command_string .= (l:py_command . l:all_colors[color][0][12][1:6] . ' && ')
    endfor
    execute ":10sp"
    execute ":winc r"
    execute ":term " . l:command_string
endfunction

let s:white        = [['#dddddd'], [255]]
let s:black        = [['#000000'], [232]]

let s:blue_greys   = [['#607d8b','#eceff1','#cfd8dc','#b0bec5','#90a4ae','#78909c','#546e7a','#455a64','#37474f','#263238'], [255, 109, 66, 250]]
let s:greys        = [['#9e9e9e', '#fafafa', '#f5f5f5', '#eeeeee', '#e0e0e0', '#bdbdbd', '#757575', '#616161', '#424242', '#212121'], [253, 245, 236, 248]]
let s:deep_oranges = [['#ff5722','#fbe9e7','#ffccbc','#ffab91','#ff8a65','#ff7043','#f4511e','#e64a19','#d84315','#bf360c','#ff9e80','#ff6e40','#ff3d00','#dd2c00'], [216, 202, 166, 202]]

let s:oranges      = [['#ff9800','#fff3e0','#ffe0b2','#ffcc80','#ffb74d','#ffa726','#fb8c00','#f57c00','#ef6c00','#e65100','#ffd180','#ffab40','#ff9100','#ff6d00'], [222, 208, 130, 208]]
let s:ambers       = [['#ffc107','#fff8e1','#ffecb3','#ffe082','#ffd54f','#ffca28','#ffb300','#ffa000','#ff8f00','#ff6f00','#ffe57f','#ffd740','#ffc400','#ffab00'], [222, 214, 208, 220]]
let s:yellows      = [['#ffeb3b','#fffde7','#fff9c4','#fff59d','#fff176','#ffee58','#fdd835','#fbc02d','#f9a825','#f57f17','#ffff8d','#ffff00','#ffea00','#ffd600'], [229, 3, 214, 11]]
let s:limes        = [['#cddc39','#f9fbe7','#f0f4c3','#e6ee9c','#dce775','#d4e157','#c0ca33','#afb42b','#9e9d24','#827717','#f4ff81','#eeff41','#c6ff00','#aeea00'], [193, 185, 142, 190]]
let s:light_greens = [['#8bc34a','#f1f8e9','#dcedc8','#c5e1a5','#aed581','#9ccc65','#7cb342','#689f38','#558b2f','#33691e','#ccff90','#b2ff59','#76ff03','#64dd17'], [193, 113, 64, 118]]
let s:greens       = [['#4caf50','#e8f5e9','#c8e6c9','#a5d6a7','#81c784','#66bb6a','#43a047','#388e3c','#2e7d32','#1b5e20','#b9f6ca','#69f0ae','#00e676','#00c853'], [151, 2, 29, 10]]
let s:teals        = [['#009688','#e0f2f1','#b2dfdb','#80cbc4','#4db6ac','#26a69a','#00897b','#00796b','#00695c','#004d40','#a7ffeb','#64ffda','#1de9b6','#00bfa5'], [121, 43, 23, 43]]
let s:cyans        = [['#00bcd4','#e0f7fa','#b2ebf2','#80deea','#4dd0e1','#26c6da','#00acc1','#0097a7','#00838f','#006064','#84ffff','#18ffff','#00e5ff','#00b8d4'], [116, 6, 31, 14]]
let s:light_blues  = [['#03a9f4','#e1f5fe','#b3e5fc','#81d4fa','#4fc3f7','#29b6f6','#039be5','#0288d1','#0277bd','#01579b','#80d8ff','#40c4ff','#00b0ff','#0091ea'], [117, 31, 39, 31]]
let s:blues        = [['#2196f3','#e3f2fd','#bbdefb','#90caf9','#64b5f6','#42a5f5','#1e88e5','#1976d2','#1565c0','#0d47a1','#82b1ff','#448aff','#2979ff','#2962ff'], [117, 4, 25, 12]]
let s:indigos      = [['#3f51b5','#e8eaf6','#c5cae9','#9fa8da','#7986cb','#5c6bc0','#3949ab','#303f9f','#283593','#1a237e','#8c9eff','#536dfe','#3d5afe','#304ffe'], [146, 63, 25, 63]]
let s:deep_purples = [['#673ab7','#ede7f6','#d1c4e9','#b39ddb','#9575cd','#7e57c2','#5e35b1','#512da8','#4527a0','#311b92','#b388ff','#7c4dff','#651fff','#6200ea'], [146, 92, 60, 99]]
let s:purples      = [['#9c27b0','#f3e5f5','#e1bee7','#ce93d8','#ba68c8','#ab47bc','#8e24aa','#7b1fa2','#6a1b9a','#4a148c','#ea80fc','#e040fb','#d500f9','#aa00ff'], [176, 5, 54, 13]]
let s:pinks        = [['#e91e63','#fce4ec','#f8bbd0','#f48fb1','#f06292','#ec407a','#d81b60','#c2185b','#ad1457','#880e4f','#ff80ab','#ff4081','#f50057','#c51162'], [211, 204, 125, 205]]
let s:reds         = [['#f44337','#ffebee','#ffcdd2','#ef9a9a','#e57373','#ef5350','#e53935','#d32f2f','#c62828','#b71c1c','#ff8a80','#ff5252','#ff1744','#d50000'], [210, 1, 160, 9]]

" Sustain Additions
let s:main_background = [['#00111a'], ["none"]]
let s:background_lighten = [['#002233'], [8]]
" HSL (200, 100, x) 10, 90, 80, 70, 60, 50, 40, 30, 20, 17, 15, 13, 10, 7, 5
let s:sustain_gui_elements = [['#002233', '#cceeff', '#99ddff', '#66ccff', '#33bbff', '#00aaff', '#0088cc', '#006699', '#004466', '#003a57', '#00334d', '#002c42', '#002233', '#001824', '#00111a'], [8, 195, 117, 81, 75, 39, 32, 24, 24, 19, 18, 17, 8, "none", "none"]]
" }}}
" Functions {{{

" Combines groups of colors
function! s:MergeColors(color_groups, min, max, term)
    let l:result = [[], [], [a:term]]
    " Gui Colors
    for x in range(a:min, a:max)
        for y in range(0, len(a:color_groups) - 1)
            call add(l:result[0], a:color_groups[y][0][x])
        endfor
    endfor
    " Cterm Colors
    for x in range(a:min, a:max)
        for y in range(0, len(a:color_groups) - 1)
            call add(l:result[1], a:color_groups[y][1][x])
        endfor
    endfor
    return l:result
endfunction

function! s:RainbowMergeColors(type, color_groups)
    let l:result = []
    for x in range(0, len(a:color_groups) - 1)
        " Use Accent Color
        let l:hex_color = a:color_groups[x][0][12]
        let l:cterm_color = a:color_groups[x][1][3]
        if(a:type == "kien")
            call extend(l:result, [l:hex_color, l:cterm_color])
        elseif(a:type == "hex")
            call add(l:result, l:hex_color)
        elseif(a:type == "cterm")
            call add(l:result, l:cterm_color)
        endif
    endfor
    return l:result
endfunction

function! s:GetShade(color, shade, term)
    let l:solid = [0, 0]
    let l:light = [4, 0]
    let l:normal = [0, 1]
    let l:dark = [8, 2]
    let l:accent = [13, 3]
    if(a:shade == "light")
        return [[a:color[0][l:light[0]]], [a:color[1][l:light[1]]], [a:term]]
    elseif(a:shade == "normal")
        return [[a:color[0][l:normal[0]]], [a:color[1][l:normal[1]]], [a:term]]
    elseif(a:shade == "dark")
        return [[a:color[0][l:dark[0]]], [a:color[1][l:dark[1]]], [a:term]]
    elseif(a:shade == "accent")
        return [[a:color[0][l:accent[0]]], [a:color[1][l:accent[1]]], [a:term]]
    elseif(a:shade == "solid")
        return [[a:color[0][l:solid[0]]], [a:color[1][l:solid[1]]], [a:term]]
    endif
endfunction

" List of syntax groups, list of colors for foreground, optional list of
" colors for the background
function! s:HiGroup(group, fg_colors, ...)
    if(a:0 >= 1)
        let l:bg_colors = a:1
    else
        let l:bg_colors = []
    endif
    let l:hlstr = 'hi '
    let l:count = 0
    if(len(a:fg_colors))
        let l:term = a:fg_colors[2][0]
    else
        let l:term = "none"
    endif
    for entry in a:group
        let l:hlstr .= entry
        if(len(a:fg_colors))
            let l:hlstr .= ' guifg=' . a:fg_colors[0][l:count % len(a:fg_colors[0])]
            let l:hlstr .= ' ctermfg=' . a:fg_colors[1][l:count % len(a:fg_colors[1])]
        else
            let l:hlstr .= ' guifg=none'
            let l:hlstr .= ' ctermfg=none'
        endif
        if(len(l:bg_colors))
            let l:hlstr .= ' guibg=' . l:bg_colors[0][l:count % len(l:bg_colors[0])]
            let l:hlstr .= ' ctermbg=' . l:bg_colors[1][l:count % len(l:bg_colors[1])]
        else
            let l:hlstr .= ' guibg=none'
            let l:hlstr .= ' ctermbg=none'
        endif
        let l:hlstr .= ' cterm=' . l:term . ' gui=' . l:term
        let l:count += 1
        " echo l:hlstr
        " sleep 1
        execute l:hlstr
        let l:hlstr = 'hi '
    endfor
endfunction
" }}}
" Sustain Colors {{{

" let s:sustain_whites = s:MergeColors([s:white], 0, 0, "none")
" let s:sustain_blacks = s:MergeColors([s:black], 0, 0, "none")
" let s:sustain_blues = s:MergeColors([s:blues], 4, 7, "none")
" let s:sustain_greens = s:MergeColors([s:greens], 5, 5, "none")
" let s:sustain_light_blues = s:MergeColors([s:light_blues], 4, 7, "none")
" let s:sustain_intense_blues = s:MergeColors([s:blues], 12, 13, "none")
" let s:sustain_intense_indigos = s:MergeColors([s:indigos], 12, 13, "none")
" let s:sustain_intense_cyans = s:MergeColors([s:cyans], 12, 13, "none")
" let s:sustain_indigos = s:MergeColors([s:indigos], 3, 5, "none")
" let s:sustain_purples = s:MergeColors([s:deep_purples], 3, 5, "none")
" let s:sustain_reds = s:MergeColors([s:reds], 3, 5, "none")
" let s:sustain_pinks = s:MergeColors([s:pinks], 3, 5, "none")
" let s:sustain_magentas = s:MergeColors([s:purples], 3, 5, "none")
" let s:sustain_cyans = s:MergeColors([s:cyans], 3, 8, "none")
" let s:sustain_intense_greens = s:MergeColors([s:greens], 12, 12, "none")
" let s:sustain_teals = s:MergeColors([s:teals], 12, 13, "none")
" let s:sustain_light_teals = s:MergeColors([s:teals], 3, 5, "none")
" let s:sustain_yellows = s:MergeColors([s:yellows], 3, 5, "none")
" let s:sustain_oranges = s:MergeColors([s:oranges], 3, 5, "none")
" let s:sustain_reds = s:MergeColors([s:reds], 3, 5, "none")
" let s:sustain_pinks = s:MergeColors([s:pinks], 3, 6, "none")
" let s:sustain_accent_orange = s:MergeColors([s:oranges], 11, 11, "none")
" let s:sustain_accent_purple = s:MergeColors([s:deep_purples], 11, 11, "none")
" let s:sustain_accent_red = s:MergeColors([s:reds], 11, 11, "none")
" let s:sustain_accent_green = s:MergeColors([s:greens], 11, 11, "none")
" let s:sustain_accent_pink = s:MergeColors([s:pinks], 10, 10, "none")
" let s:sustain_comments = s:MergeColors([s:reds], 4, 4, "none")
" let s:sustain_dark_orange = s:MergeColors([s:oranges], 13, 13, "none")
" let s:sustain_dark_purple = s:MergeColors([s:deep_purples], 10, 10, "none")
" let s:sustain_dark_blues = s:MergeColors([s:blues], 10, 10, "none")
" let s:sustain_search_purple = s:MergeColors([s:deep_purples], 13, 13, "underline")
" let s:sustain_dark_red = s:MergeColors([s:reds], 13, 13, "none")
" let s:sustain_dark_green = s:MergeColors([s:greens], 13, 13, "none")
let s:sustain_whites = s:GetShade(s:white, "solid", "none")
let s:sustain_blacks = s:GetShade(s:black, "solid", "none")
let s:sustain_blues = s:GetShade(s:blues, "light", "none")
let s:sustain_greens = s:GetShade(s:greens, "light", "none")
let s:sustain_light_blues = s:GetShade(s:light_blues, "light", "none")
let s:sustain_intense_blues = s:GetShade(s:blues, "light", "none")
let s:sustain_intense_indigos = s:GetShade(s:indigos, "light", "none")
let s:sustain_intense_cyans = s:GetShade(s:cyans, "light", "none")
let s:sustain_indigos = s:GetShade(s:indigos, "light", "none")
let s:sustain_purples = s:GetShade(s:deep_purples, "light", "none")
let s:sustain_reds = s:GetShade(s:reds, "light", "none")
let s:sustain_pinks = s:GetShade(s:pinks, "light", "none")
let s:sustain_magentas = s:GetShade(s:purples, "light", "none")
let s:sustain_cyans = s:GetShade(s:cyans, "light", "none")
let s:sustain_intense_greens = s:GetShade(s:greens, "light", "none")
let s:sustain_teals = s:GetShade(s:teals, "light", "none")
let s:sustain_light_teals = s:GetShade(s:teals, "light", "none")
let s:sustain_yellows = s:GetShade(s:yellows, "light", "none")
let s:sustain_oranges = s:GetShade(s:oranges, "light", "none")
let s:sustain_reds = s:GetShade(s:reds, "light", "none")
let s:sustain_pinks = s:GetShade(s:pinks, "light", "none")
let s:sustain_accent_orange = s:GetShade(s:oranges, "light", "none")
let s:sustain_accent_purple = s:GetShade(s:deep_purples, "light", "none")
let s:sustain_accent_red = s:GetShade(s:reds, "light", "none")
let s:sustain_accent_green = s:GetShade(s:greens, "light", "none")
let s:sustain_accent_pink = s:GetShade(s:pinks, "light", "none")
let s:sustain_comments = s:GetShade(s:reds, "light", "none")
let s:sustain_dark_orange = s:GetShade(s:oranges, "light", "none")
let s:sustain_dark_purple = s:GetShade(s:deep_purples, "light", "none")
let s:sustain_dark_blues = s:GetShade(s:blues, "light", "none")
let s:sustain_search_purple = s:GetShade(s:deep_purples, "light", "underline")
let s:sustain_dark_red = s:GetShade(s:reds, "light", "none")
let s:sustain_dark_green = s:GetShade(s:greens, "light", "none")

let s:sustain_gui_subtle = s:MergeColors([s:sustain_gui_elements], 12, 13, "none")
let s:sustain_gui_dark = s:MergeColors([s:sustain_gui_elements], 9, 11, "none")
let s:sustain_gui_normal = s:MergeColors([s:sustain_gui_elements], 6, 9, "none")
let s:sustain_gui_light = s:MergeColors([s:sustain_gui_elements], 4, 7, "none")
let s:sustain_gui_bright = s:MergeColors([s:sustain_gui_elements], 2, 3, "none")
" let s:sustain_gui_bg = s:MergeColors([s:sustain_gui_elements], 14, 14, "none")
let s:sustain_gui_bg = s:GetShade(s:main_background, "solid", "none")
let s:sustain_gui_bg_highlight = s:MergeColors([s:sustain_gui_elements], 0, 0, "none")
let s:sustain_gui_selected = s:MergeColors([s:sustain_gui_elements], 3, 3, "bold")
let s:sustain_gui_bg_selected = s:MergeColors([s:sustain_gui_elements], 14, 14, "bold")
let s:sustain_gui_not_selected = s:MergeColors([[reverse(copy(s:blue_greys[0])), [235, 237, 239, 241, 243]]], 0, 4, "none")

" For Rainbow Parentheses Plugins
let s:rainbow_colors = [s:blues, s:purples, s:cyans, s:pinks, s:indigos]
let s:rainbow_position = 12
let g:sustain_kien_rainbow_parens = s:RainbowMergeColors("kien", s:rainbow_colors)
let g:sustain_gui_rainbow_parens = s:RainbowMergeColors("hex", s:rainbow_colors)
let g:sustain_cterm_rainbow_parens = s:RainbowMergeColors("cterm", s:rainbow_colors)
" }}}
" Code Syntax Groups {{{
let s:constants = ['Constant', 'Character', 'Boolean']
let s:strings = ['String']
let s:numbers = ['Number', 'Float']
let s:identifiers = ['Identifier']
let s:conditionals = ['Repeat', 'Conditional']
let s:functions = ['Function']
let s:pre_condits = ['PreCondit']
let s:statements = ['Statement', 'Label', 'Operator', 'Keyword', 'Exception']
let s:pre_procs = ['PreProc', 'Include', 'Define', 'Macro']
let s:types = ['Type', 'StorageClass', 'Structure', 'Typedef']
let s:specials = ['Special', 'SpecialChar', 'Tag', 'Delimiter', 'SpecialComment', 'Debug']
let s:comments = ['Comment']
let s:ignores = ['Ignore']
let s:errors = ['Error']
let s:todos = ['Todo']
" }}}
" Code Syntax Coloring {{{
" Light Colors
" call s:HiGroup(s:constants   , s:sustain_oranges)
" call s:HiGroup(s:strings     , s:sustain_yellows)
" call s:HiGroup(s:numbers     , s:sustain_blues)
" call s:HiGroup(s:identifiers , s:sustain_indigos)
" call s:HiGroup(s:functions   , s:sustain_greens)
" call s:HiGroup(s:statements  , s:sustain_teals)
" call s:HiGroup(s:specials    , s:sustain_blues)
" call s:HiGroup(s:types       , s:sustain_light_blues)
call s:HiGroup(s:constants, s:GetShade(s:oranges, "light", "none"))
call s:HiGroup(s:strings, s:GetShade(s:yellows, "light", "none"))
call s:HiGroup(s:numbers, s:GetShade(s:blues, "light", "none"))
call s:HiGroup(s:identifiers, s:GetShade(s:indigos, "light", "none"))
call s:HiGroup(s:functions, s:GetShade(s:greens, "light", "none"))
call s:HiGroup(s:statements, s:GetShade(s:teals, "light", "none"))
call s:HiGroup(s:specials, s:GetShade(s:blues, "light", "none"))
call s:HiGroup(s:types, s:GetShade(s:light_blues, "light", "none"))
call s:HiGroup(s:comments, s:GetShade(s:reds, "light", "none"))

" More Intense
" call s:HiGroup(s:pre_condits, s:sustain_intense_greens)
" call s:HiGroup(s:conditionals, s:sustain_dark_purple)
" call s:HiGroup(s:pre_procs, s:sustain_dark_blues)
call s:HiGroup(s:pre_condits, s:GetShade(s:greens, "normal", "none"))
call s:HiGroup(s:conditionals, s:GetShade(s:deep_purples, "light", "none"))
call s:HiGroup(s:pre_procs, s:GetShade(s:blues, "normal", "none"))

" Accents
" call s:HiGroup(s:comments, s:sustain_comments)
" call s:HiGroup(s:ignores, s:sustain_accent_purple)
" call s:HiGroup(s:errors, s:sustain_accent_orange)
" call s:HiGroup(s:todos, s:sustain_accent_green)
call s:HiGroup(s:ignores, s:GetShade(s:deep_purples, "accent", "none"))
call s:HiGroup(s:errors, s:GetShade(s:reds, "accent", "bold"))
call s:HiGroup(s:todos, s:GetShade(s:greens, "accent", "bold"))
" }}}
" Vim Syntax Groups {{{
let s:vim_conceal = ['Conceal', 'NonText']
let s:vim_cursor = ['Cursor', 'CursorIM', 'CursorColumn', 'CursorLineNr']
let s:vim_cursor_line = ['CursorLine']
let s:vim_cursor_line_number = ['CursorLineNr']
let s:vim_diffs = ['DiffAdd', 'DiffChange', 'DiffDelete', 'DiffText']
let s:vim_error = ['ErrorMsg', 'WarningMsg']
let s:vim_fold = ['Folded']
let s:vim_column = ['FoldColumn', 'SignColumn']
let s:vim_line_number = ['LineNr', 'VertSplit']
let s:vim_msg = ['ModeMsg', 'MoreMsg', 'Question']
let s:vim_popup_menu = ['Pmenu', 'PmenuSbar', 'PmenuThumb', 'WildMenu']
let s:vim_popup_menu_select = ['PmenuSel']
let s:vim_normal = ['Normal']
let s:vim_search = ['Search', 'IncSearch']
let s:vim_special = ['Directory', 'SpecialKey', 'Title']
let s:vim_spell = ['SpellBad', 'SpellCap', 'SpellLocal', 'SpellRare']
let s:vim_tab = ['TabLine', 'TabLineFill', 'TabLineSel']
let s:vim_visual = ['Visual']
" }}}
" Vim Syntax Coloring {{{
call s:HiGroup(s:vim_conceal, s:sustain_gui_subtle)
call s:HiGroup(s:vim_cursor, [])
call s:HiGroup(s:vim_cursor_line, [], s:sustain_gui_bg_highlight)
call s:HiGroup(s:vim_cursor_line_number, s:sustain_gui_bright, s:sustain_gui_bg_highlight)
call s:HiGroup(s:vim_error, s:sustain_whites, s:GetShade(s:reds, "accent", "none"))
call s:HiGroup(s:vim_fold, s:sustain_gui_bright, s:sustain_gui_bg_highlight)
call s:HiGroup(s:vim_column, s:sustain_gui_dark, s:sustain_gui_bg)
call s:HiGroup(s:vim_line_number, s:sustain_gui_dark, s:sustain_gui_bg)
call s:HiGroup(s:vim_msg, s:sustain_whites, s:sustain_gui_subtle)
call s:HiGroup(s:vim_normal, s:sustain_whites, s:sustain_gui_bg)
call s:HiGroup(s:vim_popup_menu, s:sustain_gui_bg, s:sustain_gui_not_selected)
call s:HiGroup(s:vim_popup_menu_select, s:sustain_gui_bg_selected, s:sustain_gui_selected)
" call s:HiGroup(s:vim_search, s:sustain_intense_indigos, s:sustain_gui_bg_highlight)
call s:HiGroup(s:vim_search, s:GetShade(s:blues, "accent", "italic"))
call s:HiGroup(s:vim_special, s:sustain_gui_light)
call s:HiGroup(s:vim_spell, s:sustain_whites, s:sustain_dark_red)
call s:HiGroup(s:vim_tab, s:sustain_gui_light, s:sustain_gui_subtle)
" call s:HiGroup(s:vim_visual, s:sustain_whites, s:sustain_dark_orange)
call s:HiGroup(s:vim_visual, s:GetShade(s:white, "solid", "none"), s:GetShade(s:oranges, "accent", "none"))
" }}}
" Diffs {{{
" For easier reading of diffs backgrounds are dark to maintian syntax
" highlighting. Colors are atypical, but easier on the eyes. They are:
" * Slate Green (#003333) for Additions
" * Dark Purple (##180033) for Changed Lines
" * Italics for Changed Text
" * Dark Red (#330000) for Deletions
let s:vim_diff = ['DiffAdd', 'DiffChange', 'DiffDelete']
call s:HiGroup(s:vim_diff, [], s:MergeColors([[['#003333'], [22]], [['#180033'], [53]], [['#330000'], [52]]], 0, 0, "none"))
" Set diff text as italic
" Background must be set if you don't want your retinas blasted with red
hi DiffText ctermfg=none guifg=none ctermbg=53 guibg=#180033 cterm=bold gui=italic
" }}}
" Custom Highlighting {{{
" Airline Settings {{{
" Normal Mode
" Hues of Gui Blue
let s:airline_normal = ['AirlineN1', 'AirlineN2', 'AirlineN3', 'AirlineN3Modified']
call s:HiGroup(s:airline_normal, s:sustain_gui_bg, s:sustain_gui_normal)

" Insert Mode
" Hues of Gui Light Blue
let s:airline_insert = ['AirlineI1', 'AirlineI2', 'AirlineI3']
call s:HiGroup(s:airline_insert, s:sustain_gui_bg, s:sustain_gui_light)

" Visual Mode
" White on Orange
let s:airline_visual = ['AirlineV1', 'AirlineV2', 'AirlineV3']
" call s:HiGroup(s:airline_visual, s:sustain_whites, s:sustain_dark_orange)
call s:HiGroup(s:airline_visual, s:GetShade(s:white, "solid", "none"), s:GetShade(s:oranges, "accent", "none"))

" Replace Mode
" White on Red
let s:airline_replace = ['AirlineR1', 'AirlineR2', 'AirlineR3']
" call s:HiGroup(s:airline_replace, s:sustain_whites, s:sustain_dark_red)
call s:HiGroup(s:airline_replace, s:GetShade(s:white, "solid", "none"), s:GetShade(s:reds, "accent", "none"))

" Inactive
" Lt Gray on Gray
let s:airline_inactive = ['AirlineIA1', 'AirlineIA2', 'AirlineIA3']
call s:HiGroup(s:airline_inactive, s:sustain_gui_bg, s:sustain_gui_not_selected)
" }}}
" Python{{{
" call s:HiGroup(['pythonColon'], s:sustain_accent_pink)
call s:HiGroup(['pythonColon'], s:GetShade(s:pinks, "accent", "bold"))
" }}}
" HTML {{{
let s:html_headers = ['htmlH1', 'H2', 'H3', 'H4', 'H5', 'H6', ]
let s:html_links = ['htmlLink']

let s:reverse_pinks = [reverse(copy(s:pinks[0])), [0, 0, 0, 0, 0, 162, 163, 164, 133, 134, 135]]
let s:sustain_reverse_pinks = s:MergeColors([s:reverse_pinks], 5, 10, 'bold')
call s:HiGroup(s:html_headers, s:sustain_reverse_pinks)
call s:HiGroup(s:html_links, s:MergeColors([s:deep_purples], 0, 0, "bold"))
" }}}
" Org Mode {{{
let s:org_headers = ['org_1_header', 'org_2_header', 'org_3_header', 'org_4_header', 'org_5_header']
call s:HiGroup(s:org_headers, s:sustain_reverse_pinks)
let s:org_blue = ['org_time_1_header', 'org_time', 'org_1_done', 'org_done']
call s:HiGroup(s:org_blue, s:GetShade(s:blues, "normal", "none"))
let s:org_yellow = ['org_1_line', 'org_1_underway', 'org_underway']
call s:HiGroup(s:org_yellow, s:GetShade(s:yellows, "accent", "bold"))
let s:org_reds = ['org_1_todo', 'org_todo']
call s:HiGroup(s:org_reds, s:GetShade(s:reds, "accent", "none"))
" }}}
" }}}
