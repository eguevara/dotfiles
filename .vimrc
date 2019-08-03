call plug#begin('~/.vim/plugged') 

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'ctrlpvim/ctrlp.vim', {'on': ['CtrlP', 'CtrlPMixed', 'CtrlPMRU']}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mileszs/ack.vim'
Plug 'skalnik/vim-vroom'
Plug 'altercation/vim-colors-solarized'
Plug 'ervandew/supertab'


" after adding a new plug, source, then :PlugInstall

" ignore junk files!
set wildignore+=*/.git/*,*/tmp/*,*.swp,*/vendor/*
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg

" Initialize plugin system
call plug#end() 

" abbreviations
abb _me eguevara@github.com
abb _date_ <C-R>=strftime("%Y-%m-%d")<CR>

set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin indent on    " required

set background=light
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1
colorscheme solarized

"set guifont=Inconsolata:h15
"set guioptions-=L

" set diffsplit to vert
set diffopt=filler,vertical

" integrate with system clipboard
set clipboard=unnamedplus

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
nnoremap <leader><space> :nohlsearch<CR>

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

"
" Easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

noremap <SPACE> <C-F> " use space to scroll down
noremap <TAB> ) " use tab to move to the next sentence

" vim-go plugin settingo
let g:go_fmt_fail_silently = 0
let g:go_fmt_command ="goimports"
let g:go_autodetect_gopath = 1
let g:go_term_enabled = 1
let g:go_snippet_engine = "neosnippet"
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 0
let g:go_highlight_operators = 0
let g:go_highlight_build_constraints = 1

nmap <C-g> :GoDecls<cr>
imap <C-g> <esc>:<C-u>GoDecls<cr>

" autocompletion by type
inoremap <leader>, <C-x><C-o>

au FileType go nmap <Leader>s <Plug>(go-def-split)
au FileType go nmap <Leader>v <Plug>(go-def-vertical)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>l <Plug>(go-metalinter)

au FileType go nmap <leader>r  <Plug>(go-run)

au FileType go nmap <leader>t  <Plug>(go-test)
au FileType go nmap <leader>dt  <Plug>(go-test-compile)
au FileType go nmap <Leader>d <Plug>(go-doc)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

au FileType go nmap <Leader>e <Plug>(go-rename)

autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

" vim-airline
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ctrlp#enabled = 1
let g:airline_theme = 'minimalist'
"let g:airline_powerline_fonts = 3

"autocmd VimEnter * AirlineToggleWhitespace 

" vim-fugitive
map <Leader>gb :Gblame<CR>

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

" use rip grep for finding stuff.
if executable('rg')
  let g:ackprg = 'rg --vimgrep --no-heading'
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

" For ag grep searching on selected word
map <Leader>a :Ack!<CR>
map <Leader>A :Ack<CR>

" For quickfix to the next on the list
"map <Leader><Leader> :cnext<CR>

" vim-vroom
let g:vroom_map_keys=0 " Let's keep <Leader>l for ListToggle
let g:vroom_use_dispatch=1
let g:vroom_use_colors=1
silent! map <unique> <Leader>R :VroomRunTestFile<CR>
silent! map <unique> <Leader>r :VroomRunNearestTest<CR>

" Window pane resizing
nnoremap <silent> <Leader>k :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>j :exe "resize " . (winheight(0) * 2/3)<CR>

" Switch between tabs
nnoremap <silent> <leader>1 :tabnext<CR>
inoremap <silent> <leader>1  <Esc>:tabnext<CR>

" Switch between last two files.
nnoremap <leader><leader> <c-^>
