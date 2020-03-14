" echo ">^.^< Hello Johnny!"

" Function to source only if file exists {  
function! SourceIfExists(file)              
  if filereadable(expand(a:file))           
    exe 'source' a:file                     
  endif                                     
endfunction                                 
" }                                         
                                            
" call SourceIfExists("/etc/vimrc")         

" If the filetype is Makefile then we need to use tab
" So do not expand tabs into space.
if has('autocmd')
    autocmd FileType make   set noexpandtab
endif

""""""""""""""""""
" > GENERAL
""""""""""""""""""
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

" line numbers
set nu
map <C-n> :set nu!<cr>

" comma is more convenient for leader
let mapleader=","

