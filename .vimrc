" file {{{
set encoding=utf-8                                                                    " 内部使用的编码方式
set fileencoding=utf-8                                                                " 多子节文本的文件编码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,gbk,gb2312,big5,euc-jp,shift-jis,latin1 " 打开文件时自动尝试的顺序
set fileformats=unix,dos,mac                                                          " 参与自动检测的 'fileformat' 的格式
" }}} file


" python path {{{
" pip3 install neovim --upgrade
let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python'
" :checkhealth

" }}} python path


" syntax {{{
syntax enable             " 开启语法高亮
filetype plugin indent on " 开启文件类型检测，加载对应文件类型的插件
" }}} syntax


" mapping {{{
let mapleader = ","
let g:mapleader = ","
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>q :q!<cr>
nnoremap <silent> <bs> :nohlsearch<cr>
inoremap jk <esc>
inoremap <c-h> <left>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-l> <right>

if has('win32')
    nnoremap <a-j> :m .+1<cr>==
    nnoremap <a-k> :m .-2<cr>==
    inoremap <a-j> <esc>:m .+1<cr>==gi
    inoremap <a-k> <esc>:m .-2<cr>==gi
    vnoremap <a-j> :m '>+1<cr>gv=gv
    vnoremap <a-k> :m '<-2<cr>gv=gv
"elseif has('unix')
elseif has('mac')
    nnoremap ∆ :m .+1<cr>==
    nnoremap ˚ :m .-2<cr>==
    inoremap ∆ <esc>:m .+1<cr>==gi
    inoremap ˚ <esc>:m .-2<cr>==gi
    vnoremap ∆ :m '>+1<cr>gv=gv
    vnoremap ˚ :m '<-2<cr>gv=gv
endif

" use vim default : <c-i> tab behavior
" use vim default : <c-x> <c-f> path autocomplete
"inoremap <c-x> <bs>
" use vim default : insert last text
"inoremap <c-a> <home>
" use vim default : close autocomplete
"inoremap <c-e> <end>
" }}} mapping



