let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set nocompatible

if filereadable(expand("~/.nvimrc.bundles"))
  source ~/.nvimrc.bundles
endif

syntax on
let mapleader = ","
set modelines=0
set number
set ruler
set visualbell
set encoding=utf-8

set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

set nowrap
set textwidth=0
set wrapmargin=0

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Set ejs to render as html
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.jinja2 set filetype=html
au BufNewFile,BufRead *.less set filetype=css
au BufNewFile,BufRead *.sls set filetype=yaml

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Formatting
map <leader>q gqip

" Color scheme
let g:gruvbox_italic=1
colorscheme gruvbox
set background=dark

" imap jj <Esc>

" clipboard Register
set clipboard=unnamed

" format the entire file
noremap <leader>fef ggVG=
noremap <leader>Pdb <S-o>import pytest; pytest.set_trace()<Esc>
noremap <leader>pdb oimport pytest; pytest.set_trace()<Esc>

" Lightline
let g:lightline = { 'colorscheme': 'gruvbox' }

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" If ag is available use it as filename list generator instead of 'find'
if executable("ag")
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
    \ --ignore .git
    \ --ignore .svn
    \ --ignore .hg
    \ --ignore .DS_Store
    \ --ignore "**/*.pyc"
    \ -g ""'
endif

" Remember Last position over sessions
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Disable swap and backup
set nobackup
set noswapfile

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo

" tell it to use an undo file
set undofile
" set a directory to store the undo history
set undodir=~/.vimundo/

let g:jsx_ext_required = 0

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Format JSON with python
command! FormatJSON %!python -m json.tool
