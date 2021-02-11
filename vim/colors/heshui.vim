"    |                 |
"    |---. ,---. ,---. |---. .   . .
"    |   | |---' `---. |   | |   | |
"    '   ' `---' `---' '   ' `---' ' 


highlight clear
if exists("syntax_on")
	syntax reset
endif

set background=light

set t_Co=256
let g:colors_name = "heshui"


function! s:Color (group, bg, fg, gui)
    let cs  = 'highlight ' . a:group . ' '
    if !empty(a:bg)
        let cs .= 'guibg=' . a:bg[0] . ' '
        let cs .= 'ctermbg=' . a:bg[1] . ' '
    endif
    let cs .= 'gui=' . a:gui . ' '
    if !empty(a:fg)
        let cs .= 'guifg=' . a:fg[0] . ' '
        let cs .= 'ctermfg=' . a:fg[1] . ' '
    endif
    let cs .= 'cterm=' . a:gui . ' '
  exec cs 
endfunction

function! s:Link (group, point)
    let sLink = "hi link " . a:group . ' ' . a:point
    exec sLink
endfunction

let s:white = ['#ffffff', '231']
let s:green4  = ['#008700', '28']
let s:royalblue1 = ['#5f5fff', '63']
let s:deeppink2 = ['#ff005f', '197']
let s:red1 = ['#ff0000', '196']
let s:purple1 = ['#8700ff', '93']
let s:purple2 = ['#af00ff', '129']
let s:hotpink3 = ['#d75f87', '168']
let s:darkolivegreen1 = ['#d7ff5f', '191']
let s:lightgoldenrod2 = ['#ffd75f', '221']
let s:grey15 = ['#262626', '235']
let s:grey50 = ['#808080', '244']
let s:grey53 = ['#878787', '102']
let s:grey89 = ['#e4e4e4', '254']
let s:grey93 = ['#eeeeee', '255']
let s:dodgerbule1 = ['#0087ff', '129']
let s:lightskyblue1 = ['#afd7ff', '153']
let s:deepskyblue3 = ['#0087d7', '32']
let s:seagreen1 = ['#5fff87', '84']
let s:lightPink1 = ['#ffafaf', '217']
let s:chartreuse2 = ['#5fff00', '82']
let s:thistle1 = ['#ffd7ff', '225']
let s:lightgreen = ['#87ff87', '120']

call s:Color("Comment", s:white, s:grey50, "NONE")

call s:Color("Constant", s:white, s:dodgerbule1, "bold")
call s:Color("String", s:white, s:green4, "NONE")
call s:Color("Character", s:white, s:dodgerbule1, "NONE")
call s:Color("Number", s:white, s:dodgerbule1, "NONE")
call s:Color("Boolean", s:white, s:dodgerbule1, "NONE")
call s:Color("Float", s:white, s:dodgerbule1, "NONE")

call s:Color("Error", s:white, s:red1, "underline")

call s:Color("Identifier", s:white, s:purple1, "bold")
call s:Color("Function", s:white, s:purple1, "bold")

"call s:Color("Ignore", "", "", "")
call s:Color("Normal", s:white, s:grey15, "NONE")

call s:Color("PreProc", s:white, s:hotpink3, "bold")
call s:Color("Include", s:white, s:hotpink3, "bold")
call s:Color("Define", s:white, s:hotpink3, "bold")
call s:Color("Macro", s:white, s:hotpink3, "bold")
call s:Color("PreCondit", s:white, s:hotpink3, "bold")

call s:Color("Special", s:white, s:purple1, "bold")
call s:Color("SpecialChar", s:white, s:purple1, "bold")
call s:Color("Tag", s:white, s:purple1, "bold")
call s:Color("Delimiter", s:white, s:purple1, "bold")
call s:Color("SpecialComment", s:white, s:purple1, "bold")
call s:Color("Debug", s:white, s:purple1, "bold")

