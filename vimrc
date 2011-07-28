" Pathogen
call pathogen#runtime_append_all_bundles() 

" Color theme
let g:molokai_original = 1
set t_Co=256
colorscheme molokai

" Remap key bindings for windows style copy/paste/undo/selction/etc.
source $VIMRUNTIME/mswin.vim
behave mswin
syntax on

" General stuff
set number
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set showmatch
set mouse=a
set autoindent
set cursorline
set formatoptions+=r

" Status Line
set laststatus=2
set statusline=[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=%-16(\ %l,%c-%v\ %)%P

" Write files with sudo permissions
cmap w!! %!sudo tee > /dev/null %

" To get multiple undo working
set cpoptions-=u

" Remap functions
map gf :tabnew <cfile><CR>

" Code folding goodies
set fdc=2
set fdm=syntax
nnoremap <space> za
vnoremap <space> zf

set foldlevelstart=1
set foldnestmax=2

let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML

