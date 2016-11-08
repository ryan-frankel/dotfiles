 set nocompatible               " be iMproved
 filetype on                   " required!
 filetype indent on
 filetype plugin on
 set nofoldenable

 " Mapleader
 let mapleader = "\<Space>"

 set background=dark

 " Vundle
 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " Color scheme
 colorscheme wombat256mod

 " Line Numbers
 set number

" Tabstop
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
 
 " Switch off all auto-indenting
 set nocindent
 set nosmartindent
 set autoindent
 set indentexpr=
 set rtp+=$GOROOT/misc/vim
 filetype plugin indent off
 syntax on
 set mouse=a

 " Case Insensitive search
 set ignorecase

 " Source LESS in Vim
 au BufRead,BufNewFile *.less set filetype=less
 " source vcl
 au BufRead,BufNewFile *.vcl set filetype=vcl
 " Source ejs in Vim
 au BufNewFile,BufRead *.ejs set filetype=html
 " Source Go VIM
 au BufRead,BufNewFile *.go set filetype=go
 let g:go_highlight_functions = 1
 let g:go_highlight_methods = 1
 let g:go_highlight_structs = 1
 "source ~/.vim/bundle/vim-go/syntax/go.vim
 " Source PUG
 au BufNewFile,BufRead *.jade setf pug

 " PuTTY
 "if &term =~ "xterm"
	"256 color --
	let &t_Co=256
 "endif

 " let Vundle manage Vundle
 " required! 
 Bundle 'gmarik/vundle'

 " Functional
 Bundle 'scrooloose/nerdtree.git'
 Bundle 'scrooloose/nerdcommenter.git'
 Bundle 'ervandew/supertab.git'
 Bundle 'jwhitley/vim-matchit'
 Bundle 'tpope/vim-fugitive'
 Bundle 'ctrlpvim/ctrlp.vim'

 " Syntax
 Bundle 'sheerun/vim-polyglot'

 " Snippits
 Bundle 'MarcWeber/vim-addon-mw-utils'
 Bundle 'tomtom/tlib_vim'
 Bundle 'garbas/vim-snipmate'
 let g:snippets_dir="~/vimrc/snippets/"
 
 " Syntax Checkers
 Bundle 'nrocco/vim-phplint'
 Bundle 'hokaccha/vim-html5validator.git'
 Bundle 'scrooloose/syntastic.git'

 " vim-scripts repos
 " non github repos
 " Bundle 'git://git.wincent.com/command-t.git'
 " ...
 filetype plugin indent on     " required! 
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..
 
 " Auto Open NERDTree when no file on command line
 function! StartUp()
	 if 0 == argc()
		 NERDTree
		 call feedkeys("\<C-W>l:q\<Enter>","t")
	 end
 endfunction
 au VimEnter * call StartUp()

 " Omnicomplete with SuperTab
 let g:SuperTabDefaultCompletionType = "context"

 "Default peekaboo window
 let g:peekaboo_window = 'vertical botright 30new'

 " Ctrl-P - Enter to Open in New Tab
 let g:ctrlp_prompt_mappings = {
	 \ 'AcceptSelection("e")': ['<c-t>'],
	 \ 'AcceptSelection("t")': ['<cr>'],
	 \ }