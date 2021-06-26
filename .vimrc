scriptencoding utf-8

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,gbk,gb2312,big5,shift-jis,latin1

set fileformats=unix,dos,mac

syntax enable
syntax on

filetype on
filetype plugin on
filetype indent on
filetype plugin indent on

" ========================================================================
" theme
" ========================================================================
set t_Co=256
set background=light
colorscheme heshui

" ========================================================================
" mapping
" ========================================================================
let g:mapleader = ","

" ctrl c、esc、crtl [
inoremap jk <esc>

" save exit discard changes
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q!<CR>

inoremap { {<CR>}<ESC>O

" Clear highlighting
nnoremap <BS> :nohlsearch<CR>

" Use ctrl h in insert-mode move,use ctrl x instead of curl h
inoremap <C-x> <BS>

" Move in insert mode
inoremap <C-h> <LEFT>
inoremap <C-j> <DOWN>
inoremap <C-k> <UP>
inoremap <C-l> <RIGHT>
inoremap <C-a> <Home>
inoremap <C-e> <End>

" Go to start or end of line
nnoremap <Leader>H 0
nnoremap <Leader>hh ^
nnoremap <Leader>L $
nnoremap <Leader>l g_

" Insert blankline
nnoremap <CR> :call append('.', '')<CR>j
nnoremap <S-CR> :call append(line('.')-1, '')<CR>k

" move up move down
if has('win32')
    nnoremap <A-j> :m .+1<CR>==
    nnoremap <A-k> :m .-2<CR>==
    inoremap <A-j> <Esc>:m .+1<CR>==gi
    inoremap <A-k> <Esc>:m .-2<CR>==gi
    vnoremap <A-j> :m '>+1<CR>gv=gv
    vnoremap <A-k> :m '<-2<CR>gv=gv
"elseif has('unix')
elseif has('mac')
    nnoremap ∆ :m .+1<CR>==
    nnoremap ˚ :m .-2<CR>==
    inoremap ∆ <Esc>:m .+1<CR>==gi
    inoremap ˚ <Esc>:m .-2<CR>==gi
    vnoremap ∆ :m '>+1<CR>gv=gv
    vnoremap ˚ :m '<-2<CR>gv=gv
endif

" ========================================================================
" other
" ========================================================================
set scrolloff=5

set nobackup       " No backup files
set noswapfile     " No swap files
set nowritebackup  " Only in case you don't want a backup file while editing
"set noundofile     " no undo files

autocmd BufWritePre * :%s/\s\+$//e " Delete trailing space or tab before write file

autocmd BufWritePost $MYVIMRC source $MYVIMRC  " Real time reload

" ========================================================================
" style
" ========================================================================
" Get style
function! <SID>SynStack()
    echo map(synstack(line('.'),col('.')),'synIDattr(v:val, "name")')
endfunc
nnoremap <leader>ss :call <SID>SynStack()<CR>

" Get style in current and parent
function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
nnoremap <leader>sb :call SynGroup()<CR>

" Get style in current and parent
function! SynStackN()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
nnoremap <leader>sn :call SynStackN()<CR>

map <F5> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

map <F4> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") .
            \ "> trans<" . synIDattr(synID(line("."),col("."),0),"name") .
            \ "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") .
            \ "> fg:" .synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>


" ========================================================================
" Clipboard
" ========================================================================
set clipboard+=unnamed

" ========================================================================
" show
" ========================================================================
set number
set ruler
"set relativenumber
set cursorline
"set cursorcolumn
set wrap
set showcmd
set showmode
set wildmenu
set wildmode=longest:list,full
set list
set listchars=tab:»-,trail:-,eol:$,extends:»,precedes:«,nbsp:%

" ========================================================================
" search
" ========================================================================
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
set matchtime=1

" ========================================================================
" status
" ========================================================================
set laststatus=2

" ========================================================================
" indentation
" ========================================================================
set expandtab             " 改变tab键行为，tab->space

set tabstop=4             " tab字符显示宽度，不修改tab键行为，4个空格作为一个tab(一个tab显示多少个空格)
set softtabstop=4         " 修改tab键行为，不修改tab字符显示宽度，按下一个tab视为输入4个空格

set shiftwidth=4          " 换行的缩进列数，普通模式下的<< >>，输入模式下的CTRL+D｜CTRL+T，进行缩进为4个空格

set autoindent            " 继承前一行的缩进方式，适用于多行注释
set copyindent            " 复制粘贴时保留原有的缩进

"" ========================================================================
"" two space
"" ========================================================================
autocmd Filetype javascript,html,css,xml,yaml,json,proto,sql setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

"" ========================================================================
"" four space
"" ========================================================================
autocmd FileType javascript,python,java setlocal expandtab tabstop=4 shiftwidth=4  softtabstop=4

"" ========================================================================
"" markdown
"" ========================================================================
"autocmd BufRead,BufNew *.md,*.mkd,*.markdown set filetype=markdown.mkd
"

" ========================================================================
" edit
" ========================================================================
set backspace=eol,start,indent

set spell

