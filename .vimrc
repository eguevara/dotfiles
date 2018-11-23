call plug#begin('~/.vim/plugged') 

Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim', {'on': ['CtrlP', 'CtrlPMixed', 'CtrlPMRU']}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Initialize plugin system
call plug#end() 

" abbreviations
abb _me eguevara@github.com
abb _date_ <C-R>=strftime("%Y-%m-%d")<CR>

set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin indent on    " required

set background=dark
let g:solarized_termcolors=256
let g:solarized_termtrans=1
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

set autoindent
set smartindent
set complete-=i
set showmatch
set smarttab

set et
set tabstop=4
set shiftwidth=4
set expandtab

set nrformats-=octal
set shiftround

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
nnoremap <leader>ev :tabe $MYVIMRC<cr>
nnoremap <leader>sv :so $MYVIMRC<cr>
nnoremap Y y$
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
"let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ctrlp#enabled = 1
let g:airline_theme = 'minimalist'
let g:airline_powerline_fonts = 3

" vim-fugitive
nnorema <leader>ga :Git add %:p<CR><CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gp :Gpush<CR>
vnoremap <leader>gb :Gblame<CR>

" NerdTree
nmap <C-n> :NERDTreeToggle<CR>
noremap <Leader>n :NERDTreeToggle<cr>
noremap <Leader>f :NERDTreeFind<cr>

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

let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_switch_buffer = 'et'  " jump to a file if it's open already
let g:ctrlp_mruf_max=450    " number of recently opened files
let g:ctrlp_max_files=0     " do not limit the number of searchable files
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_match_window = 'bottom,order:btt,max:10,results:10'
let g:ctrlp_buftag_types = {'go' : '--language-force=go --golang-types=ftv'}

func! MyCtrlPTag()
  let g:ctrlp_prompt_mappings = {
        \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
        \ 'AcceptSelection("t")': ['<c-t>'],
        \ }
  CtrlPBufTag
endfunc
command! MyCtrlPTag call MyCtrlPTag()

