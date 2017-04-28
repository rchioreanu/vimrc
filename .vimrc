" **************************************************************************** "
"                                                                              "
"                                                         :::      ::::::::    "
"    .vimrc                                             :+:      :+:    :+:    "
"                                                     +:+ +:+         +:+      "
"    By: rchiorea <rchiorea@student.42.fr>          +#+  +:+       +#+         "
"                                                 +#+#+#+#+#+   +#+            "
"    Created: 2017/04/23 17:26:39 by rchiorea          #+#    #+#              "
"    Updated: 2017/04/28 08:43:16 by rchiorea         ###   ########.fr        "
"                                                                              "
" **************************************************************************** "

" ===== VundleVim config =======================================================

set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" ===== Vim appearance plugins =================================================

Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" ===== Vim for programming ====================================================

Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-syntastic/syntastic'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'SingleCompile'

" ===== Vim Git plugins ========================================================

Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" ===== Vim autocompletion plugins =============================================

Plugin 'Raimondi/delimitMate'

" ===== Man and tmux integration ===============================================

Plugin 'jez/vim-superman'
Plugin 'christoomey/vim-tmux-navigator'

" ===== Syntax plugin ==========================================================

Plugin 'jez/vim-c0'
Plugin 'jez/vim-ispc'
Plugin 'kchmck/vim-coffee-script'
Plugin 'HTML-AutoCloseTag'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'tpope/vim-surround'

call vundle#end()

filetype plugin indent on


" ===== General settings =======================================================

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
set showcmd
set nu
set mouse=a
syntax on
hi clear SignColumn
colorscheme moriarty
inoremap { {<CR>}<Esc>O

" ===== Plugin settings ========================================================

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

let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
	au!
	au FileType tex let b:syntastic_mode = "passive"
augroup END

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

let delimitMate_expand_cr = 1
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

" ===== Cool line at 80 char ===================================================

highlight Normal ctermfg=grey ctermbg=black

if exists('+colorcolumn')
	set colorcolumn=80
else
	au BuffWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