" base {{{
set splitright
set splitbelow
set nocompatible
set autoread
set magic
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
set nobackup                                " no backup files
set noswapfile                              " no swap files
set nowritebackup                           " only in case you don't want a backup file while editing
set shortmess+=c                            " 缩短消息长度的标志位列表
set clipboard+=unnamed                      " clipboard
set number                                  " 行号
set ruler                                   " 标尺信息
"set rulerformat=%55(%{strftime('%a\ %b\ %e\ %i:%m\ %p')}\ %5l,%-6(%c%v%)\ %p%)
set cursorline                              " 高亮当前行
set colorcolumn=120
set nowrap                                  " 关闭自动换行
set showcmd                                 " 在状态行里显示 (部分) 命令
set showmode                                " 在状态行上显示当前模式的消息
set wildmenu                                " 命令行自动补全所使用的菜单
set wildmode=longest:list,full              " 命令行扩展所用的模式
set list
"set listchars=tab:»-,trail:-,eol:$,extends:»,precedes:«,nbsp:%
"set listchars=tab:▸\ ,trail:-,eol:$,extends:»,precedes:«,nbsp:%
"set listchars=tab:▸-,trail:-,eol:$,extends:»,precedes:«,nbsp:%
set listchars=tab:\|\ ,trail:-,eol:$,extends:»,precedes:«,nbsp:␣
set hlsearch                                " 高亮显示搜索结果
set incsearch                               " 实时搜索高亮
set ignorecase                              " 忽略大小写
set smartcase                               " 智能大小写
set showmatch                               " 插入括号时短暂跳转到匹配的括号
set matchtime=1                             " 显示匹配括号的时间 (以十分之一秒计)
set laststatus=2                            " 两行状态栏
set statusline=%f\ %{webdeviconsgetfiletypesymbol()}\ %h%w%m%r\ %=%(%y\ %{&fileformat}\ %{(&fenc==\"\"?&enc:&fenc).(&bomb?\",bom\":\"\")}\ #%n\ %o\ %l/%l,%c%v\ [asc=%03.3b]\ [hex=%02.2b]\ %=\ %p%)
set expandtab                               " 改变tab键行为，tab->space
set tabstop=4                               " tab字符显示宽度，不修改tab键行为，4个空格作为一个tab(一个tab显示多少个空格)
set softtabstop=4                           " 修改tab键行为，不修改tab字符显示宽度，按下一个tab视为输入4个空格
set shiftwidth=4                            " 换行的缩进列数，普通模式下的<< >>，输入模式下的ctrl+d｜ctrl+t，进行缩进为4个空格
set autoindent                              " 继承前一行的缩进方式，适用于多行注释
set copyindent                              " 复制粘贴时保留原有的缩进
set cindent                                 " c/c++ 语言缩进优化
" }}} base


" autocmd {{{
" real time reload
"autocmd bufwritepost $myvimrc source $myvimrc
" 自动更新文件
autocmd focusgained,bufenter * :silent! !
autocmd bufwritepre * :%s/\s\+$//e                                                                                   " delete trailing space or tab before write file
autocmd bufreadpost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif | normal! zvzz     " last edit
autocmd filetype javascript,html,css,xml,yaml,json,proto,sql setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2 " two space wide
autocmd filetype go,python,java,kotlin,scala setlocal expandtab tabstop=4 shiftwidth=4  softtabstop=4                " four space wide
" }}} autocmd


" tips {{{
" use %normal! to do something.....what you want for all line
" :%normal! @q
" to toggle an option on/off:
" :set <option>!
" to check an option on/off:
" :set <option>?
" to set an option back to its default:
" :set <option>&
" toogle relativenumber on/off
" nnoremap <space>n :setlocal relativenumber! relativenumber?<cr>

" compile function
noremap <leader>run :call compilerungcc()<cr>
func! compilerungcc()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        set splitright
        exec "!g++ -std=c++11 % -wall -o %<"
        :vsp
        :res -15
        :term ./%<
    elseif &filetype == 'python'
        set splitright
        :vsp
        :term python3 %
    elseif &filetype == 'markdown'
        exec "markdownpreview"
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


" window {{{
" 快捷键上下分割：<c-w>s
" 快捷键左右分割：<c-w>v

" 窗口大小
map <up>    :res +2<cr>
map <down>  :res -2<cr>
map <left>  :vertical resize-2<cr>
map <right> :vertical resize+2<cr>
" }}} window


" terminal {{{
" opening a terminal window
"noremap <silent><leader>tt :set splitbelow<cr>:split<cr>:res -15<cr>:term<cr>
tnoremap <esc> <c-\><c-n>


function! openterminal(name)
    set splitbelow
    let l:exist = bufexists(a:name)
    if l:exist
        exec "15sp " . a:name
        return
    endif
    :15new term://zsh
    exec "file " . a:name
endfunction

nnoremap <silent><leader>tt :call openterminal('z')<cr>

" }}} terminal


" tab {{{
map <leader>tn :tabedit<cr>
map <leader>. :+tabnext<cr>
map <leader>m :-tabnext<cr>
map <leader>th :-tabmove<cr>
map <leader>tl :+tabmove<cr>
" }}} tab


" buffer {{{
map <leader><leader>d :bdelete<cr>
map <leader><leader>m :bprevious<cr>
map <leader><leader>. :bnext<cr>
" }}} buffer


" plugins {{{
call plug#begin('~/.vim/plugged')

plug 'fatih/vim-go', { 'do': ':goupdatebinaries' }

plug 'neoclide/coc.nvim', {'branch': 'release'}

" taglist
plug 'liuchengxu/vista.vim'

plug 'airblade/vim-rooter'

" coc-java-dependency need
plug 'uzxmx/vim-widgets'

"plug 'artur-shaik/vim-javacomplete2'

plug 'preservim/nerdcommenter'

plug 'mhinz/vim-startify'

plug 'ap/vim-css-color'

plug 'ryanoasis/vim-devicons'

plug 'mg979/vim-visual-multi'

" 文件跳转
"plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
"plug 'junegunn/fzf.vim'
"plug 'antoinemadec/coc-fzf'

" 文件跳转
"plug 'yggdroot/leaderf', { 'do': ':leaderfinstallcextension' }
"plug 'pechorin/any-jump.vim'

"plug 'puremourning/vimspector'


"plug 'christoomey/vim-tmux-navigator'

"plug 'chiel92/vim-autoformat'


"plug 'luochen1990/rainbow'

"plug 'yggdroot/indentline'

"plug 'jiangmiao/auto-pairs'

"plug 'easymotion/vim-easymotion'


" combine the following two plugins will be more quickly
"plug 'gcmt/wildfire.vim'
"plug 'tpope/vim-surround'



" db
"plug 'tpope/vim-dadbod'
"plug 'kristijanhusak/vim-dadbod-ui'


"plug 'sheerun/vim-polyglot'

" vim状态栏，包括显示行号，列号，文件类型，文件名，以及git状态
"plug 'vim-airline/vim-airline'

" show change
"plug 'airblade/vim-gitgutter'
" git
"plug 'tpope/vim-fugitive'

" markdown
" npm -g install instant-markdown-d
"plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}

"plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
"plug 'dhruvasagar/vim-table-mode', { 'on': 'tablemodetoggle' }
"plug 'vimwiki/vimwiki'


"plug 'turbio/bracey.vim'
"plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}

call plug#end()
" }}} plugins


" vim-rooter {{{
let g:rooter_patterns = ['.git', '_darcs', '.hg', '.bzr', '.svn', 'makefile', 'pom.xml']
" function! setv() abort
    " let root = findrootdirectory()
    " echo "cd " . fnameescape(root)
    " execute "cd " . fnameescape(root)
" endfunction
" autocmd bufreadpost * :call setv()
" autocmd bufreadpost * :rooter
" }}} vim-rooter



" coc.nvim {{{

highlight cocerrorsign ctermfg=15 ctermbg=196 cterm=bold
highlight cocwarningsign ctermfg=0 ctermbg=172

" find something  :coclist
" search coc_extensions :coclist marketplace

" auto download extensions instead of manual :cocinstall coc-json ...
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

" use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <tab>
      \ pumvisible() ? "\<c-n>" :
      \ <sid>check_back_space() ? "\<tab>" :
      \ coc#refresh()
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<c-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" use <c-q> to trigger completion.
inoremap <silent><expr> <c-q> coc#refresh()
" make <cr> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<c-g>u\<cr>\<c-r>=coc#on_enter()\<cr>"

autocmd user cocjumpplaceholder call cocactionasync('showsignaturehelp')

" jump to error
" use `:cocdiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [e <plug>(coc-diagnostic-prev)
nmap <silent> ]e <plug>(coc-diagnostic-next)

" goto code navigation.
nmap <silent> <space>gd <plug>(coc-definition)
nmap <silent> <space>gy <plug>(coc-type-definition)
nmap <silent> <space>gi <plug>(coc-implementation)
nmap <silent> <space>gr <plug>(coc-references)
nmap <silent> <space>rn <plug>(coc-rename)
nmap <silent> <space>rf <plug>(coc-refactor)
nmap <silent> <space>qf <plug>(coc-fix-current)

nmap <space>ca <plug>(coc-codeaction)
nmap <space>cl <plug>(coc-codelens-action)

" quick suggest
xmap <space>l  <plug>(coc-codeaction-selected)
nmap <space>l  <plug>(coc-codeaction-selected)

" formatting selected code.
xmap <space>fc <plug>(coc-format-selected)
nmap <space>fc <plug>(coc-format-selected)

" add `:format` command to format current buffer.
command! -nargs=0 format :call cocaction('format')

" 打开当前光标所在单词的vim帮助文档
nnoremap <silent><space>hw :execute ":help " . expand("<cword>")<cr>

nmap <silent><space>hh :call cocaction('dohover')<cr>

" use <leader>k to show documentation in preview window.
nnoremap <silent><space>hd :call <sid>show_documentation()<cr>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call cocactionasync('dohover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" remap <c-f> and <c-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <c-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<c-f>"
  nnoremap <silent><nowait><expr> <c-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<c-b>"
  inoremap <silent><nowait><expr> <c-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<right>"
  inoremap <silent><nowait><expr> <c-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<left>"
  vnoremap <silent><nowait><expr> <c-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<c-f>"
  vnoremap <silent><nowait><expr> <c-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<c-b>"
endif

" not work
"nmap <silent> grc :coccommand document.renamecurrentword<cr>

" refactor
function! s:cocactionsopenfromselected(type) abort
  execute 'coccommand actions.open ' . a:type
endfunction
" }}} coc.nvim


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
            \     'open-action-strategy': 'sourcewindow',
            \   },
            \   'floatingtop': {
            \     'position': 'floating',
            \     'floating-position': 'center-top',
            \     'open-action-strategy': 'sourcewindow',
            \   },
            \   'floatingleftside': {
            \     'position': 'floating',
            \     'floating-position': 'left-center',
            \     'floating-width': 50,
            \     'open-action-strategy': 'sourcewindow',
            \   },
            \   'floatingrightside': {
            \     'position': 'floating',
            \     'floating-position': 'right-center',
            \     'floating-width': 50,
            \     'open-action-strategy': 'sourcewindow',
            \   },
            \   'simplify': {
            \     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitcenter 1]',
            \   }
            \ }
            "\     'root-strategies': 'keep'
