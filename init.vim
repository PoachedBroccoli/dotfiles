
" file {{{
set encoding=utf-8                                                                    " 内部使用的编码方式
set fileencoding=utf-8                                                                " 多子节文本的文件编码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,gbk,gb2312,big5,euc-jp,shift-jis,latin1 " 打开文件时自动尝试的顺序
set fileformats=unix,dos,mac                                                          " 参与自动检测的 'fileformat' 的格式
" }}} file


" python path {{{
" pip3 install neovim --upgrade
" let g:python3_host_prog = '/usr/local/bin/python3'
let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python'
" :CheckHealth

" }}} python path


" syntax {{{
syntax enable             " 开启语法高亮
syntax on                 " 自动语法高亮
filetype plugin indent on " 开启文件类型检测，加载对应文件类型的插件
" }}} syntax


" mapping {{{
let g:mapleader = ","
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q!<CR>
nnoremap <BS> :nohlsearch<CR>
inoremap jk <esc>
" use vim default : <C-x> <C-f> path autocomplete
"inoremap <C-x> <BS>
inoremap <C-h> <LEFT>
inoremap <C-j> <DOWN>
inoremap <C-k> <UP>
inoremap <C-l> <RIGHT>
" use vim default : insert last text
"inoremap <C-a> <Home>
" use vim default : close autocomplete
"inoremap <C-e> <End>
" 行首行尾
nnoremap <Leader>H 0
nnoremap <Leader>L $
nnoremap <Leader>hh ^
nnoremap <Leader>l g_
" 不想修改gcmt/wildfire.vim enter的快捷键
"nnoremap <CR> :call append('.', '')<CR>j
"nnoremap <S-CR> :call append(line('.')-1, '')<CR>k
" 上下移动
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
" 生效配置文件
"autocmd BufWritePost $MYVIMRC source $MYVIMRC  " Real time reload
"map <leader>rv :source $MYVIMRC<CR>  " Real time reload
" duplicate words
map <leader>fd /\(\<\w\+\>\)\_s*\1
" }}} mapping


" some behaviors {{{
"set splitright
set lazyredraw                              " 执行宏时不重画
set mouse=a
set signcolumn=yes                          " 侧边栏
set showtabline=2                           " 显示标签页行
set errorformat+=[%f:%l]\ ->\ %m,[%f:%l]:%m " 错误文件行格式的描述
set path+=**                                " gf 等命令搜索用的目录列表
set hidden                                  " 当缓冲区被放弃 ( abandon ) 时不卸载之
set updatetime=300                          " 刷新交换文件所需的毫秒数
set backspace=eol,start,indent              " 回删
set scrolloff=5                             " 上下保留5行
set nobackup                                " No backup files
set noswapfile                              " No swap files
set nowritebackup                           " Only in case you don't want a backup file while editing
set shortmess+=c                            " 缩短消息长度的标志位列表
set clipboard+=unnamed                      " Clipboard
set number                                  " 行号
set ruler                                   " 标尺信息
"set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)
                                            " set relativenumber
set cursorline                              " 高亮当前行
                                            " set cursorcolumn
set colorcolumn=120
set nowrap                                  " 关闭自动换行
set showcmd                                 " 在状态行里显示 (部分) 命令
set showmode                                " 在状态行上显示当前模式的消息
set wildmenu                                " 命令行自动补全所使用的菜单
set wildmode=longest:list,full              " 命令行扩展所用的模式
set list
                                            " set listchars=tab:»-,trail:-,eol:$,extends:»,precedes:«,nbsp:%
                                            " set listchars=tab:▸\ ,trail:-,eol:$,extends:»,precedes:«,nbsp:%
                                            " set listchars=tab:▸-,trail:-,eol:$,extends:»,precedes:«,nbsp:%
set listchars=tab:\|\ ,trail:-,eol:$,extends:»,precedes:«,nbsp:%

