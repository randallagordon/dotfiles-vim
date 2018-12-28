" Make Vim behave in a more useful way
set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pathogen
call pathogen#infect()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle, required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle Plugins

" Color Schemes
Plugin 'tomasr/molokai'
Plugin 'altercation/vim-colors-solarized'

Plugin 'google/vim-maktaba'
Plugin 'google/vim-glaive'
call glaive#Install()
Plugin 'google/vim-coverage'

" Vim Extras
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'suan/vim-instant-markdown' " Requires extra installation step: https://github.com/suan/vim-instant-markdown.git
Plugin 'vim-scripts/TaskList.vim'
Plugin 'qpkorr/vim-bufkill'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'junegunn/rainbow_parentheses.vim'
Plugin 'nathanaelkane/vim-indent-guides'
" Possibly related to weirdness with completion? (jj not escaping):
" https://github.com/Valloric/YouCompleteMe/pull/2657/files#diff-bfddd777a9469dbfe6722747c01caa39R35
Plugin 'Valloric/YouCompleteMe'
Plugin 'Raimondi/delimitMate' " YCM has issues with vim-autoclose
Plugin 'editorconfig/editorconfig-vim'
Plugin 'kshenoy/vim-signature' " Shows marks in guttter
Plugin 'mhinz/vim-signify' " Shows git diff info in gutter
Plugin 'kien/ctrlp.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'milkypostman/vim-togglelist'
Plugin 'rking/ag.vim'
Plugin 'ap/vim-css-color'
Plugin 'gregsexton/gitv'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'BenBergman/vsearch.vim'
Plugin 'chrisbra/NrrwRgn'
Plugin 'embear/vim-localvimrc'
Plugin 'rizzatti/dash.vim'
Plugin 'SirVer/ultisnips'
Plugin 'adelarsq/vim-matchit'

" Motions
Plugin 'Lokaltog/vim-easymotion'
Plugin 'bkad/CamelCaseMotion'
Plugin 'vim-scripts/CountJump'
Plugin 'vim-scripts/vim_movement'
Plugin 'tmhedberg/indent-motion'

" So many tpope goodies!
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-characterize'
Plugin 'tpope/vim-dadbod'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-dotenv'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-heroku'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'

" Language/Tooling Specific Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Elm
" Plugin 'lambdatoast/elm.vim'

" JavaScript/Node
Plugin 'pangloss/vim-javascript'
Plugin 'moll/vim-node'
Plugin 'okcompute/vim-javascript-motions'

" JSX
" Plugin 'neoclide/vim-jsx-improve'
Plugin 'mxw/vim-jsx'

" Python
" Plugin 'vim-scripts/pep8'
" Plugin 'jmcomets/vim-pony'

" Ruby/Rails
" Plugin 'tpope/vim-rails'
" Plugin 'tpope/vim-rbenv'

" TypeScript
" Plugin 'leafgarland/typescript-vim'
" Plugin 'peitalin/vim-jsx-typescript'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Wrap up Vundle setup
call vundle#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Powerline!
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
set rtp+=$HOME/src/powerline/powerline/bindings/vim/
set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim/
set encoding=utf-8
set noshowmode
" Powerline GUI awesomeness, if a patched font is available
set guifont=Consolas\ for\ Powerline\ FixedD:h9

" Now taken over by Powerline, but left for times when it isn't available
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" Width column highlight
set colorcolumn=+1
highlight ColorColumn ctermbg=234 guibg=#1c1c1c

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Get all sorts of fontacular across multiple platforms...
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Monospace\ 10
  elseif has("gui_win32")
    set guifont=Consolas:h10:cANSI
    set lines=56 columns=220
  endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General stuff