nnoremap <space>fs :coccommand explorer --sources buffer+,file+<cr>
"nnoremap <space>e :coccommand explorer<cr>
nnoremap <space>fs :coccommand explorer --preset floating<cr>
"nnoremap <space>e :coccommand explorer --preset simplify<cr>
"nnoremap <space>e :coccommand explorer --preset tab<cr>
" list all presets
nnoremap <space><space>l :coclist explpresets<cr>
" 当coc-explorer是最后一个buf的时候，自动关闭
"autocmd bufenter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

" }}} coc-explorer


" coc-go {{{
autocmd bufwritepre *.go :silent call cocaction('runcommand', 'editor.action.organizeimport')
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
"autocmd filetype go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
"" 直接通过 go run 执行当前文件
"autocmd filetype go nmap <leader>r :gorun %<cr>
" }}} vim-go


" coc-highlight {{{
" :h coc-highlights
" :cocinstall coc-highlight
" highlight the symbol and its references when holding the cursor.
" autocmd cursorhold * silent call cocactionasync('highlight')
" }}} coc-highlight


" coc-java {{{
autocmd filetype java nmap <f1> :coccommand java.debug.vimspector.start<cr>
let g:ycm_java_hotcodereplace_mode = 'always'
" }}} coc-java


" java {{{
autocmd bufnewfile,bufreadpre *.java nmap <leader>rn :!javac %<cr>:!java %:r<cr>
" }}} java