set hlsearch                                " 高亮显示搜索结果
set incsearch                               " 实时搜索高亮
set ignorecase                              " 忽略大小写
set smartcase                               " 智能大小写
set showmatch                               " 插入括号时短暂跳转到匹配的括号
set matchtime=1                             " 显示匹配括号的时间 (以十分之一秒计)
set laststatus=2                            " 两行状态栏
set statusline=%F\ %{WebDevIconsGetFileTypeSymbol()}\ %h%w%m%r\ %=%(%Y\ %{&fileformat}\ %{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}\ #%n\ %o\ %l/%L,%c%V\ [asc=%03.3b]\ [hex=%02.2B]\ %=\ %P%)
set expandtab                               " 改变tab键行为，tab->space
set tabstop=4                               " tab字符显示宽度，不修改tab键行为，4个空格作为一个tab(一个tab显示多少个空格)
set softtabstop=4                           " 修改tab键行为，不修改tab字符显示宽度，按下一个tab视为输入4个空格
set shiftwidth=4                            " 换行的缩进列数，普通模式下的<< >>，输入模式下的CTRL+D｜CTRL+T，进行缩进为4个空格
set autoindent                              " 继承前一行的缩进方式，适用于多行注释
set copyindent                              " 复制粘贴时保留原有的缩进
set cindent                                 " C/C++ 语言缩进优化
" }}} some behaviors


" autocmd {{{
" 自动更新文件
autocmd FocusGained,BufEnter * :silent! !
autocmd BufWritePre * :%s/\s\+$//e                                                                                   " Delete trailing space or tab before write file
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif | normal! zvzz     " last edit
autocmd Filetype javascript,html,css,xml,yaml,json,proto,sql setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2 " two space wide
autocmd FileType go,python,java,kotlin,scala setlocal expandtab tabstop=4 shiftwidth=4  softtabstop=4                " four space wide
" }}} autocmd


" tips {{{
" 编辑vimrc文件
nnoremap <leader><leader>e :edit $MYVIMRC<cr>
" use %normal! to do something.....what you want for all line
" :%normal! @q
" in test the default <C-i> is a tab behavior
" find placeholder and change it
map <leader><Space> <Esc>/<---><CR>:nohlsearch<CR>c5l
" figlet some words
map <leader>tx :r !figlet
" Compile function
noremap <leader>run :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        set splitright
        exec "!g++ -std=c++11 % -Wall -o %<"
        :vsp
        :res -15
        :term ./%<
    elseif &filetype == 'python'
        set splitright
        :vsp
        :term python3 %
    elseif &filetype == 'markdown'
        exec "MarkdownPreview"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'html'
        silent! exec "!".g:mkdp_browser." % &"
    elseif &filetype == 'go'
        set splitright
        :vsp
        :term go run %
    elseif &filetype == 'vue'
        set splitright
        :vsp
        :term npm run build
    elseif &filetype == 'rust'
        "exec "!cargo run"
        exec "!rustc % -o %<"
        exec "!time ./%<"
    endif
endfunc
" }}} tips


"set splitright

" window {{{
" 快捷键上下分割：<C-w>s
" 快捷键左右分割：<C-w>v

" 垂直分割相同内容到左边
map <leader>sh :set nosplitright<CR>:vsplit<CR>

" 垂直分割相同内容到右边
map <leader>sl :set splitright<CR>:vsplit<CR>

" 垂直分割空白内容到左边
map <leader>sH :set nosplitright<CR>:vnew<CR>

" 垂直分割空白内容到右边
map <leader>sL :set splitright<CR>:vnew<CR>

" 垂直分割相同内容到上边
map <leader>sk :set nosplitbelow<CR>:split<CR>

" 垂直分割相同内容到下边
map <leader>sj :set splitbelow<CR>:split<CR>

" 垂直分割空白内容到上边
map <leader>sK :set nosplitbelow<CR>:new<CR>

" 垂直分割空白内容到下边
map <leader>sJ :set splitbelow<CR>:new<CR>

" 窗口大小
map <up>    :res +2<CR>
map <down>  :res -2<CR>
map <left>  :vertical resize-2<CR>
map <right> :vertical resize+2<CR>
" }}} window


" terminal {{{
" Opening a terminal window
noremap <leader>/ :set splitbelow<CR>:split<CR>:res -30<CR>:term<CR>
tnoremap <Esc> <C-\><C-n>
" }}} terminal


" tab {{{
map <leader>tn :tabedit<CR>
map <leader>. :+tabnext<CR>
map <leader>m :-tabnext<CR>
map <leader>th :-tabmove<CR>
map <leader>tl :+tabmove<CR>
" }}} tab


" buffer {{{
map <leader><leader>d :bdelete<CR>
map <leader><leader>m :bprevious<CR>
map <leader><leader>. :bnext<CR>
" }}} buffer


" plugins {{{
call plug#begin('~/.vim/plugged')

"Plug 'codota/tabnine-vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" coc-java-dependency need
Plug 'uzxmx/vim-widgets'

" workspace rooter
Plug 'airblade/vim-rooter'

" 文件跳转
Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'antoinemadec/coc-fzf'

" 文件跳转
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'pechorin/any-jump.vim'

Plug 'puremourning/vimspector'

" taglist
Plug 'liuchengxu/vista.vim'

Plug 'christoomey/vim-tmux-navigator'

Plug 'Chiel92/vim-autoformat'

" coc also has multi maybe not need
Plug 'mg979/vim-visual-multi'

Plug 'luochen1990/rainbow'

Plug 'ap/vim-css-color'

Plug 'Yggdroot/indentLine'

"Plug 'jiangmiao/auto-pairs'

Plug 'easymotion/vim-easymotion'

"Plug 'luochen1990/rainbow'

Plug 'preservim/nerdcommenter'

" combine the following two plugins will be more quickly
Plug 'gcmt/wildfire.vim'
Plug 'tpope/vim-surround'

"Plug 'turbio/bracey.vim'
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}

