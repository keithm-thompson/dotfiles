" A minimal vimrc for new vim users to start with.
"
" Referenced here: http://www.benorenstein.com/blog/your-first-vimrc-should-be-nearly-empty/

" Original Author:	 Bram Moolenaar <Bram@vim.org>
" Made more minimal by:  Ben Orenstein
" Last change:	         2012 Jan 20
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"
"  If you don't understand a setting in here, just type ':h setting'.

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Switch syntax highlighting on
syntax on

let mapleader = ","

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" set word wrap to 100 chars
set tw=100

" set vim update time to 100 ms per vim gitgutter
set updatetime=100
set timeoutlen=1000 ttimeoutlen=0

" highlight searches
set incsearch
set ignorecase
set smartcase
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set ruler
set showcmd
set clipboard=unnamed
set noshowmode
set laststatus=2

nnoremap <leader><CR> :!
nnoremap <leader><space> i<space><esc>
nnoremap <leader>p a<space><esc>p
nmap <Leader>gs :!git status<CR>
nmap <Leader>ga :!git add -i<CR>
nmap <Leader>gc :!git commit<CR>
nmap <Leader>t :Files<CR>
nmap j gj
nmap k gk
nmap \ :Buffers<CR>
map <Leader>/ :BLines<CR>
map <Leader>o o<esc>
map <Leader>O O<esc>

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

autocmd FileType ruby,eruby,yaml setlocal ai sw=2 sts=2 et

" we like line numbers, especially relative line numbers
set number
set relativenumber

set tabstop=2 softtabstop=2 shiftwidth=2 noexpandtab

" add a space before pasting


call plug#begin('~/.vim/plugged')
Plug 'w0rp/ale'
Plug 'powerline/powerline-fonts'
Plug 'tjammer/blayu.vim'
Plug 'airblade/vim-gitgutter'
Plug 'slim-template/vim-slim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
call plug#end()


colorscheme gruvbox
set background=dark

" ale config
let g:ale_linters = {'ruby': ['rubocop']}
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_ruby_rubocop_options = ''
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'

highlight link ALEWarningSign String
highlight link ALEErrorSign Title

" Don't automatically continue comments after newline
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc nested source ~/.vimrc
augroup END
