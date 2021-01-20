let mapleader=" "
syntax on
set number
set norelativenumber
set cursorline
set wrap
set showcmd
set wildmenu

set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=
set encoding=utf-8
let &t_ut=''
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=5
set tw=0
set indentexpr=
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set laststatus=2
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

colorscheme desert

noremap <LEADER><CR> :nohlsearch<CR>

map R :source $MYVIMRC<CR>
map ; :

map <C-l> :set splitright<CR>:vsplit<CR>
map <C-h> :set nosplitright<CR>:vsplit<CR>
map <C-k> :set nosplitbelow<CR>:split<CR>
map <C-j> :set splitbelow<CR>:split<CR>

map <LEADER>l <C-w>l
map <LEADER>h <C-w>h
map <LEADER>k <C-w>k
map <LEADER>j <C-w>j

map <LEADER><LEADER>j :res +5<CR>
map <LEADER><LEADER>k :res -5<CR>
map <LEADER><LEADER>h :vertical resize-5<CR>
map <LEADER><LEADER>l :vertical resize+5<CR>

map ta :tabe<CR>
map th :-tabnext<CR>
map tl :+tabnext<CR>

map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K

map W :w<CR>

" call plug#begin('~/AppData/Local/nvim/plugin')
call plug#begin()
Plug 'vim-airline/vim-airline'

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

" Bookmarks
Plug 'kshenoy/vim-signature'

" Undo Tree
Plug 'mbbill/undotree/'

" hightlight yank
Plug 'cyansprite/vim-highlightedyank'

" 界面设置
Plug 'junegunn/limelight.vim'

" 配合limelight使用
Plug 'junegunn/goyo.vim'

" rgb
Plug 'vim-scripts/colorsel.vim'

" assuming you're using vim-plug: https://github.com/junegunn/vim-plug
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-pyclang'
Plug 'ncm2/ncm2-jedi'

" just like  :w !sudo tee %
Plug 'lambdalisue/suda.vim'
call plug#end()

" ===
" === NERDTree
" ===
map tt :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"


" ==
" == NERDTree-git
" ==
let g:NERDTreeIndicatorMapCustom = {
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


" ==
" == ncm2
" ==
autocmd BufEnter * call ncm2#enable_for_buffer()
" 补全模式,具体详情请看下文
set completeopt=menu,noinsert
set shortmess+=c
inoremap <c-c> <ESC>
" 延迟弹窗,这样提示更加流畅
let ncm2#popup_delay = 5
"输入几个字母开始提醒:[[最小优先级,最小长度]]
"如果是输入的是[[1,3],[7,2]],那么优先级在1-6之间,会在输入3个字符弹出,如果大于等于7,则2个字符弹出----优先级概念请参考文档中 ncm2-priority 
let ncm2#complete_length = [[1, 1]]
"模糊匹配模式,详情请输入:help ncm2查看相关文档
let g:ncm2#matcher = 'substrfuzzy'
"使用tab键向下选择弹框菜单
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>" 

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'
" Default: 0.5
let g:limelight_default_coefficient = 0.5
" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1
" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
" let g:limelight_bop = '^\s'
" let g:limelight_eop = '\ze\n^\s'
" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

" Goyo配置
let g:goyo_width = 106
let g:goyo_height = 90
let g:goyo_linenr = 0

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

nmap <silent><LEADER>g :Goyo<CR>
xmap <silent><LEADER>g :Goyo<CR>