call s:Color("Statement", s:white, s:hotpink3, "bold")
call s:Color("Conditional", s:white, s:hotpink3, "bold")
call s:Color("Repeat", s:white, s:hotpink3, "bold")
call s:Color("Label", s:white, s:hotpink3, "bold")
call s:Color("Operator", s:white, s:hotpink3, "bold")
call s:Color("Keyword", s:white, s:hotpink3, "bold")
call s:Color("Exception", s:white, s:hotpink3, "bold")

call s:Color("Type", s:white, s:hotpink3, "bold")
call s:Color("StorageClass", s:white, s:hotpink3, "bold")
call s:Color("Structure", s:white, s:hotpink3, "bold")
call s:Color("Typedef", s:white, s:hotpink3, "bold")

call s:Color("Underlined", s:white, s:purple2, "underline")

call s:Color("Todo", s:darkolivegreen1, s:white, "bold")

call s:Color("ClassName", s:white, s:royalblue1, "bold")

call s:Color("Cursor", s:grey15, s:white, "NONE")
call s:Color("CursorLine", "", "", "underline")
call s:Color("CursorLineNr", "", s:hotpink3, "NONE")
call s:Color("LineNr", "", s:grey50, "NONE")

call s:Color("SpecialKey", s:white, s:purple1, "bold")
call s:Color("NonText", s:white, s:grey53, "bold")
"call s:Color("StatusLine", s:, s:, "bold")
"call s:Color("StatusLineNC", s:, s:, "")
"call s:Color("StatusLineTerm", s:, s:, "")
"call s:Color("StatusLineTermNC", s:, s:, "")
call s:Color("Visual", s:lightskyblue1, s:white, "NONE")
call s:Color("Directory", s:white, s:purple1, "bold")
call s:Color("ErrorMsg", s:red1, s:white, "bold")
call s:Color("IncSearch", s:lightskyblue1, s:white, "NONE")
call s:Color("Search", s:lightskyblue1, s:white, "NONE")
call s:Color("MoreMsg", s:white, s:green4, "bold")
call s:Color("ModeMsg", s:darkolivegreen1, s:grey15, "bold")
call s:Color("Question", s:darkolivegreen1, s:grey15, "bold")
call s:Color("VertSplit", "", "", "reverse")
call s:Color("Title", s:white, s:hotpink3, "bold")
call s:Color("VisualNOS", "", s:grey15, "bold,underline")
call s:Color("WarningMsg", "", s:red1, "bold")
call s:Color("WildMenu", s:darkolivegreen1, s:grey15, "bold")
call s:Color("Folded", s:grey50, s:grey15, "NONE")
call s:Color("FoldColumn", s:grey50, s:grey15, "NONE")
call s:Color("DiffAdd", "", s:lightgreen, "NONE")
call s:Color("DiffChange", "", s:lightgreen, "NONE")
call s:Color("DiffDelete", "", s:thistle1, "NONE")
call s:Color("DiffText", "", s:chartreuse2, "NONE")
call s:Color("Conceal", s:grey50, s:white, "NONE")
call s:Color("Pmenu", s:grey93, s:grey15, "NONE")
call s:Color("PmenuSel", s:grey93, s:grey15, "NONE")
call s:Color("PmenuSbar", s:grey93, s:grey15, "NONE")
call s:Color("PmenuThumb", s:grey50, "", "NONE")
call s:Color("TabLine", s:grey89, "", "NONE")
call s:Color("TabLineFill", s:grey89, "", "NONE")
call s:Color("TabLineSel", s:grey15, s:white, "NONE")
call s:Color("MatchParen", s:lightPink1, "", "NONE")
call s:Color("SpellBad", s:grey50, s:grey93, "underline")
call s:Color("SpellCap", s:grey50, s:grey93, "underline")
call s:Color("SpellLocal", s:grey50, s:grey93, "underline")
call s:Color("SpellRare", s:grey50, s:grey93, "underline")

" vim-go
call s:Link("goTypeName", "ClassName")
call s:Link("goReceiverType", "ClassName")
call s:Link("goFunctionCall", "Function")