set relativenumber
set number " Vim 7.4 lets us have both! Woo!
set tabstop=2
set shiftwidth=2
set smarttab
set showmatch
set autoindent
set cursorline
set formatoptions+=r
set backspace=indent,eol,start
set ttyfast
set wildmenu
set wildmode=longest:full,full
set wildignore+=*/node_modules/*,*.so,*.swp,*.zip

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mouse Stuff
set mouse=a
set ttymouse=xterm2
if has('mouse_sgr')
    set ttymouse=sgr
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Undo Stuff
set cpoptions-=u
set undofile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype settings
filetype off " Reset stuff for Pathogen
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
  autocmd FileType typescript setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType coffee setlocal ts=2 sts=2 sw=2 expandtab

  " Similar format mappings
  " autocmd BufNewFile,BufRead *.json set ft=javascript
  autocmd BufNewFile,BufRead .jshintrc set ft=javascript
  autocmd BufNewFile,BufRead *.rss setfiletype xml
  autocmd BufNewFile,BufRead *.blade setfiletype jade
  autocmd BufNewFile,BufReadPost *.md set filetype=markdown

  " WTF Git? Text width stopped working from the default gitcommit package
  au FileType gitcommit setlocal tw=72
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Let vim-jsx do its thing even with *.js files
let g:jsx_ext_required = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Hex editing goodness
if !exists(":DiffOrig")
  command Hex :%!xxd
  command Unhex :%!xxd -r
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make screen/byobu happy
set term=screen-256color " Fix redraw weirdness with background disappearing
imap <Up> <ESC>kj
imap <Down> <ESC>ki
imap <Right> <ESC>kl
imap <Left> <ESC>kh

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Code folding goodies
set fdc=2
set fdm=syntax
nnoremap <space> za
vnoremap <space> zf
set foldlevelstart=99
set foldnestmax=5
let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
" vim-jsx does weird things with this set
"let xml_syntax_folding=1      " XML

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" listchars setup, with toggle
nmap <leader>c :set list!<CR>
set listchars=tab:▸\ ,eol:¬,nbsp:␣
highlight NonText guifg=#4a4a59 ctermfg=236 ctermbg=NONE
highlight SpecialKey guifg=#4a4a59 ctermfg=236 ctermbg=NONE
set list

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Syntastic Settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Show ALL errors, crucial for scss-lint
let g:syntastic_aggregate_errors = 1

" Better symbols for Syntastic
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'

" Default Syntastic Checkers
"let g:syntastic_javascript_checkers = ['standard']
let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_ruby_checkers = ['rubocop', 'mri', 'rubylint']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Override settings for vim-autoformat
let g:formatprg_args_javascript='%'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Store swap files in fixed location, not current directory.
set dir=~/.vimswap//,/var/tmp//,/tmp//,.
set undodir^=~/.vimswap

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Diff related mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Diff current buffer against saved file
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
    \ | wincmd p | diffthis
  nmap <leader>d :DiffOrig<CR>
endif
" Diff open buffers
nmap <leader>dt :windo diffthis<CR>
" Off
nmap <leader>do :windo diffoff<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Source the vimrc file after saving it
"autocmd BufWritePost vimrc source $MYVIMRC

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-indent-guides config and colors
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=236

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Super nifty mappings

" Save some damn time!
inoremap jj <ESC>
let mapleader = ","
map ; :
noremap ;; ;

" Make cursor stay put after yanking
vmap y ygv<Esc>

" Bubble single lines with vim-unimpaired
nmap <leader>j ]e
nmap <leader>k [e
" Bubble multiple lines with vim-unimpaired
vmap <leader>j ]egv
vmap <leader>k [egv

" Jump between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" tmux-esque window (buffer) zoom
nnoremap <C-w>z :tab sb<cr>

" File open helpers
" http://vimcasts.org/e/14
nmap <leader>ew :e <C-R>=expand('%:h').'/'<cr>
nmap <leader>es :sp <C-R>=expand('%:h').'/'<cr>
nmap <leader>ev :vsp <C-R>=expand('%:h').'/'<cr>
nmap <leader>et :tabe <C-R>=expand('%:h').'/'<cr>

" Yank from the cursor to the end of the line, to be consistent with C and D
nnoremap Y y$

" Copy relative path to the system pasteboard
nnoremap <silent><Leader>cfn :let @*=expand('%')<CR>

" Copy relative path and line number to the system pasteboard
nnoremap <silent><Leader>cln :let @*=expand('%').':'.line('.')<CR>

" Yank to system pasteboard with <Leader>y
noremap  <Leader>y  "*y
nnoremap <Leader>yy "*yy

" Find word under cursor in files, recursing from current directory down
map <leader>f :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

" Open file under cursor in new tab - Already mapped to <c-w>gf, commenting
" out for now since the original gf to open in the current buffer is useful
"map gf :tabnew <cfile><CR>

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
nmap ,n :NERDTreeFind<CR>

" Ctrl + R style search & replace of selection
vnoremap <leader>r "hy:%s/<C-r>h//gc<left><left><left>

" Toggle paste mode to play nice with PuTTY
set pastetoggle=<leader>p

" Clear last search highlighting
map <leader>/ :noh<CR>

" visual indenting
vnoremap < <gv
vnoremap > >gv


" Spell check
setlocal spell spelllang=en_us

" Spell check based word completion
set complete+=kspell

" Spell check string literals
" TODO: Per-language functions?
function! SpellcheckStrings()
  set spell
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

" Turn off spellcheck entirely
map <leader><leader>s :set nospell<cr>

" PEP8
let g:pep8_map='<leader>8'

" vim-rails mappings
nmap <leader>r :Rake<CR>

" vim-fugititve mappings
nmap <leader>gb :Gblame<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Git push<CR>

" Make vim-fugitive's Ggrep more awesome!
command -nargs=+ Ggr execute 'silent Ggrep!' <q-args> | cw | redraw!

" Map CamelCaseMotion motions over standard motions
" Remember this is here, could cause some issues with macros and repeats
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e
" TODO: Fix ALL issues with `w` motion including space after the word
nmap cw ce
nmap dw de

" vim-node config
autocmd User Node
  \ if &filetype == "javascript" |
  \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
  \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
  \ endif

" scoped, provenance
nmap <leader>sc :exe "!scoped % --position=" . line(".")<CR>
nmap <leader>sx :exe "!provenance % " . line(".") . " " . col(".") . "\| dot -Tpng \| ql" <CR>

" Syntastic :Errors Mapping
map <leader>e :Errors<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin settings 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ragtag
let g:ragtag_global_maps=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" dash.vim
"nmap <silent> <leader>d <Plug>DashSearch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDCommenter Settings
let NERDSpaceDelims=1 " Add spaces after `//` comments
let NERDTreeWinSize = 50

" YCM
let g:ycm_autoclose_preview_window_after_insertion = 1
"set ttimeoutlen=10 " Might help with motions/escaping not playing nice
" http://www.polarhome.com/vim/manual/v57/options.html#'timeoutlen'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make YouCompleteMe & UltiSnips play nice using Supertab
" http://0x3f.org/blog/make-youcompleteme-ultisnips-compatible/

" Default Config
"let g:ycm_key_list_select_completion = ['<C-Tab>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-S-Tab>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<C-Tab>'

" Make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" Better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-multiple-cursors
"let g:multi_cursor_use_default_mapping=0
"let g:multi_cursor_next_key='<C-m>'
"let g:multi_cursor_prev_key='<C-p>'
"let g:multi_cursor_skip_key='<C-x>'
"let g:multi_cursor_quit_key='<Esc>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-javascript
set conceallevel=1
hi clear Conceal
hi Conceal ctermfg=81
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
" Obviated by Fira Code's ligatures:
" let g:javascript_conceal_arrow_function       = "⇒"
