" echo ">^.^< Hello Johnny!"

" Function to source only if file exists {
function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction
" }

" call SourceIfExists("/etc/vimrc")


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" > GENERAL
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Prevent making file specific vim changes within a ile
set nomodeline

" Set to auto read when a file is changed from the outside
set autoread

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Show matching brackets when text indicator is over them
set showmatch

" Line numbers
set nu
map <C-n> :set nu!<cr>

" Comma is more convenient for leader
let mapleader=","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" > VISUAL
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
"syntax enable
set t_Co=256
set background=dark
colorscheme PaperColor

highlight LineNr ctermfg=grey

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" > FOLDING
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folds will be based on indents
set foldmethod=indent

" Start file with all folds opened
" https://medium.com/vim-drops/javascript-folding-on-vim-119c70d2e872
set foldlevelstart=99

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" > SEARCHING
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" > FILES, BACKUPS AND UNDO
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" > TEXT, TAB AND INDENT RELATED
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" If the filetype is Makefile then we need to use tab
" So do not expand tabs into space.
if has('autocmd')
    autocmd FileType make   set noexpandtab
endif

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2

" Auto indent
set ai
" Smart indent
set si

" Make < > shifts and keep selection afterward
vnoremap < <gv
vnoremap > >gv

" Show trailing and preceding spaces
set list
set listchars=tab:>-,trail:~,extends:>,precedes:<

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" > STATUS LINE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" > MOUSE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Send more characters for redraws
set ttyfast

" Enable mouse use in all modes
if has('mouse')
    set mouse=a
endif

" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
if !has('nvim')
  set ttymouse=xterm2
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
