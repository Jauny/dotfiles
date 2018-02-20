" Vim Configuration file"
" vimrc for python IDE and javascript use"
" Gabriel Haim 10-03-2012"

" Vundle plugin manager
" ---------------------
set nocompatible            " be iMproved, required
filetype off                " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'                " Vundle installer
Plugin 'tpope/vim-fugitive'              " Best git wrapper
Plugin 'kien/ctrlp.vim'                  " Fuzzy search
Plugin 'plasticboy/vim-markdown'          " .md Syntax
"Plugin 'Lokaltog/powerline'              " Status line
Plugin 'bling/vim-airline'                " powerline alternative
Plugin 'rking/ag.vim'                    " Silver searcher (replace ack?)
Plugin 'alfredodeza/pytest.vim'          " py.test
Plugin 'jmcantrell/vim-virtualenv'        " Set path to virtualenv
Plugin 'altercation/vim-colors-solarized' " Nice colors
Plugin 'scrooloose/syntastic'            " Syntax checker
Plugin 'digitaltoad/vim-jade'             " Jade Syntax
Plugin 'fatih/vim-go'                    " go syntax

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Powerline setup
set rtp+=/Users/jonathanpepin/.vim/bundle/powerline/powerline/bindings/vim
" Airline powerfonts
let g:airline_powerline_fonts = 1

" Folding"
set foldmethod=indent
set foldlevel=99
set foldnestmax=2

" Mapping for changing windows"
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"Mapping to copy from visual to system clipboard"
map <C-c> "+y<CR>

set nocompatible
set laststatus=2 "Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set number

" Allow Vim to manage multiple buffers"
set hidden

" Set colors scheme"
set t_Co=256
set background=dark
colorscheme solarized

" Map leader to ','"
let mapleader = ","

" Plugin  mapping"
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>
map <leader>n :NERDTree<CR>
map <leader>p :CtrlP<CR>
map <leader>g :GundoToggle<CR>
map <leader>jd :YcmCompleter GoTo<CR>
nnoremap <leader>a :Ag!
" nmap <leader>a <Esc>:Ack!

" CtrlP parameters
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(pyc)$',
  \ 'link': '',
  \ }

" Flake 8 parameters
autocmd FileType python map <leader>8 :call Flake8()<CR>
let g:syntastic_enable_highlighting=1
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✘'
let g:syntastic_warning_symbol='☡'
let g:syntastic_sign_bg_default=1
let g:syntastic_python_checkers=['flake8']

" let g:flake8_cmd="/usr/local/bin/flake8"
let g:flake8_max_line_length=79
let g:flake8_max_complexity=12


" Markdown parameters
let g:vim_markdown_folding_disabled=1

highlight SpellBad term=reverse ctermbg=1

" Long history"
set history=1000

" Enable extendend % matching"
runtime macros/matchit.vim

" Better completion"
set wildmenu
set wildmode=list:longest

" Casesmart searching"
set ignorecase
set smartcase

" Terminal title and scrolloff"
set title
set scrolloff=3

" Set swap files directory to custom centralized"
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Set the ruler"
set ruler

" Intuitive backspacing in insert mode"
set backspace=indent,eol,start

" File-type highlighting and configuration."
" Run filetype without args to see what you may have"
" to turn on yourself, or just set them all to be sure."
syntax on
syntax enable
filetype on
filetype plugin on
filetype indent on

" Highlight search terms..."
set incsearch " ...dynamically as they are typed."
nnoremap <Leader><CR> :nohlsearch<CR>


" Catch trailing whitespace"
set list listchars=tab:>-,trail:·
nmap <silent> <leader>s :set nolist!<CR>

" use mouse with Wim
set mouse=a
set ttymouse=xterm2

" Indenting style"
autocmd Filetype sh set ts=4 shiftwidth=2 expandtab
autocmd Filetype mkd set sts=4 shiftwidth=4 expandtab
autocmd Filetype sql set sts=4 shiftwidth=4 expandtab
autocmd Filetype python set sts=4 shiftwidth=4 expandtab
autocmd Filetype nginx set sts=4 shiftwidth=4 expandtab
autocmd Filetype jade set sts=2 shiftwidth=2 expandtab
autocmd Filetype coffee set sts=2 shiftwidth=2 expandtab
autocmd Filetype json set sts=2 shiftwidth=2 expandtab
autocmd Filetype eco set sts=2 shiftwidth=2 expandtab
autocmd Filetype cucumber set sts=2 shiftwidth=2 expandtab
autocmd Filetype javascript set sts=2 shiftwidth=2 expandtab
autocmd Filetype lisp set sts=2 shiftwidth=2 expandtab
autocmd Filetype ruby set sts=2 shiftwidth=2 expandtab
autocmd Filetype xml set sts=2 shiftwidth=2 expandtab
autocmd Filetype html set sts=2 shiftwidth=2 expandtab
autocmd Filetype htmldjango set sts=2 shiftwidth=2 expandtab
autocmd Filetype yaml set sts=2 shiftwidth=2 expandtab
autocmd Filetype yml set sts=2 shiftwidth=2 expandtab
autocmd Filetype less set sts=2 shiftwidth=2 expandtab
autocmd Filetype java set sts=2 shiftwidth=2 expandtab
autocmd Filetype stylus set sts=2 shiftwidth=2 expandtab
autocmd Filetype xslt,diff set expandtab

autocmd BufReadPre viper,.viper set filetype=lisp
autocmd BufRead *.py set cindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufRead *.py nnoremap <c-p> :normal oimport ipdb; ipdb.set_trace()<esc>
autocmd BufNewFile,BufRead *.json,*.conf set ft=json
autocmd BufNewFile,BufRead *.yaml,*.yml set ft=yaml
autocmd BufNewFile,BufRead *.html set ft=htmldjango
autocmd BufNewFile,BufRead *.jade set ft=jade
autocmd BufRead,BufNewFile *.cnf set ft=gitconfig
autocmd BufRead,BufNewFile /etc/nginx/*,/usr/local/etc/nginx/* if &ft == 'json' | set ft=nginx | endif