Plug 'mhinz/vim-startify'

" db
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'

"Plug 'artur-shaik/vim-javacomplete2'

"" 可以快速对齐的，支持的分隔符: <Space> = : . | & # ,
Plug 'junegunn/vim-easy-align'

"Plug 'sheerun/vim-polyglot'

"Plug 'majutsushi/tagbar'

" Vim状态栏，包括显示行号，列号，文件类型，文件名，以及Git状态
"Plug 'vim-airline/vim-airline'

" show change
Plug 'airblade/vim-gitgutter'
" git
Plug 'tpope/vim-fugitive'

" go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Markdown
" npm -g install instant-markdown-d
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}

"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
"Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
"Plug 'vimwiki/vimwiki'

Plug 'ryanoasis/vim-devicons'

call plug#end()
" }}} plugins


" coc.nvim {{{

highlight CocErrorSign ctermfg=15 ctermbg=196 cterm=bold
highlight CocWarningSign ctermfg=0 ctermbg=172

" find something :CocList
" search coc_extensions :CocList marketplace

" auto download extensions instead of manual :CocInstall coc-json ...

let g:coc_global_extensions = [
    \ 'coc-actions',
    \ 'coc-ci',
    \ 'coc-css',
    \ 'coc-db',
    \ 'coc-diagnostic',
    \ 'coc-docker',
    \ 'coc-emmet',
    \ 'coc-eslint',
    \ 'coc-explorer',
    \ 'coc-fish',
    \ 'coc-floaterm',
    \ 'coc-format-json',
    \ 'coc-fs-lists',
    \ 'coc-fzf-preview',
    \ 'coc-git',
    \ 'coc-gitignore',
    \ 'coc-go',
    \ 'coc-gocode',
    \ 'coc-highlight',
    \ 'coc-html',
    \ 'coc-html-css-support',
    \ 'coc-import-cost',
    \ 'coc-java',
    \ 'coc-java-debug',
    \ 'coc-java-lombok',
    \ 'coc-java-dependency',
    \ 'coc-java-intellicode',
    \ 'coc-java-vimspector',
    \ 'coc-jedi',
    \ 'coc-jest',
    \ 'coc-json',
    \ 'coc-julia',
    \ 'coc-kotlin',
    \ 'coc-kotlin-dev',
    \ 'coc-leetcode',
    \ 'coc-lines',
    \ 'coc-lists',
    \ 'coc-lua',
    \ 'coc-markdownlint',
    \ 'coc-marketplace',
    \ 'coc-neosnippet',
    \ 'coc-pairs',
    \ 'coc-perl',
    \ 'coc-powershell',
    \ 'coc-prettier',
    \ 'coc-protobuf',
    \ 'coc-pyright',
    \ 'coc-rls',
    \ 'coc-rust-analyzer',
    \ 'coc-scssmodules',
    \ 'coc-sh',
    \ 'coc-zi',
    \ 'coc-smartf',
    \ 'coc-snippets',
    \ 'coc-sourcekit',
    \ 'coc-sql',
    \ 'coc-stylelint',
    \ 'coc-svg',
    \ 'coc-swagger',
    \ 'coc-syntax',
    \ 'coc-tag',
    \ 'coc-tailwindcss',
    \ 'coc-tasks',
    \ 'coc-terminal',
    \ 'coc-toml',
    \ 'coc-translator',
    \ 'coc-tslint-plugin',
    \ 'coc-tsserver',
    \ 'coc-ultisnips',
    \ 'coc-vetur',
    \ 'coc-vimlsp',
    \ 'coc-webpack',
    \ 'coc-word',
    \ 'coc-xml',
    \ 'coc-yaml',
    \ 'coc-yank',
    \ 'https://github.com/rodrigore/coc-tailwind-intellisense']

    " \ 'coc-metals',

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <C-q> to trigger completion.
inoremap <silent><expr> <C-q> coc#refresh()
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

