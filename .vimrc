"
" Settings
"
set nocompatible
set autoindent
set expandtab
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set copyindent
set preserveindent
set smarttab
set relativenumber
set gdefault
set incsearch
set showmatch
set hlsearch
set colorcolumn=120
set listchars=tab:▸\ ,eol:¬
set background=dark
set laststatus=2
set noerrorbells
set ruler
set clipboard=unnamedplus

let g:indentLine_char = '▏'

augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END

autocmd BufNewFile,BufRead *.html,*.js,*.json,*.tf,*.tfvars,*.vue,*.scss,*.css setlocal shiftwidth=2
autocmd BufWritePre * :%s/\s\+$//e

let mapleader = "\<Space>"
nnoremap <C-*> "*"

" Protect changes between writes. Default values of updatecount (200
" keystrokes) and updatetime (4 seconds) are fine
set swapfile
set directory^=~/.vim/swap//

" Protect against crash-during-write
set writebackup
" But do not persist backup after successful write
set nobackup
" Use rename-and-write-new method whenever safe
set backupcopy=auto
" Patch required to honor double-slash at end
if has("patch-8.1.0251")
	" Consolidate the writebackups -- not a big deal either way, since they
	" usually get deleted
	set backupdir^=~/.vim/backup//
end

" Persist the undo tree for each file
set undofile
set undodir^=~/.vim/undo//

filetype off


"
" Start the Vundle plugin manager
"

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" GruvBox color scheme
Plugin 'morhetz/gruvbox'

" TypeScript plugin
Plugin 'leafgarland/typescript-vim'

" Clojure plugins
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'Yggdroot/indentLine'

" All Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

syntax enable

colorscheme gruvbox

let g:php_folding=2
set foldmethod=syntax
