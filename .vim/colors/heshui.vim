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


let s:slatebluedark = ['#5f5faf', '61']
let s:slatebluelight = ['875fff', '99'] " not use

let s:steelbluedark = ['#5f87d7', '68']

let s:green = ['#87af5f', '107']
let s:greenlight = ['#d7ff5f', '191']

let s:purple = ['#8700ff', '93']
let s:purplemedium = ['#af5fd7', '134']
let s:purplelight = ['#8787d7', '104']

let s:browndark = ['#af8700', '136']

let s:reddark = ['#d70000', '160']
let s:redlight = ['#ff0000', '196']

let s:pinkdark = ['#d75f87', '168']
let s:pinklight = ['#ffafaf', '217']
let s:pinkdelete = ['#ffd7ff', '224']

let s:orangedark = ['#ff8700', '208']

let s:gold = ['#ffd700', '220']

let s:white = ['#ffffff', '231']
let s:black = ['#262626', '235']

let s:greydark = ['#444444', '238']
let s:greycomment = ['#808080', '244']
let s:greylight = ['#e4e4e4', '254']
let s:greylightest = ['#eeeeee', '255']

let s:yellowlight = ['#ffffd7', '230']


call s:Color("Normal", s:yellowlight, s:greydark, "NONE")


call s:Color("Define", "", s:pinkdark, "bold")

call s:Color("Comment", "", s:greycomment, "NONE")

call s:Color("Conditional", "", s:purplemedium, "bold")

call s:Color("Constant", "", s:orangedark, "bold")

call s:Color("Function", "", s:purple, "bold")

call s:Color("Identifier", "", s:purple, "bold")

call s:Color("Include", "", s:pinkdark, "bold")

call s:Color("Keyword", "", s:orangedark, "bold")

call s:Color("Operator", "", s:pinkdark, "bold")

call s:Color("PreProc", "", s:pinkdark, "bold")

call s:Color("Repeat", "", s:purplemedium, "bold")

call s:Color("Special", "", s:purple, "bold")

call s:Color("Statement", "", s:purplemedium, "bold")

call s:Color("String", "", s:green, "bold")
call s:Link("Character", "String")

call s:Color("Structure", s:white, s:pinkdark, "bold")

call s:Color("Title", "", s:pinkdark, "bold")

call s:Color("Todo", s:greenlight, s:black, "bold")

call s:Color("Type", "", s:pinkdark, "bold")


call s:Color("Number", "", s:orangedark, "bold")
call s:Color("Boolean", "", s:orangedark, "bold")
call s:Color("Float", "", s:orangedark, "bold")


"call s:Color("Macro", s:white, s:pinkdark, "bold")
"call s:Color("PreCondit", s:white, s:pinkdark, "bold")

"call s:Color("Tag", s:white, s:purple, "bold")
"call s:Color("Delimiter", "", s:purple, "bold")
"call s:Color("SpecialComment", "", s:purple, "bold")
"call s:Color("Debug", s:white, s:purple, "bold")

"call s:Color("Exception", s:white, s:pinkdark, "bold")

"call s:Color("StorageClass", s:white, s:pinkdark, "bold")
"call s:Color("Typedef", s:white, s:pinkdark, "bold")


call s:Color("Cursor", s:black, s:white, "NONE")
call s:Color("CursorLine", s:greylightest, "", "bold")

call s:Color("LineNr", s:yellowlight, s:greycomment, "NONE")
call s:Color("CursorLineNr", "", s:pinkdark, "bold")

"call s:Color("SpecialKey", s:white, s:purple, "bold")
"call s:Color("NonText", "", s:greycomment, "NONE")

call s:Color("Visual", s:slatebluedark, s:white, "NONE")
"call s:Color("VisualNOS", s:slatebluedark, s:white,"bold,underline")

"call s:Color("Directory", s:white, s:purple, "bold")
"call s:Color("Conceal", s:greycomment, s:white, "NONE")
"call s:Color("VertSplit", "", "", "reverse")

call s:Color("IncSearch", s:gold, s:black, "bold")
call s:Color("Search", s:gold, s:black, "bold")

call s:Color("WildMenu", s:greenlight, s:black, "bold")

"call s:Color("Folded", s:white, s:black, "NONE")
"call s:Color("FoldColumn", s:white, "", "NONE")

"call s:Color("DiffAdd", s:green, "", "NONE")
"call s:Color("DiffChange", s:green, "", "NONE")
"call s:Color("DiffDelete", "", s:pinkdelete, "NONE")
"call s:Color("DiffText", "", s:green, "bold")

"call s:Color("Pmenu", s:greylightest, s:black, "NONE")
"call s:Color("PmenuSel", s:greylightest, s:black, "NONE")
"call s:Color("PmenuSbar", s:greylightest, s:black, "NONE")
"call s:Color("PmenuThumb", s:greycomment, "", "NONE")