" coc-prettier {{{
command! -nargs=0 prettier :coccommand prettier.formatfile
" }}} coc-prettier


" coc-snippets {{{
" to list all snippets for a current file
" :coclist snippets
" :coccommand snippets.editsnippets
" :coccommand snippets.opensnippetfiles
" use <c-g> for trigger snippet expand
imap <c-g> <plug>(coc-snippets-expand)
vmap <c-e> <plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-n>'
let g:coc_snippet_prev = '<c-p>'
"imap <c-q> <plug>(coc-snippets-expand-jump)
" }}} coc-snippets


" coc-translator {{{
nnoremap <space>tl <plug>(coc-translator-p)
vnoremap <space>tl <plug>(coc-translator-pv)
" }}} coc-translator


" liuchengxu/vista.vim {{{
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
"let g:vista_default_executive = 'ctags'
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
" :vista [executive]: open vista window powered by executive.
nnoremap <silent><nowait> <space>t :<c-u>vista!!<cr>
noremap <silent><space>t :silent! vista finder coc<cr>
" }}} liuchengxu/vista.vim


" mhinz/vim-startify {{{
let g:startify_custom_footer = map(split(system("date -u '+%y-%m-%d %h:%m:%s' \| tr -d '\n'"), '\n'), '"   ". v:val') + ['','']
" }}} mhinz/vim-startify