" jump to error
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [e <Plug>(coc-diagnostic-prev)
nmap <silent> ]e <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> <space>gd <Plug>(coc-definition)
nmap <silent> <space>gy <Plug>(coc-type-definition)
nmap <silent> <space>gi <Plug>(coc-implementation)
nmap <silent> <space>gr <Plug>(coc-references)
nmap <silent> <space>rn <Plug>(coc-rename)
nmap <silent> <space>rf <Plug>(coc-refactor)
nmap <silent> <space>qf <Plug>(coc-fix-current)

nmap <space>ca <Plug>(coc-codeaction)
nmap <space>cl <Plug>(coc-codelens-action)

" quick suggest
xmap <space>l  <Plug>(coc-codeaction-selected)
nmap <space>l  <Plug>(coc-codeaction-selected)

" Formatting selected code.
xmap <space>fc <Plug>(coc-format-selected)
nmap <space>fc <Plug>(coc-format-selected)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" 打开当前光标所在单词的vim帮助文档
nnoremap <space>vh :execute ":help " . expand("<cword>")<cr>

nmap <silent> <space>dh :call CocAction('doHover')<CR>

" Use <leader>K to show documentation in preview window.
nnoremap <silent> <space>do :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" not work
"nmap <silent> grc :CocCommand document.renameCurrentWord<CR>

" refactor
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction

" }}} coc.nvim


" liuchengxu/vista.vim {{{
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
" let g:vista_default_executive = 'ctags'
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

" :Vista [EXECUTIVE]: open vista window powered by EXECUTIVE.
nnoremap <silent><nowait> <space>t :<C-u>Vista!!<CR>
noremap <space>T :silent! Vista finder coc<CR>

" }}} liuchengxu/vista.vim


" coc-translator {{{
nmap <space>/ <Plug>(coc-translator-p)
vmap <space>/ <Plug>(coc-translator-pv)
" }}} coc-translator


" mhinz/vim-startify {{{
let g:startify_custom_footer =
            \ map(split(system("date -u '+%Y-%m-%d %H:%M:%S' \| tr -d '\n'"), '\n'), '"   ". v:val') + ['','']
            "\ map(split(system('date +%FT%T%z'), '\n'), '"   ". v:val') + ['','']
" }}} mhinz/vim-startify


" coc-snippets {{{
" To list all snippets for a current file
" :CocList snippets
" :CocCommand snippets.editSnippets
" :CocCommand snippets.openSnippetFiles
" Use <C-g> for trigger snippet expand
imap <C-g> <Plug>(coc-snippets-expand)
vmap <C-e> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-n>'
let g:coc_snippet_prev = '<c-p>'
"imap <C-q> <Plug>(coc-snippets-expand-jump)
" }}} coc-snippets


" coc-prettier {{{
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" Usage
" :Prettier
" }}} coc-prettier


" vim-autoformat {{{
" }}} vim-autoformat


" turbio/bracey.vim {{{
"let g:bracey_browser_command = open
" }}} turbio/bracey.vim


" instant-markdown/vim-instant-markdown {{{
" toggle use :InstantMarkdownPreview
let g:instant_markdown_autostart = 0
let g:instant_markdown_slow = 0
let g:instant_markdown_autoscroll = 1
" }}} instant-markdown/vim-instant-markdown


" coc-java {{{
autocmd FileType java nmap <F1> :CocCommand java.debug.vimspector.start<CR>
let g:ycm_java_hotcodereplace_mode = 'always'
" }}} coc-java


" java {{{
autocmd BufNewFile,BufReadPre *.java nmap <leader>rn :!javac %<cr>:!java %:r<cr>
" }}} java


