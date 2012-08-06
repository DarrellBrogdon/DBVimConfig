"
" Settings
"
set nocompatible
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set expandtab
set copyindent
set preserveindent
set smarttab
set nu
set gdefault
set incsearch
set showmatch
set hlsearch
set colorcolumn=85
set list
set listchars=tab:▸\ ,eol:¬
set guifont=Menlo:h14
set lines=84 columns=158


:colorscheme bespin


syntax enable


set nocp
if version >= 600
	filetype plugin indent on
endif


"
" Mappings
"
" Stop search highlighting
nnoremap <leader><space> :noh<cr>

" Sort CSS directives
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

" Edit the .vimrc in a new window
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<CR>

" Source the .vimrc 
nnoremap <leader>sv :so $MYVIMRC<CR>

" Comment the current line
nnoremap <leader><D-/> 0i//<Esc>

" Comment the currently selected lines
vnoremap <leader><D-/> <C-v>0I//<Esc>

" Uncomment the current line
nnoremap <leader>// 0xx<Esc>

" Uncomment the currently selected lines
vnoremap <leader>// <C-v>ld<Esc>


au FileType mail let b:delimitMate_autoclose=0
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
au BufNewFile,BufReadPost *.coffee setl shiftwidth=4 expandtab
au FocusLost * :wa
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview


set laststatus=2


call pathogen#infect()


filetype plugin on


"
" Functions for reloading snippets
"
fun! ReloadSnippets(snippets_dir, ft)
call ResetSnippets()
call GetSnippets(a:snippets_dir, a:ft)
endfun

fun! ReloadAllSnippets()
call ReloadSnippets("~/.vim/snippets", &ft)
endfun
