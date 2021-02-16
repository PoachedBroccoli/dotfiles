" ========================================================================
" 快捷键映射配置
" ========================================================================
let mapleader = ","
let g:mapleader = ","

" ctrl c、esc、crtl [ 都不方便
inoremap jk <esc>

" 保存退出
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q!<CR>

inoremap { {<CR>}<ESC>O

" 取消高亮
nnoremap <silent> <BS> :nohlsearch<CR>

" ctrl h没了难受，暂时用x代替。。。
inoremap <C-x> <BS>

" 编辑模式中移动
inoremap <C-h> <LEFT>
inoremap <C-j> <DOWN>
inoremap <C-k> <UP>
inoremap <C-l> <RIGHT>
inoremap <C-a> <Home>
inoremap <C-e> <End>

" 普通模式下插入空行
nmap <silent> to :call append('.', '')<CR>j
nmap <silent> tO :call append(line('.')-1, '')<CR>k

" 上移下移，代码中偶尔用到，映射一下方便一点
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
" 其他
" ========================================================================
set nocompatible    " 关闭兼容模式

set noswapfile

autocmd BufWritePre * :%s/\s\+$//e " 删除行尾空格和tab

autocmd BufWritePost $MYVIMRC source $MYVIMRC  " 实时重载配置

" ========================================================================
" 样式检查配置
" ========================================================================
" 获取当前
function! <SID>SynStack()
    echo map(synstack(line('.'),col('.')),'synIDattr(v:val, "name")')
endfunc
nnoremap <leader>ss :call <SID>SynStack()<CR>

" 获取当前并且父
function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
nnoremap <leader>sb :call SynGroup()<CR>

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

" ========================================================================
" 滚动配置
" ========================================================================
set scrolloff=5 " 最上最下留5行

" ========================================================================
" 剪贴板配置
" ========================================================================
" 将文本块复制至系统剪贴板
noremap <Leader>y "*y
" 将系统剪贴板内容粘贴至vim
noremap <Leader>p "*p
noremap <Leader>P "0p
set clipboard+=unnamed  " 连接 vim 和系统的剪贴板

" ========================================================================
" 显示配置
" ========================================================================
set number         " 显示行号，缩写su
set ruler          " 用于显示当前光标所在的位置的行号和列号(逗号分割)。在最右端显示文本在文件红的相对位置
set relativenumber " 显示从当前行数的前后行数
set cursorline     " 高亮显示当前行，缩写cuc
"set cursorcolumn    " 高亮显示当前列
set wrap           " 自动换行
set showcmd        " 显示指令，屏幕最后一行显示(部分)命令
set showmode       " 在插入、替换和可视模式，最后一行提供消息
set wildmenu       " 命令补全
set wildmode=longest:list,full
set list           " 显示空白文字
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%  " 空白符号

" ========================================================================
" 查找配置
" ========================================================================
set hlsearch    " 高亮显示搜索
set incsearch   " 动态高亮搜索
set ignorecase  " 不区分大小写搜索
set smartcase   " 智能大小写搜索，输入大写就会判定当前搜索区分大小写
set showmatch   " 高亮显示匹配的括号
set matchtime=1 " 匹配括号高亮的时间（单位是十分之一秒）

" ========================================================================
" 状态栏配置
" ========================================================================
set laststatus=2    " vim 永远显示状态

" ========================================================================
" 缩进配置
" ========================================================================
set tabstop=4             " tab字符显示宽度，不修改tab键行为，4个空格作为一个tab
set softtabstop=4         " 修改tab键行为，不修改tab字符显示宽度，一个tab视为输入4个空格
set shiftwidth=4          " 换行，普通模式下的<< >>，输入模式下的CTRL+D｜CTRL+T，进行缩进为4个空格
set expandtab             " 将制表符替换为空格：插入模式下tab都是空格。
set autoindent            " 继承前一行的缩进方式，适用于多行注释
set copyindent            " 复制粘贴时保留原有的缩进
filetype plugin indent on " 自适应不同语言的智能缩进

" ========================================================================
" 语法配置
" ========================================================================
syntax enable   " 语法高亮
syntax on       " 允许使用指定语法高亮配色方案替换默认方案

" ========================================================================
" 文件类型设置
" ========================================================================
filetype on               " 检测文件类型
filetype plugin on        " 针对不同的文件类型加载对应的插件
filetype indent on        " 针对不同的文件类型采用不同的缩进格式
filetype plugin indent on " 启用自动补全

" ========================================================================
" 编辑配置
" ========================================================================
set backspace=eol,start,indent  " 修正 vim 删除/退格键行为

" ========================================================================
" 编码设置
" ========================================================================
set encoding=utf-8                                              " 编码设置，vim内部使用的字符编码，用于缓存的文本、寄存器、Vim 脚本文件
" vim 启动的时候会依次使用本配置中的编码对文件内容进行解码
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936,shift-jis " 编码设置，字符编码的列表，检测文件编码时的备选字符编码列表
set termencoding=utf-8                                     " 用于输出到终端时采用的编码类型
set fileformats=unix,dos,mac                               " 换行符

" ========================================================================
" 插件配置
" ========================================================================
call plug#begin('~/.vim/plugged')

" 可以快速对齐的插件，支持的分隔符: <Space> = : . | & # ,
Plug 'junegunn/vim-easy-align'

" 注释
Plug 'preservim/nerdcommenter'

" 方便加对称符号
Plug 'tpope/vim-surround'

" 用来提供一个导航目录的侧边栏
Plug 'preservim/nerdtree'

" 可以使 nerdtree 的 tab 更加友好些
Plug 'jistr/vim-nerdtree-tabs'

" 可以在导航目录中看到 git 版本信息
Plug 'Xuyuanp/nerdtree-git-plugin'

" 查看当前代码文件中的变量和函数列表的插件，
" 可以切换和跳转到代码中对应的变量和函数的位置
" 大纲式导航, Go 需要 https://github.com/jstemmer/gotags 支持
" go get -u github.com/jstemmer/gotags
Plug 'majutsushi/tagbar'

" Vim状态栏插件，包括显示行号，列号，文件类型，文件名，以及Git状态
Plug 'vim-airline/vim-airline'

" 代码自动完成，安装完插件还需要额外配置才可以使用
Plug 'Valloric/YouCompleteMe'

" 可以在文档中显示 git 信息
Plug 'airblade/vim-gitgutter'

" 下面两个插件要配合使用，可以自动生成代码块
" 引擎
Plug 'SirVer/ultisnips'
" 代码块合集，通过添加自定义代码块，提高优先级，可覆盖honza/vim-snippets
Plug 'honza/vim-snippets'

" go 主要插件
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" go 中的代码追踪，输入 gd 就可以自动跳转
Plug 'dgryski/vim-godef'

" html
Plug 'hail2u/vim-css3-syntax'
Plug 'gko/vim-coloresque'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'

" javascript
Plug 'jelera/vim-javascript-syntax'

" typescript
Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'

" vuejs
Plug 'posva/vim-vue'
Plug 'leafOfTree/vim-vue-plugin'

" python
Plug 'davidhalter/jedi-vim'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

" markdown 插件
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'

" 缩进可视
Plug 'Yggdroot/indentLine'

call plug#end()


" ========================================================================
" nerdcommenter 插件
" ========================================================================
let g:NERDSpaceDelims = 1

" ========================================================================
" vim-easy-align 插件
" ========================================================================
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
let g:easy_align_delimiters = {
            \ '/': {
            \     'pattern':         '//\+\|/\*\|\*/',
            \     'delimiter_align': 'l'
            \   },
            \ '#': {
            \     'pattern':         '#',
            \     'delimiter_align': 'l'
            \   }
            \ }

" ========================================================================
" NERDTree 插件
" ========================================================================
" 打开和关闭NERDTree快捷键
map <F10> :NERDTreeToggle<CR>
nmap <C-m> :NERDTreeFind<CR>

" 设置宽度
let NERDTreeWinSize=35
" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 打开文件时是否显示目录
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 忽略一下文件的显示
" let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 打开 vim 文件及显示书签列表
let NERDTreeShowBookmarks=2
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" git文件标注修改
let g:NERDTreeGitStatusIndicatorMapCustom= {
            \ "Modified"  : "✹",
            \ "Staged"    : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"   : "➜",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "✖",
            \ "Dirty"     : "✗",
            \ "Clean"     : "✔︎",
            \ "Unknown"   : "?"
            \ }

" ========================================================================
" tagbar 插件
" ========================================================================
nmap <F9> :TagbarToggle<CR>
let g:tagbar_type_go = {
            \ 'ctagstype' : 'go',
            \ 'kinds'     : [
            \ 'p:package',
            \ 'i:imports:1',
            \ 'c:constants',
            \ 'v:variables',
            \ 't:types',
            \ 'n:interfaces',
            \ 'w:fields',
            \ 'e:embedded',
            \ 'm:methods',
            \ 'r:constructor',
            \ 'f:functions'
            \ ],
            \ 'sro' : '.',
            \ 'kind2scope' : {
                \ 't' : 'ctype',
                \ 'n' : 'ntype'
                \ },
                \ 'scope2kind' : {
                    \ 'ctype' : 't',
                    \ 'ntype' : 'n'
                    \ },
                    \ 'ctagsbin'  : 'gotags',
                    \ 'ctagsargs' : '-sort -silent'
                    \ }

set tags=tags;

" ========================================================================
" vim-go 插件
" ========================================================================
let g:go_fmt_command = "goimports" " 格式化将默认的 gofmt 替换
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_version_warning = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_extra_types = 1
let g:godef_split=2

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

" 直接通过 go run 执行当前文件
autocmd FileType go nmap <leader>r :GoRun %<CR>

" ========================================================================
" html
" ========================================================================
autocmd Filetype html setlocal ts=2 sw=2 expandtab

" ========================================================================
" javascript
" ========================================================================
let g:javascript_enable_domhtmlcss = 1
autocmd FileType javascript setl tabstop=4|setl shiftwidth=4|setl expandtab softtabstop=4

" ========================================================================
" typescript
" ========================================================================
let g:yats_host_keyword = 1

" ========================================================================
" vue
" ========================================================================
let g:vue_disable_pre_processors=1
let g:vim_vue_plugin_load_full_syntax = 1

" ========================================================================
" python
" ========================================================================
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
      \ formatoptions+=croq softtabstop=4
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with

let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings = 0

let python_highlight_all = 1

" ========================================================================
" youcompleteme 插件
" ========================================================================
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']

" ========================================================================
" Snip 插件
" ========================================================================
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

" ========================================================================
" 主题配置
" ========================================================================
set t_Co=256

set background=light
colorscheme heshui

" ========================================================================
" markdown配置
" ========================================================================
autocmd BufRead,BufNew *.md,*.mkd,*.markdown set filetype=markdown.mkd

" ========================================================================
" indentLine 插件
" ========================================================================
"let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_char = '┊'

" ========================================================================
" sh文件配置
" ========================================================================
autocmd BufNewFile *.sh   exec ":call SHHeader()"
func SHHeader()
    call setline(1,"#!/usr/bin/env bash")
endfunc

