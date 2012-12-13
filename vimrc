set nocompatible

" Remap key bindings for windows style copy/paste/undo/selction/etc.
" source $VIMRUNTIME/mswin.vim
" behave mswin

" Pathogen
call pathogen#runtime_append_all_bundles() 

" Color theme
syntax on
let g:molokai_original = 1
set t_Co=256
colorscheme molokai

" Get all sorts of fontacular across multiple platforms...
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Monospace\ 10
  elseif has("gui_win32")
    set guifont=Consolas:h10:cANSI
    set lines=56 columns=220
  endif
endif

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
set backspace=indent,eol,start

filetype off
filetype on

" Status Line Left Side
set laststatus=2
set statusline+=[%n]
set statusline+=\ %<%.99f
set statusline+=\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y
"" Status Line Right Side
set statusline+=%=
set statusline+=ASCII\:\ %03.b
set statusline+=\ %-16(\ %l,%c-%v\ %)%P

" Hex editing goodness
command Hex :%!xxd
command Unhex :%!xxd -r

" To get multiple undo working
set cpoptions-=u


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

let g:ragtag_global_maps=1

" Super nifty mappings
" --------------------
" Find word under cursor in files, recursing from current directory down
map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
" Open file under cursor in new tab
map gf :tabnew <cfile><CR>
" Make <c-u> play nice with undo
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>
" Write files with sudo permissions
cmap w!! %!sudo tee > /dev/null %
" Tagbar goodness
nmap <F8> :TagbarToggle<CR>
" NERD Tree Toggle
nmap <silent> <c-n> :NERDTreeToggle<CR>
" Ctrl + R search & replace of selection
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
" Toggle paste mode to play nice with PuTTY
set pastetoggle=<F12>