""call s:Color("StatusLine", s:, s:, "bold")
""call s:Color("StatusLineNC", s:, s:, "")
""call s:Color("StatusLineTerm", s:, s:, "")
""call s:Color("StatusLineTermNC", s:, s:, "")
"call s:Color("TabLine", s:greylight, "", "NONE")
"call s:Color("TabLineFill", s:greylight, "", "NONE")
"call s:Color("TabLineSel", s:black, s:white, "bold")

"call s:Color("MatchParen", s:pinklight, s:white, "NONE")

" vim-go
call s:Link("goTypeName", "ClassName")
call s:Link("goReceiverType", "ClassName")
call s:Link("goFunctionCall", "Function")
call s:Color("goTypeConstructor", "", s:black, "NONE")
call s:Color("goField", "", s:orangedark, "NONE")

" html
call s:Color("htmlArg", "", s:browndark, "NONE")
call s:Color("htmlTag", "", s:reddark, "NONE")
call s:Color("htmlEndTag", "", s:reddark, "NONE")
call s:Color("htmlTagName", "", s:reddark, "NONE")
call s:Color("htmlScriptTag", "", s:reddark, "NONE")
call s:Color("htmlSpecialTagName", "", s:reddark, "NONE")

" javascript
call s:Color("javaScript", "", s:black, "NONE")
call s:Color("javaScriptIdentifier", "", s:purplemedium, "bold")
call s:Color("javaScriptBraces", "", s:black, "NONE")
call s:Color("javaScriptNumber", "", s:purplelight, "bold")
call s:Color("javaScriptMember", "", s:orangedark, "bold")
call s:Color("javaScriptNull", "", s:orangedark, "NONE")
call s:Color("javaScriptFunction", "", s:purplemedium, "bold")
call s:Color("javaScriptConditional", "", s:purplemedium, "bold")
call s:Color("javaScriptRepeat", "", s:purplemedium, "bold")
call s:Color("javaScriptReserved", "", s:purplemedium, "bold")
call s:Color("javaScriptGlobal", "", s:steelbluedark, "NONE")
call s:Color("javaScriptStatement", "", s:reddark, "bold")
"call s:Color("javaScriptParens", "", s:black, "NONE")
"call s:Color("javaScriptDOMObjects", "", s:black, "NONE")
"call s:Color("javaScriptDOMMethods", "", s:cornflowerblue, "bold")
"call s:Color("javaScriptAjaxObjects", "", s:cornflowerblue, "bold")
"call s:Color("javaScriptAjaxMethods", "", s:cornflowerblue, "bold")
"call s:Color("javaScriptFuncDef", "", s:cornflowerblue, "bold")
"call s:Color("javaScriptFuncExp", "", s:cornflowerblue, "bold")
"call s:Color("javaScriptHtmlEvents", "", s:cornflowerblue, "bold")
"call s:Color("javaScriptHtmlElemAttrs", "", s:orangedark, "bold")
"call s:Color("javaScriptAjaxProperties", "", s:orangedark, "bold")
"call s:Color("javaScriptMessage", "", s:cornflowerblue, "bold")
"call s:Color("javaScriptFuncArg", "", s:black, "NONE")
"call s:Color("javaScriptBrowserObjects", "", s:black, "NONE")
"call s:Color("javaScriptEndColons", "", s:black, "NONE")

" css
call s:Color("StorageClass", "", s:steelbluedark, "bold")
call s:Color("cssBraces", "", s:black, "NONE")

" java
call s:Color("javaAccessKeyword", "", s:purplemedium, "bold")
call s:Color("javaStructure", "", s:purplemedium, "bold")
call s:Color("javaBraces", "", s:purplemedium, "bold")
call s:Color("javaParenT", "", s:purplemedium, "bold")
call s:Color("javaInParen", "", s:purplemedium, "bold")
call s:Color("javaIdentifier", "", s:greydark, "NONE")
call s:Color("javaExternal", "", s:purplemedium, "bold")
call s:Color("javaClassDecl", "", s:purplemedium, "bold")
call s:Color("javaScopeDecl", "", s:purplemedium, "bold")
call s:Color("javaStatement", "", s:reddark, "bold")
call s:Color("javaFuncDef", "", s:pinkdark, "bold")
call s:Color("javaFunction", "", s:pinkdark, "bold")
call s:Color("javaStorageClass", "", s:purplemedium, "bold")
call s:Color("javaC_JavaLang", "", s:steelbluedark, "bold")
call s:Color("javaType", "", s:steelbluedark, "bold")
call s:Color("javaString", "", s:green, "bold")
call s:Link("javaCharacter", "javaString")

