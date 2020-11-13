"       (`-.           _   .-')    _  .-')
"    _(OO  )_        ( '.( OO )_ ( \( -O )
",--(_/   ,. \ ,-.-') ,--.   ,--.),------.   .-----.
"\   \   /(__/ |  |OO)|   `.'   | |   /`. ' '  .--./
" \   \ /   /  |  |  \|         | |  /  | | |  |('-.
"  \   '   /,  |  |(_/|  |'.'|  | |  |_.' |/_) |OO  )
"   \     /__),|  |_.'|  |   |  | |  .  '.'||  |`-'|
"    \   /   (_|  |   |  |   |  | |  |\  \(_'  '--'\
"     `-'      `--'   `--'   `--' `--' '--'  `-----' 

"插件管理
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'                  "状态栏
Plug 'scrooloose/nerdtree'                      "目录树
Plug 'jiangmiao/auto-pairs'                     "括号补全
Plug 'skywind3000/asyncrun.vim'                 "编译运行
Plug 'sheerun/vim-polyglot'                     "高亮
Plug 'octol/vim-cpp-enhanced-highlight'         "C/C++高亮
"Plug 'fatih/vim-go'                             "Go
Plug 'Yggdroot/indentLine'                      "代码缩进线
Plug 'w0rp/ale'                                 "语法检查和语义错误
"Plug 'itchyny/vim-cursorword'                  "单词增加下划线
Plug 'joshdick/onedark.vim'                     "vs风格 onedark
"Plug 'morhetz/gruvbox'                          "solarized更改主题 gruvbox
"Plug 'altercation/vim-colors-solarized'         "solarized
Plug 'vimwiki/vimwiki'                          "vimwiki
Plug 'scrooloose/nerdcommenter'                 "快捷键批量注释
""Markdown 预览
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for':['markdown', 'vim-plug'] }
"代码片段补全引擎
Plug 'SirVer/ultisnips'
" 代码片段模板，配合补全引擎
Plug 'assLlj/vim-snippets'

"补全框架和LSC
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"函数列表
"需要安装ctags
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

"Plug 'skywind3000/vim-terminal-help'

call plug#end()

""""""""""""""""""""""""""通用配置""""""""""""""""""""""""""

" 配色方案
set background=dark
"colorscheme gruvbox
colorscheme onedark

set nocompatible
filetype plugin on
set nowrap                    " 禁止折行
set laststatus=2              " 总是显示状态栏
set ruler                     " 显示光标当前位置
set number                    " 开启行号显示
"set cursorline                " 高亮显示当前行
"set cursorcolumn              " 高亮显示当前列
set hlsearch                  " 高亮搜索结果
set incsearch                 " 边搜索边高亮
set ignorecase                " 忽略大小写
set smartcase                 " 智能忽略大小写
syntax enable                 " 开启语法高亮功能
syntax on                     " 允许用指定语法高亮配色方案替换默认方案
filetype indent on            " 自适应不同语言的智能缩进
set expandtab                 " 将制表符扩展为空格
set tabstop=4                 " 设置编辑时制表符占用空格数
set shiftwidth=4              " 设置格式化时制表符占用空格数
set confirm                   " 未保存或者只读时，弹出确认 
set wildmenu                  " 命令选项菜单
set encoding=utf-8



"快捷键配置
nnoremap <silent> <F3> :NERDTree<cr>
nnoremap <silent> <F5> :call Run()<cr>
nnoremap <silent> <F6> :call Test()<cr>
nnoremap <silent> <F9> :call Compile()<cr>
nnoremap <F10> :call asyncrun#quickfix_toggle(20)<cr>
"一键编译
func! Compile()
    exec "w"
    if &filetype == 'c'
        exec "AsyncRun gcc % -o %<"
    elseif &filetype == 'cpp'
        exec "AsyncRun g++ % -o %<"
    elseif &filetype == 'rust'
        exec "AsyncRun -raw cargo build"
    elseif &filetype == 'go'
        exec "GoBuild"
    endif
endfunc

"测试
func! Test()
    exec "w"
    if &filetype == 'rust'
        exec "AsyncRun -raw cargo test --tests"
    elseif &filetype == 'go'
        exec "GoBuild"
    endif
endfunc


"一键运行
func! Run()
    exec "w"
    if &filetype == 'python'
        exec "AsyncRun -raw python3 %"
    elseif &filetype == 'go'
        exec "GoRun"
    elseif &filetype == 'markdown'
        exec "MarkdownPreview"
    elseif &filetype == 'rust'
        exec "AsyncRun -raw cargo run"
    elseif &filetype == 'vimwiki'
        exec "VimwikiAll2HTML"
    else
        exec "AsyncRun ./%<"
    endif
endfunc

""""""""""""""""""插件配置""""""""""""""""""""


"AsyncRun配置
let g:asyncrun_open = 15
let g:asyncrun_bell = 1

"indentLing
set list lcs=tab:\|\ 

"airline
let g:airline_powerline_fonts = 1   

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty = '⚡'

"markdown preview
let g:mkdp_auto_start = 1

"vimwiki
let g:vimwiki_list = [{                                                                
            \'path_html': '~/assLlj.github.io', 
            \}]

"indentLine
let g:indentLine_fileTypeExclude = ['markdown']
"不忽略markdown，它就会自动隐藏粗体斜体之类的标记

"ultinsnips
let g:UltiSnipsExpandTrigger="<c-a>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" coc
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

"gopls import自动添加
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

"leaderF
noremap <F2> :LeaderfFunction!<cr>
let g:Lf_PreviewResult = {'Function':0, 'Colorscheme':1}

let g:Lf_NormalMap = {
    \ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']],
    \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']],
    \ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
    \ "Tag":    [["<ESC>", ':exec g:Lf_py "tagExplManager.quit()"<CR>']],
    \ "Function":    [["<ESC>", ':exec g:Lf_py "functionExplManager.quit()"<CR>']],
    \ "Colorscheme":    [["<ESC>", ':exec g:Lf_py "colorschemeExplManager.quit()"<CR>']],
    \ }

"记住上次打开的位置
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