" vimspector {{{
" Human Mode
let g:vimspector_enable_mappings = 'HUMAN'

" Install all
" /Users/zoud/.vim/plugged/vimspector/install_gadget.py --all

"- Running ':VimspectorInstall' with no arguments, or
"- Running ':VimspectorUpdate'
let g:vimspector_install_gadgets = [
            \ 'debugpy',
            \ 'vscode-bash-debug',
            \ 'vscode-java-debug',
            \ 'vscode-cpptools',
            \ 'debugger-for-chrome',
            \ 'CodeLLDB',
            \ 'vscode-go' ]
" 监听变量
" :call vimspector#AddWatch("变量名")
nnoremap <leader>dw :VimspectorWatch

nnoremap <leader>dl :call vimspector#Launch()<CR>
nnoremap <leader>dr :call vimspector#Reset()<CR>
nnoremap <leader>de :VimspectorEval
nnoremap <leader>ds :VimspectorShowOutput

" F3   Stop debugging
" F4   Restart debugging with the same configuration
" F5   When debugging, continue. Otherwise start debugging
" F9   Toggle line breakpoint on the current line
" F10  Step Over
" F11  Step Into

function! s:read_template_into_buffer(template)
    " has to be a function to avoid the extra space fzf#run insers otherwise
    execute '0r ~/.config/nvim/vimspector/'.a:template
endfunction
command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
            \   'source': 'ls -1 ~/.config/nvim/vimspector',
            \   'down': 20,
            \   'sink': function('<sid>read_template_into_buffer')
            \ })
noremap <leader>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
sign define vimspectorBP text=🛑 texthl=Normal
sign define vimspectorBPDisabled text=🚫 texthl=Normal
sign define vimspectorPC text=👉 texthl=SpellBad
" }}} vimspector


" vim-gitgutter {{{

" }}} vim-gitgutter


" coc-highlight {{{
":h coc-highlights
":CocInstall coc-highlight
"Highlight the symbol and its references when holding the cursor.

" autocmd CursorHold * silent call CocActionAsync('highlight')

" }}} coc-highlight


" coc-explorer {{{
"set modifiable
let g:coc_explorer_global_presets = {
            \   '.vim': {
            \     'root-uri': '~/.vim',
            \   },
            \   'tab': {
            \     'position': 'tab',
            \     'quit-on-open': v:true,
            \   },
            \   'floating': {
            \     'position': 'floating',
            \     'open-action-strategy': 'sourceWindow',
            \   },
            \   'floatingTop': {
            \     'position': 'floating',
            \     'floating-position': 'center-top',
            \     'open-action-strategy': 'sourceWindow',
            \   },
            \   'floatingLeftside': {
            \     'position': 'floating',
            \     'floating-position': 'left-center',
            \     'floating-width': 50,
            \     'open-action-strategy': 'sourceWindow',
            \   },
            \   'floatingRightside': {
            \     'position': 'floating',
            \     'floating-position': 'right-center',
            \     'floating-width': 50,
            \     'open-action-strategy': 'sourceWindow',
            \   },
            \   'simplify': {
            \     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]',
            \   }
            \ }
            "\     'root-strategies': 'keep'
nnoremap <space>e :CocCommand explorer --sources buffer+,file+<CR>
" nnoremap <space>e :CocCommand explorer<CR>
nnoremap <space>E :CocCommand explorer --preset floating<CR>
"nnoremap <space>E :CocCommand explorer --preset simplify<CR>
"nnoremap <space>E :CocCommand explorer --preset tab<CR>
" List all presets
nnoremap <space><space>l :CocList explPresets<CR>
" 当coc-explorer是最后一个buf的时候，自动关闭
"autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

" }}} coc-explorer


" Leaderf {{{
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewCode = 1
let g:Lf_ShowHidden = 1
let g:Lf_ShowDevIcons = 1
let g:Lf_UseMemoryCache = 0
let g:Lf_UseCache = 0
" }}} Leaderf


" antoinemadec/coc-fzf {{{

" List all list sources
noremap <space>al :CocFzfList<CR>

" }}} antoinemadec/coc-fzf