" nerdcommenter {{{
let g:nerdspacedelims = 1
" }}} nerdcommenter


" vimspector {{{
" human mode
let g:vimspector_enable_mappings = 'human'

" install all
" /users/zoud/.vim/plugged/vimspector/install_gadget.py --all

"- running ':vimspectorinstall' with no arguments, or
"- running ':vimspectorupdate'
let g:vimspector_install_gadgets = [
            \ 'debugpy',
            \ 'vscode-bash-debug',
            \ 'vscode-java-debug',
            \ 'vscode-cpptools',
            \ 'debugger-for-chrome',
            \ 'codelldb',
            \ 'vscode-go' ]
" 监听变量
" :call vimspector#addwatch("变量名")
nnoremap <leader>dw :vimspectorwatch

nnoremap <leader>dl :call vimspector#launch()<cr>
nnoremap <leader>dr :call vimspector#reset()<cr>
nnoremap <leader>de :vimspectoreval
nnoremap <leader>ds :vimspectorshowoutput

" f3   stop debugging
" f4   restart debugging with the same configuration
" f5   when debugging, continue. otherwise start debugging
" f9   toggle line breakpoint on the current line
" f10  step over
" f11  step into

function! s:read_template_into_buffer(template)
    " has to be a function to avoid the extra space fzf#run insers otherwise
    execute '0r ~/.config/nvim/vimspector/'.a:template
endfunction
command! -bang -nargs=* loadvimspectorjsontemplate call fzf#run({
            \   'source': 'ls -1 ~/.config/nvim/vimspector',
            \   'down': 20,
            \   'sink': function('<sid>read_template_into_buffer')
            \ })
noremap <leader>vs :tabe .vimspector.json<cr>:loadvimspectorjsontemplate<cr>
sign define vimspectorbp text=🛑 texthl=normal
sign define vimspectorbpdisabled text=🚫 texthl=normal
sign define vimspectorpc text=👉 texthl=spellbad
" }}} vimspector


" yggdroot/indentline {{{
"let g:vim_json_syntax_conceal = 0
autocmd filetype json let g:indentline_setconceal = 0
" }}} yggdroot/indentline


" turbio/bracey.vim {{{
"let g:bracey_browser_command = open
" }}} turbio/bracey.vim


" instant-markdown/vim-instant-markdown {{{
" toggle use :instantmarkdownpreview
" let g:instant_markdown_autostart = 0
" let g:instant_markdown_slow = 0
" let g:instant_markdown_autoscroll = 1
" }}} instant-markdown/vim-instant-markdown


" leaderf {{{
" let g:lf_previewinpopup = 1
" let g:lf_previewcode = 1
" let g:lf_showhidden = 1
" let g:lf_showdevicons = 1
" let g:lf_usememorycache = 0
" let g:lf_usecache = 0
" }}} leaderf


" antoinemadec/coc-fzf {{{
" list all list sources
" noremap <space>al :cocfzflist<cr>
" }}} antoinemadec/coc-fzf


