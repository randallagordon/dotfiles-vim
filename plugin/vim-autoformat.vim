"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Override settings for vim-autoformat
" let g:formatprg_args_javascript='%'

" Define formatters for supertypes
let g:formatters_javascript_jsx = ['prettier']
let g:formatters_jsx = ['prettier']

" Autoformat on write
au BufWrite * :Autoformat