" vim-rooter {{{
let g:rooter_patterns = ['.git', '_darcs', '.hg', '.bzr', '.svn', 'Makefile', 'pom.xml']
" function! SetV() abort
    " let root = FindRootDirectory()
    " echo "cd " . fnameescape(root)
    " execute "cd " . fnameescape(root)
" endfunction
" autocmd BufReadPost * :call SetV()
" autocmd BufReadPost * :Rooter

" }}} vim-rooter


" junegunn/fzf {{{
"nnoremap <space>ff :FZF<CR>
nnoremap <space>ff :Files<CR>
nnoremap <space>bb :Buffers<CR>
nnoremap <space>gg :GFiles<CR>

let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.6,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }

let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'String'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header':  ['fg', 'Comment'] }

" brew install --HEAD universal-ctags/universal-ctags/universal-ctags

" brew install fd

" rg
" brew install rg

" ag
" brew install the_silver_searcher
" 搜索当前单词
nnoremap <silent> <space>ag :Ag <C-R><C-W><CR>

" Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

" Ripgrep advanced
" function! RipgrepFzf(query, fullscreen)
  " let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  " let initial_command = printf(command_fmt, shellescape(a:query))
  " let reload_command = printf(command_fmt, '{q}')
  " let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  " call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
" endfunction

"command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)


" }}} junegunn/fzf


" Yggdroot/indentLine {{{

"let g:vim_json_syntax_conceal = 0
autocmd Filetype json let g:indentLine_setConceal = 0

" }}} Yggdroot/indentLine


" coc-leetcode {{{
":CocList LeetcodeProblems
" }}} coc-leetcode


" vim-visual-multi {{{
" select words with Ctrl-N
" press n/N to get next/previous occurrence
" press [/] to select next/previous cursor
" press q to skip current and get next occurrence
" press Q to remove current cursor/selection
" start insert mode with i,a,I,A
" }}} vim-visual-multi


" rainbow {{{
let g:rainbow_active = 1
let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['darkblue', 'darkyellow', 'darkcyan', 'darkmagenta', 'darkred'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}
" }}} rainbow


" db {{{

let g:db_ui_use_nerd_fonts=1

" let $DBUI_URL = 'mysql://username:password@host:port/DBName'
" example: let $DBUI_URL = 'mysql://user_name:password@localhost:3306/local_db'

" DBS
" let g:dbs = {
" \ 'local': 'mysql://user_name:password@localhost:3306/local_db',
" \ 'staging': 'mysql://user_name:password@localhost:3306/staging_db'
" \ }

" let g:db_ui_table_helpers = {
" \   'mysql': {
" \     'Desc': 'DESC {table}',
" \     'Create Table': 'SHOW CREATE TABLE {table}',
" \     'Comment': 'SHOW FULL COLUMNS FROM {table}',
" \     'Count': 'SELECT COUNT(*) FROM {table}'
" \   }
" \ }

" show tables in the left
" :DBUI
" turn on modifiable
" autocmd FileType dbui nmap <buffer> o <Plug>(DBUI_SelectLine)

" }}} db


" nerdcommenter {{{
let g:NERDSpaceDelims = 1
" }}} nerdcommenter


" vim-easy-align {{{
" 解决双引号不能对齐的问题：vipga<C-G>"
" # 默认左对齐
" {separator} - 分隔符 常用的有: <Space> = : . | & # ,
" n{separator} - 应用到第 n 个分隔符, 负数表示倒着数
" <Enter> - 回车控制对齐方向, 默认为左对齐; 1个回车右对齐; 2个回车居中对齐; 3个回车回到左对齐; 依次类推…
" *{separator} - 一个星号 + 分隔符表示 应用到所有的分隔符
" **{separator} - 2个星号表示交替对齐: 第一列右对齐, 第二列左对齐, 第三列右对齐, 以此类推…
" <Enter>**{separator} - 回车 + 2个星号 也是交替对齐: 第一列左对齐, 第二列右对齐, 第三列左对齐, 以此类推…
" Markdown 表格的分隔符为竖线: |
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
"let g:easy_align_delimiters = {
"            \ '/': {
"            \     'pattern':         '//\+\|/\*\|\*/',
"            \     'delimiter_align': 'l'
"            \   },
"            \ '#': {
"            \     'pattern':       '#',
"            \     'ignore_groups': ['String']
"            \   }
"            \ }
" }}} vim-easy-align


