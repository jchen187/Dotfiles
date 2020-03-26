" echo ">^.^< Hello Johnny!"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" > LOAD OTHER VIMRC IF NECESSARY
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Function to source only if file exists {
function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction
" }

" call SourceIfExists("/etc/vimrc")

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" > VUNDLE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugin overrides
let g:PaperColor_Dark_Override = { 'comment' : '#5f875f' }
let g:dracula_colorterm = 0

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
Plugin 'dracula/vim', { 'name': 'dracula' }
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

" Mark 80th character on a line
highlight colorcolumn ctermbg=magenta
call matchadd('colorcolumn', '\%80v', 100)

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" > AUTOCOMMANDS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" au OR autocmd
au BufRead,BufNewFile *.ipy set filetype=python
au BufRead,BufNewFile *.json set filetype=json
au BufRead,BufNewFile *.rest set filetype=rest

" Remove trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" > CTRLP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO - CHANGE THE USER COMMAND TO ACK - CHECK TO SEE ACK IS AVAILABLE FIRST
" let g:ctrlp_user_command = 'ack'

" Specify files to ignore
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
" Turn off ctrlp if necessary
" let g:loaded_ctrlp = 1

" INITIAL CONFIG - MIHIR
"let g:ctrlp_user_command = 'find %s -name "*.js" -o -name "*.pm" -o -name "*.pl" -o -name "*.config" -type f'
" TODO - NOT SURE WHY THE BELOW LINE STOPPED WORKING. DOES IT HAVE SOMETHING TO DO WITH CHANGES TO FIND AND GREP I MADE EARLIER
"let g:ctrlp_user_command = 'find %s -type f | grep -v "`cat ~/.ctrlpignore`"'
let g:ctrlp_root_markers = ['.ctrlp']

" CACHE FOR FASTER RESULTS - KEVIN
:map <C-l> :CtrlPBuffer<CR>
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_cache_dir = '~/.cache/ctrlp'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_files = 20000
let g:ctrlp_working_path_mode = 'w'
let g:ctrlp_custom_ignore = {
      \ 'dir': '\v[\/](\.git|node_modules|mason)$',
      \}

" USING RIPGREP - NICK
"let ripgrep = '/home/nick/myapps/bin/rg'
"if executable(ripgrep)
  "let rg_options = '--files --follow --color=never --glob "!node_modules"'
  "let rg_sort_by_length = "awk '{print length, $0}' | sort -n | awk '{ print $2 }'"
  "let rg_base_command = ripgrep . " %s " . rg_options
  "let rg_command = rg_base_command . " | " . rg_sort_by_length
  "let g:ctrlp_user_command = rg_command
"endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" > TERMINAL EMULATOR
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" > BETTER PATH COMPLETION
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmode=longest,list,full
set wildmenu

" Set vim to chdir for each file
cabbr <expr> %% expand('%:p:h')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" > BUFFERS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! BufSel(pattern)
  let bufcount = bufnr("$")
  let currbufnr = 1
  let nummatches = 0
  let firstmatchingbufnr = 0
  while currbufnr <= bufcount
    if(bufexists(currbufnr))
      let currbufname = bufname(currbufnr)
      if(match(currbufname, a:pattern) > -1)
        echo currbufnr . ": ". bufname(currbufnr)
        let nummatches += 1
        let firstmatchingbufnr = currbufnr
      endif
    endif
    let currbufnr = currbufnr + 1
  endwhile
  if(nummatches == 1)
    execute ":buffer ". firstmatchingbufnr
  elseif(nummatches > 1)
    let desiredbufnr = input("Enter buffer number: ")
    if(strlen(desiredbufnr) != 0)
      execute ":buffer ". desiredbufnr
    endif
  else
    echo "No matching buffers"
  endif
endfunction

" Bind the BufSel() function to a user-command
command! -nargs=1 Bs :call BufSel("<args>")

" No prompt for unsaved changes while switching buffers
set hidden

" Close buffers without changing layout
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" > MISCELLANEOUS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Avoid scanning includes for autocompletion - slows it down
set complete-=i

" Avoid delay after esc to return to normal mode
"set timeoutlen=10 ttimeoutlen=0

" Flagship
set laststatus=2
set showtabline=2
set guioptions-=e

" vim-jsx
let g:jsx_ext_required = 0

"set ttimeoutlen=10

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" > LARGE FILES
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Handle files that are larger from 10mb
let g:LargeFile = 1024 * 1024 * 10
augroup LargeFile
 autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
augroup END

function LargeFile()
 " No syntax highlighting etc
 set eventignore+=FileType
 " Save memory when other file is viewed
 setlocal bufhidden=unload
 " Is read-only (write with :w new_filename)
 setlocal buftype=nowrite
 " No undo possible
 setlocal undolevels=-1
 " Display message
 autocmd VimEnter *  echo "The file is larger than " . (g:LargeFile / 1024 / 1024) . " MB, so some options are changed (see .vimrc for details)."
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" > SYNTASTIC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_json_checkers = ['jsonlint']

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0

"let g:syntastic_error_symbol = '✗'
"let g:syntastic_warning_symbol = '!'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" > YCM & SNIPPETS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:ycm_python_binary_path = 'python'
"let g:ycm_server_python_interpreter = '/usr/bin/python'
"let g:UltiSnipsEditSplit="vertical"
"
"" If you want :UltiSnipsEdit to split your window.
"" YouCompleteMe and UltiSnips compatibility, with the helper of supertab
"" (via http://stackoverflow.com/a/22253548/1626737)
"" make YCM compatible with UltiSnips (using supertab)
"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<C-n>'
"let g:SuperTabCrMapping = 0
"
"" Better key bindings for UltiSnipsExpandTrigger
"let g:UltiSnipsSnippetDirectories = [$HOME.'/dotfiles/vim/UltiSnips']
"let g:UltiSnipsExpandTrigger = "<tab>"
"let g:UltiSnipsJumpForwardTrigger      = '<C-l>'
"let g:UltiSnipsJumpBackwardTrigger     = '<C-k>'
