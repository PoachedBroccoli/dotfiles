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

let s:green4  = ['#008700', '28']
let s:slateblue3 = ['#5f5faf', '62']
let s:royalblue1 = ['#5f5fff', '63']
let s:steelblue3 = ['#5f87d7', '68']
let s:cornflowerblue = ['#5f87ff', '69']
let s:chartreuse2 = ['#5fff00', '82']
let s:seagreen1 = ['#5fff87', '84']
let s:purple1 = ['#8700ff', '93']
let s:grey53 = ['#878787', '102']
let s:lightgreen = ['#87ff87', '120']
let s:purple = ['#af00ff', '129']
let s:darkorange3 = ['#d75f00', '166']
let s:hotpink3 = ['#d75f87', '168']
let s:lightsalmon3 = ['#d78700', '172']
let s:darkolivegreen1 = ['#d7ff5f', '191']
let s:red1 = ['#ff0000', '196']
let s:deeppink2 = ['#ff005f', '197']
let s:lightPink1 = ['#ffafaf', '217']
let s:lightgoldenrod2 = ['#ffd75f', '221']
let s:thistle1 = ['#ffd7ff', '225']
let s:gold1 = ['#ffd700', '220']
let s:white = ['#ffffff', '231']
let s:grey15 = ['#262626', '235']
let s:grey50 = ['#808080', '244']
let s:grey89 = ['#e4e4e4', '254']
let s:grey93 = ['#eeeeee', '255']

call s:Color("Comment", s:white, s:grey50, "NONE")

call s:Color("Constant", s:white, s:purple, "bold")
call s:Color("String", s:white, s:green4, "NONE")
call s:Color("Character", s:white, s:purple, "NONE")
call s:Color("Number", s:white, s:purple, "NONE")
call s:Color("Boolean", s:white, s:purple, "NONE")
call s:Color("Float", s:white, s:purple, "NONE")

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

call s:Color("Underlined", s:white, s:purple, "underline")

call s:Color("Todo", s:darkolivegreen1, s:grey15, "bold")

call s:Color("ClassName", s:white, s:royalblue1, "bold")

call s:Color("Cursor", s:grey15, s:white, "NONE")
call s:Color("CursorLine", "", "", "underline")
call s:Color("CursorLineNr", "", s:hotpink3, "bold")
call s:Color("LineNr", "", s:grey50, "NONE")

call s:Color("SpecialKey", s:white, s:purple1, "bold")
call s:Color("NonText", s:white, s:grey53, "bold")
"call s:Color("StatusLine", s:, s:, "bold")
"call s:Color("StatusLineNC", s:, s:, "")
"call s:Color("StatusLineTerm", s:, s:, "")
"call s:Color("StatusLineTermNC", s:, s:, "")
call s:Color("Visual", s:slateblue3, s:white, "NONE")
call s:Color("Directory", s:white, s:purple1, "bold")
call s:Color("ErrorMsg", s:red1, s:white, "bold")
call s:Color("IncSearch", s:gold1, "", "bold")
call s:Color("Search", s:gold1, "", "bold")
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
call s:Color("goTypeConstructor", "", s:grey15, "NONE")
call s:Color("goField", "", s:darkorange3, "NONE")

" html
call s:Color("htmlArg", "", s:lightsalmon3, "NONE")
call s:Color("javaScript", "", s:grey15, "NONE")

" javascript
call s:Color("javaScriptBraces", "", s:grey15, "NONE")
call s:Color("javaScriptParens", "", s:grey15, "NONE")
call s:Color("javaScriptDOMObjects", "", s:grey15, "NONE")
call s:Color("javaScriptDOMMethods", "", s:cornflowerblue, "bold")
call s:Color("javaScriptAjaxObjects", "", s:cornflowerblue, "bold")
call s:Color("javaScriptAjaxMethods", "", s:cornflowerblue, "bold")
call s:Color("javaScriptFuncDef", "", s:cornflowerblue, "bold")
call s:Color("javaScriptFuncExp", "", s:cornflowerblue, "bold")
call s:Color("javaScriptHtmlEvents", "", s:cornflowerblue, "bold")
call s:Color("javaScriptHtmlElemAttrs", "", s:darkorange3, "bold")
call s:Color("javaScriptAjaxProperties", "", s:darkorange3, "bold")
call s:Color("javaScriptMessage", "", s:cornflowerblue, "bold")
call s:Color("javaScriptFuncArg", "", s:grey15, "NONE")
call s:Color("javaScriptBrowserObjects", "", s:grey15, "NONE")
call s:Color("javaScriptEndColons", "", s:grey15, "NONE")

" css
call s:Color("StorageClass", "", s:steelblue3, "bold")
call s:Color("cssBraces", "", s:grey15, "NONE")

" java
call s:Color("javaClassDecl", "", s:hotpink3, "bold")
call s:Color("javaScopeDecl", "", s:hotpink3, "bold")
call s:Color("javaStorageClass", "", s:hotpink3, "bold")
