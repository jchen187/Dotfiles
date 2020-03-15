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
" VUNDLE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugin overrides
let g:PaperColor_Dark_Override = { 'comment' : '#5f875f' }

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-bufferline'
Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'dart-lang/dart-vim-plugin'
Plugin 'elzr/vim-json'
Plugin 'ervandew/supertab'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
" Plugin 'scrooloose/syntastic'
" Plugin 'SirVer/ultisnips'
Plugin 'tpope/vim-flagship'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-surround'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/grep.vim'

"let g:javascript_conceal_function             = "ƒ"
"let g:javascript_conceal_null                 = "ø"
"let g:javascript_conceal_undefined            = "¿"
"let g:javascript_conceal_NaN                  = "ℕ"
"let g:javascript_conceal_arrow_function       = "⇒"
"set conceallevel=1
Plugin 'pangloss/vim-javascript'

Plugin 'mxw/vim-jsx'
"Plugin 'Valloric/MatchTagAlways'

" TODO - Should this line be commented out? It prevents folding
"let g:vim_markdown_folding_disabled = 1
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

let g:vrc_trigger = '<C-n>'
let g:vrc_show_command = 1
Plugin 'diepm/vim-rest-console'

"let's keep vim simple
"Plugin 'Raimondi/delimitMate'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

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
" number OR nu
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

" highlight OR hi
highlight LineNr ctermfg=grey

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" > VISUAL [TEMPORARY - COMMENT LATER]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colorscheme OR colo
" syntax on
" colo slate
" set cursorline
" highlight CursorLine ctermbg=235

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
" ignorecase OR ic
set ignorecase

" When searching try to be smart about cases
" smartcase OR sc
set smartcase

" Highlight search results
set hlsearch
" hi Search ctermfg=Yellow ctermbg=NONE cterm=bold,underline
" hi Search ctermfg=Yellow ctermbg=LightGray cterm=bold,underline

" Makes search act like search in modern browsers - search as you type the phrase
set incsearch

" Set color of highlight in visual mode
" hi Visual cterm=NONE

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
" TODO - if the file is not a make file set expandtab - you will run into an issue if you open a Makefile in any buffer, noexpandtab will be set, which becomes a problem if you are editing other files
endif

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
" set ts=4 sw=4 sts=4 et
" tabstop OR ts
" shiftwidth OR sw
" expandtab OR et
set shiftwidth=2
set tabstop=2

" Auto indent - indent the same as the current line
" autoindent OR ai
set ai

" Smart indent - indent based on the syntax
" smartindent OR si
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
" > ARROW KEYS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Arrow keys sometimes stop working
" set notimeout         " don't timeout on mappings
" set ttimeout          " do timeout on terminal key codes
" set timeoutlen=109    " timeout after 100 msec
" set nocompatible      " this would be needed if we did not have a user vimrc file


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" > BETTER SPLIT NAVIGATION (ONLY WORKS WHEN YOU HAVE SPLITS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" How come they are not like <C-J> <C-W>J?
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" > CUSTOM VIMDIFF COLORSCHEME
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

highlight DiffAdd    cterm=bold ctermfg=15 ctermbg=27 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=15 ctermbg=27 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=15 ctermbg=27 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=15 ctermbg=88 gui=none guifg=bg guibg=Red