" NERDTree {{{
" 打开和关闭NERDTree快捷键
"map <F10> :NERDTreeToggle<CR>
"nmap <C-m> :NERDTreeFind<CR>

" 设置宽度
"let NERDTreeWinSize=35
" 显示行号
"let NERDTreeShowLineNumbers=1
"let NERDTreeAutoCenter=1
" 打开文件时是否显示目录
"let NERDTreeAutoCenter=1
" 是否显示隐藏文件
"let NERDTreeShowHidden=1
" 忽略一下文件的显示
" let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 打开 vim 文件及显示书签列表
"let NERDTreeShowBookmarks=2
" 在终端启动vim时，共享NERDTree
"let g:nerdtree_tabs_open_on_console_startup=1
" git文件标注修改
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
" }}} NERDTree


" tagbar {{{
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

"set tags=tags;
" }}} tagbar


" coc-go {{{
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
" }}} coc-go


" vim-go {{{
let g:go_test_show_name = 1

let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
let g:go_updatetime = 500

" let g:go_echo_go_info = 0
let g:go_doc_popup_window = 1
" let g:go_def_mapping_enabled = 0
" let g:go_template_autocreate = 0
" let g:go_textobj_enabled = 0
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_structs = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_assignments = 0
let g:go_highlight_variable_declarations = 0
" let g:go_doc_keywordprg_enabled = 0

"autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
"" 直接通过 go run 执行当前文件
"autocmd FileType go nmap <leader>r :GoRun %<CR>
" }}} vim-go


" Snip {{{
"let g:UltiSnipsExpandTrigger="<Tab>"
"let g:UltiSnipsJumpForwardTrigger="<Tab>"
"let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
" }}} Snip


" sh {{{
autocmd BufNewFile *.sh   exec ":call SHHeader()"
func SHHeader()
    call setline(1,"#!/usr/bin/env bash")
endfunc
" }}} sh


" theme {{{
set t_Co=256
set background=light
colorscheme heshui

"let java_highlight_java_lang_ids = 1
"let java_highlight_functions = 1
"let java_highlight_all = 1
"let java_comment_strings = 1
"let java_mark_braces_in_parens_as_errors = 1
"let java_highlight_debug = 1
"let java_javascript = 1
"let java_css = 1
"let java_vb = 1
" }}} theme


" style {{{
" Get style
function! <SID>SynStack()
    echo map(synstack(line('.'),col('.')),'synIDattr(v:val, "name")')
endfunc
nnoremap <leader>c1 :call <SID>SynStack()<CR>

" Get style in current and parent
function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
nnoremap <leader>c2 :call SynGroup()<CR>

" Get style in current and parent
function! SynStackN()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
nnoremap <leader>c3 :call SynStackN()<CR>

nnoremap <leader>c4 :echo synIDattr(synID(line('.'), col('.'), 0), 'name')<cr>
nnoremap <leader>c5 :echo ("hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">")<cr>
nnoremap <leader>c6 :echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')<CR>
nnoremap <leader>c7 :exec 'syn list '.synIDattr(synID(line('.'), col('.'), 0), 'name')<CR>

map <leader>c8 :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

map <leader>c9 :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") .
            \ "> trans<" . synIDattr(synID(line("."),col("."),0),"name") .
            \ "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") .
            \ "> fg:" .synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>
" }}} style



" npm -g install instant-markdown-d
" npm -g install eslint
" npm -g install gitbook-cli
" npm -g install lodash
" npm -g install neovim
" npm -g install npm
" npm -g install tldr
" npm -g install typescript
" npm -g install yarn

"<Plug>(coc-codeaction)              " line action
"<Plug>(coc-definition)              " definition
"<Plug>(coc-references)              " references
"<Plug>(coc-type-definition)         " type definition
"<Plug>(coc-rename)                  " rename
"<Plug>(coc-declaration)             " declaration
"<Plug>(coc-implementation)          " implementation
"<Plug>(coc-format)                  " format
"<Plug>(coc-fix-current)             " quickfix
"<Plug>(coc-codelens-action)         " code lens
"<Plug>(coc-diagnostic-next)         " next diagnostic
"<Plug>(coc-diagnostic-next-error)   " next error
":CocList diagnostics                " diagnostics
":CocList outline                    " search outline
":CocList -I symbols                 " references
":CocUpdate                          " update CoC
":CocDisable                         " disable CoC
":CocEnable                          " enable CoC