" junegunn/fzf {{{
"nnoremap <space>ff :fzf<cr>
" nnoremap <space>ff :files<cr>
" nnoremap <space>bb :buffers<cr>
" nnoremap <space>gg :gfiles<cr>
" let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.6,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'todo', 'border': 'sharp' } }
" let g:fzf_colors =
  " \ { 'fg':      ['fg', 'normal'],
    " \ 'bg':      ['bg', 'normal'],
    " \ 'hl':      ['fg', 'string'],
    " \ 'fg+':     ['fg', 'cursorline', 'cursorcolumn', 'normal'],
    " \ 'bg+':     ['bg', 'cursorline', 'cursorcolumn'],
    " \ 'hl+':     ['fg', 'statement'],
    " \ 'info':    ['fg', 'preproc'],
    " \ 'border':  ['fg', 'ignore'],
    " \ 'prompt':  ['fg', 'conditional'],
    " \ 'pointer': ['fg', 'exception'],
    " \ 'marker':  ['fg', 'keyword'],
    " \ 'spinner': ['fg', 'label'],
    " \ 'header':  ['fg', 'comment'] }
" brew install --head universal-ctags/universal-ctags/universal-ctags
" brew install fd
" rg:
" brew install rg
" ag:
" brew install the_silver_searcher
" 搜索当前单词
" nnoremap <silent> <space>ag :ag <c-r><c-w><cr>
" get files
" command! -bang -nargs=? -complete=dir files
    " \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" get text in files with rg
" command! -bang -nargs=* rg
  " \ call fzf#vim#grep(
  " \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  " \   fzf#vim#with_preview(), <bang>0)

" git grep
" command! -bang -nargs=* ggrep
  " \ call fzf#vim#grep(
  " \   'git grep --line-number '.shellescape(<q-args>), 0,
  " \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

" ripgrep advanced
" function! ripgrepfzf(query, fullscreen)
  " let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  " let initial_command = printf(command_fmt, shellescape(a:query))
  " let reload_command = printf(command_fmt, '{q}')
  " let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  " call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
" endfunction

"command! -nargs=* -bang rg call ripgrepfzf(<q-args>, <bang>0)
" }}} junegunn/fzf


" vim-visual-multi {{{
" select words with ctrl-n
" press n/n to get next/previous occurrence
" press [/] to select next/previous cursor
" press q to skip current and get next occurrence
" press q to remove current cursor/selection
" start insert mode with i,a,i,a
" }}} vim-visual-multi


" luochen1990/rainbow {{{
" let g:rainbow_active = 1
" let g:rainbow_conf = {
	" \	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	" \	'ctermfgs': ['darkblue', 'darkyellow', 'darkcyan', 'darkmagenta', 'darkred'],
	" \	'operators': '_,_',
	" \	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	" \	'separately': {
	" \		'*': {},
	" \		'tex': {
	" \			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	" \		},
	" \		'lisp': {
	" \			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	" \		},
	" \		'vim': {
	" \			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimfuncbody', 'start=/\[/ end=/\]/ containedin=vimfuncbody', 'start=/{/ end=/}/ fold containedin=vimfuncbody'],
	" \		},
	" \		'html': {
	" \			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-za-z0-9]+)(\s+[-_:a-za-z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	" \		},
	" \		'css': 0,
	" \	}
	" \}
" }}} luochen1990/rainbow


" db {{{
" let g:db_ui_use_nerd_fonts=1
" example: let $dbui_url = 'mysql://user_name:password@localhost:3306/local_db'
" let $dbui_url = 'mysql://username:password@host:port/dbname'
" dbs
" let g:dbs = {
" \ 'local': 'mysql://user_name:password@localhost:3306/local_db',
" \ 'staging': 'mysql://user_name:password@localhost:3306/staging_db'
" \ }
" let g:db_ui_table_helpers = {
" \   'mysql': {
" \     'desc': 'desc {table}',
" \     'create table': 'show create table {table}',
" \     'comment': 'show full columns from {table}',
" \     'count': 'select count(*) from {table}'
" \   }
" \ }
" show tables in the left
" :dbui
" turn on modifiable
" autocmd filetype dbui nmap <buffer> o <plug>(dbui_selectline)
" }}} db


