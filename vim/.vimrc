" ignore junk files!
set wildignore+=*/.git/*,*/tmp/*,*.swp,*/vendor/*
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg

" abbreviations
abb _me eguevara@github.com
abb _date_ <C-R>=strftime("%Y-%m-%d")<CR>

set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin indent on    " required

set background=light
let g:solarized_visibility="high"
colorscheme solarized

"set guifont=Inconsolata:h15
"set guioptions-=L

" set diffsplit to vert
set diffopt=filler,vertical

" integrate with system clipboard
" set clipboard=unnamed

" Settings
set noerrorbells                " No beeps
set number                      " Show line numbers
set backspace=indent,eol,start  " Makes backspace key more powerful.
set showcmd                     " Show me what I'm typing
set noshowmode                    " Show current mode.
set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set nowritebackup
set splitright                  " Split vertical windows right to the current windows
set splitbelow                  " Split horizontal windows below to the current windows
set encoding=utf-8              " Set default encoding to UTF-8
set fileencoding=utf-8
set autowrite                   " Automatically save before :next, :make etc.
set autoread                    " Automatically reread changed files without asking me anything
set laststatus=2                " Show status line for al windows
set hidden
set ruler                       " Show the cursor position all the time
set showmatch                 " Do show matching brackets by flickering

" Searching
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters

set ttyfast
set lazyredraw                    " Wait to redraw "

" speed up syntax highlighting
set nocursorcolumn
set nocursorline

syntax sync minlines=256
set synmaxcol=300
set re=1

" Make Vim to handle long lines nicely.
set wrap
set linebreak                   " break on full words
set textwidth=79
set formatoptions=qrn1

" Indentation
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set linebreak    "Wrap lines at convenient points

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" Better Completion
set complete=.,w,b,u,t
set completeopt=longest,menuone

" Wildmenu completion {{{
set wildmenu
set wildmode=full

syntax enable
"set guioptions-=L

" Remove search highlight
let mapleader=","

" clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr>

" Close all but the current one
nnoremap <leader>o :only<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

nnoremap <space> zz
nnoremap n nzzzv
nnoremap N Nzzzv
imap jj  <ESC>l
nnoremap Y y$

" Edit vimrc
nnoremap <leader>ev :tabe $MYVIMRC<cr>
nnoremap <leader>sv :so $MYVIMRC<cr>

" Easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

noremap <SPACE> <C-F> " use space to scroll down
noremap <TAB> ) " use tab to move to the next sentence

" autocompletion by type
inoremap <leader>, <C-x><C-o>

" vim-fugitive
map <Leader>gb :Git blame<CR>

" to avoid setting paste and  nopaste
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
"
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" ctr settings
nnoremap <silent> <Space>f :CtrlP<CR>
nnoremap <silent> <Space>m :CtrlPMixed<CR>
nnoremap <silent> <Space>r :CtrlPMRU<CR>
nnoremap <silent> <Space>t :CtrlPTag<CR>

" Setting for ctrlp
let g:ctrlp_working_path_mode = ''
let g:ctrlp_max_files=0     " do not limit the number of searchable files
let g:ctrlp_max_depth=100
let g:ctrlp_extensions = ['tag']
let g:ctrlp_match_window = 'bottom,order:btt,max:10,results:20'

" Use ripgrep if available
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 1
endif

" use rip grep for finding stuff.
if executable('rg')
  let g:ackprg = 'rg --vimgrep --no-heading'
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

" Window pane resizing
nnoremap <silent> <Leader>h :exe "vertical resize " . (winwidth(0) * 3/2)<CR>

nnoremap <silent> <Leader>k :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>j :exe "resize " . (winheight(0) * 2/3)<CR>

" Switch between tabs
nnoremap <silent> <leader>1 :tabnext<CR>
inoremap <silent> <leader>1  <Esc>:tabnext<CR>

" Switch between last two files.
nnoremap <leader><leader> <c-^>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PROMOTE VARIABLE TO RSPEC LET
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>p :PromoteToLet<cr>