" ========================================================================
" 插件配置
" ========================================================================
"call plug#begin('~/.vim/plugged')
"
"" 可以快速对齐的插件，支持的分隔符: <Space> = : . | & # ,
"Plug 'junegunn/vim-easy-align'
"
"" 注释
"Plug 'preservim/nerdcommenter'
"
"" 方便加对称符号
"Plug 'tpope/vim-surround'
"
"" 用来提供一个导航目录的侧边栏
"Plug 'preservim/nerdtree'
"
"" 可以使 nerdtree 的 tab 更加友好些
"Plug 'jistr/vim-nerdtree-tabs'
"
"" 可以在导航目录中看到 git 版本信息
"Plug 'Xuyuanp/nerdtree-git-plugin'
"
"Plug 'majutsushi/tagbar'
"
"" Vim状态栏插件，包括显示行号，列号，文件类型，文件名，以及Git状态
"Plug 'vim-airline/vim-airline'
"
"" 可以在文档中显示 git 信息
"Plug 'airblade/vim-gitgutter'
"
"" 下面两个插件要配合使用，可以自动生成代码块
"" 引擎
"Plug 'SirVer/ultisnips'
"" 代码块合集，通过添加自定义代码块，提高优先级，可覆盖honza/vim-snippets
"Plug 'honza/vim-snippets'
"
"" go 主要插件
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"" go 中的代码追踪，输入 gd 就可以自动跳转
"Plug 'dgryski/vim-godef'
"
"" 缩进可视
"Plug 'Yggdroot/indentLine'
"
"call plug#end()
"
"" ========================================================================
"" nerdcommenter 插件
"" ========================================================================
"let g:NERDSpaceDelims = 1
"
"" ========================================================================
"" vim-easy-align 插件
"" ========================================================================
"xmap ga <Plug>(EasyAlign)
"nmap ga <Plug>(EasyAlign)
"let g:easy_align_delimiters = {
"            \ '/': {
"            \     'pattern':         '//\+\|/\*\|\*/',
"            \     'delimiter_align': 'l'
"            \   },
"            \ '#': {
"            \     'pattern':         '#',
"            \     'delimiter_align': 'l'
"            \   }
"            \ }
"
"" ========================================================================
"" NERDTree 插件
"" ========================================================================
"" 打开和关闭NERDTree快捷键
"map <F10> :NERDTreeToggle<CR>
"nmap <C-m> :NERDTreeFind<CR>
"
"" 设置宽度
"let NERDTreeWinSize=35
"" 显示行号
"let NERDTreeShowLineNumbers=1
"let NERDTreeAutoCenter=1
"" 打开文件时是否显示目录
"let NERDTreeAutoCenter=1
"" 是否显示隐藏文件
"let NERDTreeShowHidden=1
"" 忽略一下文件的显示
"" let NERDTreeIgnore=['\.pyc','\~$','\.swp']
"" 打开 vim 文件及显示书签列表
"let NERDTreeShowBookmarks=2
"" 在终端启动vim时，共享NERDTree
"let g:nerdtree_tabs_open_on_console_startup=1
"" git文件标注修改
"let g:NERDTreeGitStatusIndicatorMapCustom= {
"            \ "Modified"  : "✹",
"            \ "Staged"    : "✚",
"            \ "Untracked" : "✭",
"            \ "Renamed"   : "➜",
"            \ "Unmerged"  : "═",
"            \ "Deleted"   : "✖",
"            \ "Dirty"     : "✗",
"            \ "Clean"     : "✔︎",
"            \ "Unknown"   : "?"
"            \ }
"
"" ========================================================================
"" tagbar 插件
"" ========================================================================
"nmap <F9> :TagbarToggle<CR>
"let g:tagbar_type_go = {
"            \ 'ctagstype' : 'go',
"            \ 'kinds'     : [
"            \ 'p:package',
"            \ 'i:imports:1',
"            \ 'c:constants',
"            \ 'v:variables',
"            \ 't:types',
"            \ 'n:interfaces',
"            \ 'w:fields',
"            \ 'e:embedded',
"            \ 'm:methods',
"            \ 'r:constructor',
"            \ 'f:functions'
"            \ ],
"            \ 'sro' : '.',
"            \ 'kind2scope' : {
"                \ 't' : 'ctype',
"                \ 'n' : 'ntype'
"                \ },
"                \ 'scope2kind' : {
"                    \ 'ctype' : 't',
"                    \ 'ntype' : 'n'
"                    \ },
"                    \ 'ctagsbin'  : 'gotags',
"                    \ 'ctagsargs' : '-sort -silent'
"                    \ }
"
"set tags=tags;
"
"" ========================================================================
"" vim-go 插件
"" ========================================================================
"let g:go_fmt_command = "goimports" " 格式化将默认的 gofmt 替换
"let g:go_autodetect_gopath = 1
"let g:go_list_type = "quickfix"
"let g:go_version_warning = 1
"let g:go_highlight_types = 1
"let g:go_highlight_fields = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_functions = 1
"let g:go_highlight_function_calls = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_structs = 1
"let g:go_highlight_generate_tags = 1
"let g:go_highlight_extra_types = 1
"let g:godef_split=2
"
"autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
"
"" 直接通过 go run 执行当前文件
"autocmd FileType go nmap <leader>r :GoRun %<CR>
"
"" ========================================================================
"" Snip 插件
"" ========================================================================
"let g:UltiSnipsExpandTrigger="<Tab>"
"let g:UltiSnipsJumpForwardTrigger="<Tab>"
"let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
"
"" ========================================================================
"" indentLine 插件
"" ========================================================================
""let g:indentLine_char_list = ['|', '¦', '┆', '┊']
"let g:indentLine_char = '┊'
"let g:indentLine_bgcolor_term = 231
"let g:indentLine_bgcolor_gui = '#FFFFFF'

" ========================================================================
" sh
" ========================================================================
autocmd BufNewFile *.sh   exec ":call SHHeader()"
func SHHeader()
    call setline(1,"#!/usr/bin/env bash")
endfunc