" icon {{{
"             "modified"  : "✹",
"             "staged"    : "✚",
"             "untracked" : "✭",
"             "renamed"   : "➜",
"             "unmerged"  : "═",
"             "deleted"   : "✖",
"             "dirty"     : "✗",
"             "clean"     : "✔︎",
"             "unknown"   : "?"
" }}} icon


" snip {{{
"let g:ultisnipsexpandtrigger="<tab>"
"let g:ultisnipsjumpforwardtrigger="<tab>"
"let g:ultisnipsjumpbackwardtrigger="<s-tab>"
" }}} snip


" sh {{{
autocmd bufnewfile *.sh exec ":call setline(1,'#!/usr/bin/env bash')"
" autocmd bufnewfile *.sh exec ":0put='#!/usr/bin/env bash'"
" }}} sh


" theme {{{
set t_co=256
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
" get style
function! <sid>synstack()
    echo map(synstack(line('.'),col('.')),'synidattr(v:val, "name")')
endfunc
nnoremap <leader>c1 :call <sid>synstack()<cr>

" get style in current and parent
function! syngroup()
    let l:s = synid(line('.'), col('.'), 1)
    echo synidattr(l:s, 'name') . ' -> ' . synidattr(synidtrans(l:s), 'name')
endfun
nnoremap <leader>c2 :call syngroup()<cr>

" get style in current and parent
function! synstackn()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synidattr(v:val, "name")')
endfunc
nnoremap <leader>c3 :call synstackn()<cr>

nnoremap <leader>c4 :echo synidattr(synid(line('.'), col('.'), 0), 'name')<cr>
nnoremap <leader>c5 :echo ("hi<" . synidattr(synid(line("."),col("."),1),"name") . '> trans<'
\ . synidattr(synid(line("."),col("."),0),"name") . "> lo<"
\ . synidattr(synidtrans(synid(line("."),col("."),1)),"name") . ">")<cr>
nnoremap <leader>c6 :echo map(synstack(line('.'), col('.')), 'synidattr(v:val, "name")')<cr>
nnoremap <leader>c7 :exec 'syn list '.synidattr(synid(line('.'), col('.'), 0), 'name')<cr>

map <leader>c8 :echo "hi<" . synidattr(synid(line("."),col("."),1),"name") . '> trans<'
\ . synidattr(synid(line("."),col("."),0),"name") . "> lo<"
\ . synidattr(synidtrans(synid(line("."),col("."),1)),"name") . ">"<cr>

map <leader>c9 :echo "hi<" . synidattr(synid(line("."),col("."),1),"name") .
            \ "> trans<" . synidattr(synid(line("."),col("."),0),"name") .
            \ "> lo<" . synidattr(synidtrans(synid(line("."),col("."),1)),"name") .
            \ "> fg:" .synidattr(synidtrans(synid(line("."),col("."),1)),"fg#")<cr>
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
" npm -g install bash-language-server

"<plug>(coc-codeaction)              " line action
"<plug>(coc-definition)              " definition
"<plug>(coc-references)              " references
"<plug>(coc-type-definition)         " type definition
"<plug>(coc-rename)                  " rename
"<plug>(coc-declaration)             " declaration
"<plug>(coc-implementation)          " implementation
"<plug>(coc-format)                  " format
"<plug>(coc-fix-current)             " quickfix
"<plug>(coc-codelens-action)         " code lens
"<plug>(coc-diagnostic-next)         " next diagnostic
"<plug>(coc-diagnostic-next-error)   " next error
":coclist diagnostics                " diagnostics
":coclist outline                    " search outline
":coclist -i symbols                 " references
":cocupdate                          " update coc
":cocdisable                         " disable coc
":cocenable                          " enable coc


