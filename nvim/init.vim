" ===== Plug config ============================================================

set nocompatible

filetype off

call plug#begin('~/.config/nvim/plugins')

" ===== Vim appearance plugins =================================================

Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" ===== Vim hard mode - experimental ===========================================

Plug 'wikitopian/hardmode'

" ===== Vim for programming ====================================================

Plug 'shougo/vimproc.vim'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
" Plug 'vim-syntastic/syntastic'
Plug 'nrocco/vim-phplint'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-scripts/a.vim'
Plug 'severin-lemaignan/vim-minimap'
Plug 'alvan/vim-closetag'
Plug 'stanangeloff/php.vim'
Plug 'neovim/python-client'
Plug 'w0rp/ale'

" ===== Vim Git plugins ========================================================

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" ===== Vim autocompletion plugins =============================================

Plug 'Raimondi/delimitMate'
Plug 'shawncplus/phpcomplete.vim'
Plug 'm2mdas/phpcomplete-extended'

" ===== Man and Vim integration ================================================

Plug 'jez/vim-superman'
Plug 'christoomey/vim-tmux-navigator'
Plug 'rchioreanu/autoswap_mac'

" ===== Syntax plugin ==========================================================

Plug 'jez/vim-c0'
Plug 'jez/vim-ispc'
Plug 'kchmck/vim-coffee-script'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-surround'
Plug '2072/php-indenting-for-vim'
Plug 'honza/vim-snippets'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

call plug#end()

filetype plugin indent on


" ===== General settings =======================================================

function Save()
	:echom "Use <C-S>"
endfunction

function Exit()
	:echom "Use <C-X>"
endfunction

function Quit()
	:echom "Use <C-Q>"
endfunction

set title titlestring=
set smartindent
set tabstop=4
set shiftwidth=4
set noexpandtab
set encoding=utf-8
set modelines=1
set hidden
set ttyfast
set backspace=indent,eol,start
set laststatus=2
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set ruler
set number
set relativenumber
set showcmd
set nu
set mouse=a
syntax on
hi clear SignColumn
colorscheme moriarty
inoremap { {<CR>}<Esc>O
nmap :Q :q
nmap :W :w
runtime macros/matchit.vim
nnoremap <C-X> :wq<ENTER>
inoremap <C-X> <Esc>:wq<ENTER>
nnoremap <C-S> :w<ENTER>
nnoremap <C-Q> :q<ENTER>
inoremap <C-S> <Esc>:w<ENTER>
inoremap <C-Q> <Esc>:q<ENTER>
nnoremap :w<ENTER> :call Save()<ENTER>
nnoremap :x<ENTER> :call Exit()<ENTER>
nnoremap :q<ENTER> :call Quit()<ENTER>

" ===== Plugin settings ========================================================

" ===== wikitopian/hardmode =================================================

autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" ===== altercation/vim-colors-solarized ====================================

set background=dark
let g:solarized_termcolors=256

" ===== bling/vim-airline ===================================================

set laststatus=2
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='solarized'

" ===== jistr/vim-nerdtree-tabs =============================================

nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
map <C-n> :NERDTreeToggle<CR>
let g:nerdtree_tabs_open_on_console_startup = 0

" ===== scrooloose/syntastic ================================================

"let g:syntastic_error_symbol = '✘'
"let g:syntastic_warning_symbol = "▲"
"augroup mySyntastic
"	au!
"	au FileType tex let b:syntastic_mode = "passive"
"augroup END

" ===== xolox/vim-easytags ==================================================

set tags=./tags;,~/.vimtags
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ===== majutsushi/tagbar ===================================================

nmap <silent> <leader>b :TagbarToggle<CR>

" ===== airblade/vim-gitgutter ==============================================

let g:airline#extensions#hunks#non_zero_only = 1

" ===== Raimondi/delimitMate ================================================

augroup mydelimitMate
	au!
	au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
	au FileType tex let b:delimitMate_quotes = ""
	au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
	au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" ===== jez/vim-superman ====================================================

noremap K :SuperMan <cword><CR>

" ===== SingleCompile =======================================================

nmap <F9> :SCCompile<cr>
nmap <F10> :SCCompileRun<cr>

" ===== PHP =================================================================

function! PhpSyntaxOverride()
  hi! def link phpDocTags  phpDefine
    hi! def link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
	  autocmd!
	    autocmd FileType php call PhpSyntaxOverride()
	augroup END

" ===== YouCompleteMe =======================================================

let g:python_host_prog = '/usr/local/bin/python'

" ===== Cool line at 80 char ===================================================

highlight Normal ctermfg=grey ctermbg=black

if exists('+colorcolumn')
	set colorcolumn=80
else
	au BuffWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
