filetype off
filetype plugin indent on
set smartindent
set tabstop=4
set shiftwidth=4
set noexpandtab
set nocompatible
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
au BufWrite /prive/tmp/crontab.* set nowritebackup
au BufWrite /private/etc/pw.* set nowritebackup
syntax on
set nu
set mouse=a
set hlsearch
highlight Normal ctermfg=grey ctermbg=black

if exists('+colorcolumn')
	set colorcolumn=80
else
	au BuffWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
