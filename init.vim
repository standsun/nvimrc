call plug#begin('~/.config/nvim/plug')

Plug 'kassio/neoterm'
Plug 'kshenoy/vim-signature'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/molokai'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/ctrlp.vim'
Plug 'will133/vim-dirdiff'
Plug 'kannokanno/previm'
Plug 'mileszs/ack.vim'
Plug 'vim-scripts/TaskList.vim'
Plug 'airblade/vim-gitgutter'
Plug 'shawncplus/phpcomplete.vim'
Plug 'msanders/snipmate.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

"关闭与VI的兼容模式"
set nocompatible

"语法高亮显示
syntax on

"filetype plugin indent on
"打开文件类型检测
filetype on

"根据文件类型加载插件
filetype plugin on

"根据文件类型自动缩进
filetype indent on

"leader键
let mapleader = ','

"主题设置
colorscheme molokai

"边输入边显示搜索结果
set incsearch

"高亮搜索结果
set hlsearch

"搜索时忽略大小写
set ignorecase

"高亮显示匹配的括号
set showmatch

"自动缩进
set autoindent

"智能缩进
set smartindent

"将Tab转换成空格
set expandtab

"自动缩进4个空格
set shiftwidth=4

"让tab的显示成等同的空格宽度
set softtabstop=4

"tab等同的空格长度
set tabstop=4

"显示行号
set number

"支持256color特性
set t_Co=256

"Vim终端使用的编码
set termencoding=utf-8

"Vim内部编码
set encoding=utf-8

"文件编码列表
set fileencodings=utf-8

"关闭备份
set nobackup

"禁止生成swap文件
set noswapfile

"自动折行
set wrap

"tags
set tags=tags;/

"总是显示状态行
set laststatus=2

"设置状态栏显示的信息
set statusline=%F%m%r%=[ft=%Y][ascii=%03b][hex=%03B][pos=%03l,%02v][%03p%%][len=%03L]

"高亮光标所在行
set cursorline

"高亮光标所在的列
set cursorcolumn

"NERDTree
map <leader>n :NERDTreeToggle<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 0
let NERDTreeShowBookmarks = 1
let NERDTreeShowLineNumbers=0
let NERDTreeAutoCenter=1
let NERDTreeIgnore=['\.git']

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"程序大纲式导航插件Tagbar
nmap <leader>l <Esc>:Tagbar<CR>
let g:tagbar_ctags_bin='ctags'
let g:tagbar_width=30
let g:tagbar_right=1
autocmd BufReadPost *.go call tagbar#autoopen()

"文件夹内文件搜索插件
nnoremap <Leader>a :Ack!<Space>
let g:ackhighlight = 1
let g:ack_lhandler = "botright lopen 15"

"文件夹比较插件
let g:DirDiffExcludes = "CVS,*.class,*.o,*.git,*.bin"
let g:DirDiffIgnore = ".git*"

"Markdown预览插件
let g:previm_open_cmd = 'open -a "Google Chrome"'

"php自动提示
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
set completeopt=longest,menuone

"修改立即生效
"autocmd BufWritePost $MYVIMRC source $MYVIMRC

"tab切换快捷键
map <C-h> <Esc>:tabp<CR>
map <C-l> <Esc>:tabn<CR>

"执行文件的快捷键
nmap <leader>php <Esc>:!php %<CR>
nmap <leader>go  <Esc>:!go run %<CR>
nmap <leader>sh  <Esc>:!bash %<CR>

"复制内容到系统剪切板
vnoremap <leader>y "+y

"将系统剪贴板内容粘贴至vim 
vnoremap <leader>p "+p

"保存内容
nmap <Leader>w :w<CR>

"保存并退出
nmap <Leader>wq :wq!<CR>

"当前文件夹
nmap <Leader>cd :cd %:h<CR>

"leader按键映射
nmap <leader>q <Esc>:q<CR>


"内部打开终端
if has('nvim')
    fu! OpenTerminal()
        tab new
        set nonu
        ":terminal
        Tnew
    endf
    nnoremap ,, :call OpenTerminal()<CR>A
endif
