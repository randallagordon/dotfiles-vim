" Make Vim behave in a more useful way
set nocompatible

" Powerline!
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
set encoding=utf-8
set noshowmode
" Powerline GUI awesomeness, if a patched font is available
set guifont=Consolas\ for\ Powerline\ FixedD:h9

" Pathogen
call pathogen#runtime_append_all_bundles() 


" Status Line Left Side
set laststatus=2
set statusline=
set statusline+=[%n]
set statusline+=\ %<%.99f
set statusline+=\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y
"" Status Line Right Side
set statusline+=%=
set statusline+=ASCII\:\ %03.b
set statusline+=\ %-16(\ %l,%c-%v\ %)%P

" Color theme
syntax on
set hlsearch
set incsearch
let g:molokai_original = 1
let g:rehash256 = 1
set t_Co=256
colorscheme molokai

" Color tweaks
highlight SpellBad term=reverse ctermfg=8 ctermbg=52 gui=undercurl guisp=#FF0000
highlight SpellCap term=reverse ctermfg=8 ctermbg=17 gui=undercurl guisp=#FF0000

" Highlight word under cursor
autocmd CursorMoved * exe printf('match Underlined /\V\<%s\>/', escape(expand('<cword>'), '/\'))

" Spell check
setlocal spell spelllang=en_us

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
set relativenumber
set tabstop=2
set shiftwidth=2
set smarttab
set showmatch
set mouse=a
set autoindent
set cursorline
set formatoptions+=r
set backspace=indent,eol,start
set ttyfast
set wildmenu
set wildmode=longest:full,full

" Undo Stuff
set cpoptions-=u
set undofile

" Filetype settings
filetype off " makes vim-coffee-script play nice with Pathogen
filetype plugin indent on
if has("autocmd")
  " TODO: Get fancy with PEP8 for Python
  " Currently using ftplugin/python.vim
  " Use flake8? https://github.com/nvie/vim-flake8
  " Or python-mode? https://github.com/klen/python-mode

  " House styles
  autocmd FileType vim setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType coffee setlocal ts=2 sts=2 sw=2 expandtab

  " Similar format mappings
  autocmd BufNewFile,BufRead *.json set ft=javascript
  autocmd BufNewFile,BufRead .jshintrc set ft=javascript
  autocmd BufNewFile,BufRead *.rss setfiletype xml
  autocmd BufNewFile,BufRead *.blade setfiletype jade
endif

" Hex editing goodness
if !exists(":DiffOrig")
  command Hex :%!xxd
  command Unhex :%!xxd -r
endif

" Make screen/byobu happy
if &term == "screen-bce"
  set ttymouse=xterm2
  imap <Up> <ESC>kj
  imap <Down> <ESC>ki
  imap <Right> <ESC>kl
  imap <Left> <ESC>kh
endif
set term=screen-256color

" Code folding goodies
set fdc=2
set fdm=syntax
nnoremap <space> za
vnoremap <space> zf
set foldlevelstart=99
set foldnestmax=2
let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML

" listchars setup, with toggle
nmap <leader>c :set list!<CR>
set listchars=tab:▸\ ,eol:¬
highlight NonText guifg=#4a4a59 ctermfg=236 ctermbg=NONE
highlight SpecialKey guifg=#4a4a59 ctermfg=236 ctermbg=NONE
set list

" Better symbols for Syntastic
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'

" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Store swap files in fixed location, not current directory.
set dir=~/.vimswap//,/var/tmp//,/tmp//,.
set undodir^=~/.vimswap

" Diff current buffer against saved file
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
    \ | wincmd p | diffthis
  map <leader>d :DiffOrig<CR>
endif

" Source the vimrc file after saving it
"autocmd BufWritePost vimrc source $MYVIMRC

" Width column highlight
set colorcolumn=+1
highlight ColorColumn ctermbg=234 guibg=#1c1c1c

" Super nifty mappings
" ----------------------------------------------------------------------------

" Save some damn time!
inoremap jj <ESC>
let mapleader = ","

" Make cursor stay put after yanking
vmap y ygv<Esc>

" Bubble single lines
nmap <C-K> [e
nmap <C-J> ]e
" Bubble multiple lines
vmap <C-K> [egv
vmap <C-J> ]egv

" Jump between splits (Currently remaps single-line bubbles in normal)
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ragtag
let g:ragtag_global_maps=1
" Find word under cursor in files, recursing from current directory down
map <leader>f :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>
" Open file under cursor in new tab
map gf :tabnew <cfile><CR>
" Make <c-u> play nice with undo
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>
" Write files with sudo permissions
cmap w!! %!sudo tee > /dev/null %
" Tagbar goodness
nmap <leader>\ :TagbarToggle<CR>
" TaskList plugin
map <leader>td <Plug>TaskList
" NERD Tree Toggle
nmap <silent> <c-n> :NERDTreeToggle<CR>
" Ctrl + R search & replace of selection
vnoremap <leader>r "hy:%s/<C-r>h//gc<left><left><left>
" Toggle paste mode to play nice with PuTTY
set pastetoggle=<leader>p
" Clear last search highlighting
map <leader>/ :noh<CR>
" visual indenting
vnoremap < <gv
vnoremap > >gv
" Spell check string literals
" TODO: Per-language functions?
function! SpellcheckStrings()
  if exists('g:spellcheckStrings')
    syn region  javaScriptStringD        start=+"+  skip=+\\\\\|\\"+  end=+"\|$+ contains=javaScriptSpecial,@htmlPreproc,@NoSpell
    syn region  javaScriptStringS        start=+'+  skip=+\\\\\|\\'+  end=+'\|$+ contains=javaScriptSpecial,@htmlPreproc,@NoSpell
    unlet g:spellcheckStrings
  else
    syn region  javaScriptStringD        start=+"+  skip=+\\\\\|\\"+  end=+"\|$+ contains=javaScriptSpecial,@htmlPreproc,@Spell
    syn region  javaScriptStringS        start=+'+  skip=+\\\\\|\\'+  end=+'\|$+ contains=javaScriptSpecial,@htmlPreproc,@Spell
    let g:spellcheckStrings = "@Spell"
  endif
endfunction
map <leader>s :call SpellcheckStrings()<CR>
" PEP8
let g:pep8_map='<leader>8'

