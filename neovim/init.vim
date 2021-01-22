let mapleader=" "
syntax on
set number
set norelativenumber
set cursorline
set wrap
set showcmd
set wildmenu
set termguicolors
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

"set nocompatible
"filetype on
"filetype indent on
"filetype plugin on
"filetype plugin indent on
set updatetime=100
set mouse=
set encoding=utf-8
let &t_ut=''
set tabstop=4
set shiftwidth=4
set softtabstop=4
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=5
set tw=0
" set smartindent
" set smarttab
set expandtab
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

set termguicolors " enable true colors support
hi NonText ctermfg=gray guifg=grey10

colorscheme desert

noremap <LEADER><CR> :nohlsearch<CR>

"use + reg default
noremap y "+y
noremap yy "+yy
noremap d "+d
noremap dd "+dd
noremap p "+p
noremap P "+P

" Space to Tab
nnoremap <LEADER>tt :%s/    /\t/g
vnoremap <LEADER>tt :s/    /\t/g

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

map <M-j> :res +5<CR>
map <M-k> :res -5<CR>
map <M-h> :vertical resize-5<CR>
map <M-l> :vertical resize+5<CR>

map ta :tabe<CR>
map th :-tabnext<CR>
map tl :+tabnext<CR>

map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K

map W 5w
map <C-s> :w<CR>

" Indentation
nnoremap < <<
nnoremap > >>

" ===
" === Command Mode Cursor Movement
" ===
" cnoremap <M-u> <Home>
" cnoremap <M-i> <End>
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
""cnoremap <C-u> <S-Left>
""cnoremap <C-i> <S-Right>

" call plug#begin('~/AppData/Local/nvim/plugin')
call plug#begin()
Plug 'vim-airline/vim-airline'

" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

" Bookmarks
Plug 'kshenoy/vim-signature'

" Undo Tree
" Plug 'mbbill/undotree/'

" 界面设置
Plug 'junegunn/limelight.vim'

" 配合limelight使用
Plug 'junegunn/goyo.vim'

" just like  :w !sudo tee %
Plug 'lambdalisue/suda.vim'

" '' "" {} [] 
Plug 'jiangmiao/auto-pairs'

" rainbow '' "" {} [] 
Plug 'frazrepo/vim-rainbow'

" rgb
Plug 'lilydjwg/colorizer'

" coc!
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()


" limelight
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

" Goyo
let g:goyo_width = 106
let g:goyo_height = 90
let g:goyo_linenr = 0

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

nmap <silent><LEADER>g :Goyo<CR>
xmap <silent><LEADER>g :Goyo<CR>

" vim-rainbow
au FileType c,cpp,objc,objcpp call rainbow#load()
let g:rainbow_active = 1
let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

" coc
let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-vimlsp',
  \ 'coc-html',
  \ 'coc-xml',
  \ 'coc-css',
  \ 'coc-yank',
  \ 'coc-explorer',
  \ 'coc-translator',
  \ 'coc-actions',
  \ 'coc-highlight',
  \ 'coc-marketplace']

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <C-o> coc#refresh()
else
  inoremap <silent><expr> <C-o> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

nnoremap tt :CocCommand explorer<CR> 

" coc-actions
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

" coc-translator
" NOTE: do NOT use `nore` mappings
" popup
nmap <Leader>t <Plug>(coc-translator-p)
vmap <Leader>t <Plug>(coc-translator-pv)
" echo
nmap <Leader>e <Plug>(coc-translator-e)
vmap <Leader>e <Plug>(coc-translator-ev)
" replace
nmap <Leader>r <Plug>(coc-translator-r)
vmap <Leader>r <Plug>(coc-translator-rv)
