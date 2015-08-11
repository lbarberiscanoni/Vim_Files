syntax on
"Use TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.
filetype on
filetype indent on

"Colors
colorscheme lucius

"Always show current position
set ruler

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

"See help completion for source,
"Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
:set dictionary="/usr/dict/words"

"This triggers autocomplete for HTML code
"write the first bit, then do Ctrl-X and Ctrl-o 
:set omnifunc=htmlcomplete#CompleteTags
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

"This does the same thing as above, but for CSS
:set omnifunc=csscomplete#CompleteCSS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"This does autocompletion but for PHP
:set omnifunc=phpcomplete#CompletePHP
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

"Autocompletion for JavaScript
:set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

"Intense syntax for JS
au FileType javascript call JavaScriptFold()

"Autocompletion for Python
:set omnifunc=pythoncomplete#CompletePython
autocmd FileType python set omnifunc=pythoncomplete#CompletePython

"Vim plugins for Haskell
autocmd FileType haskell
	if !executable('ghc-mod')
		let b:did_ftplugin_ghcmod = 1
	endif

"Pathogen 
execute pathogen#infect()

"NERDTree
" automatically open when vim starts up
autocmd vimenter * NERDTree
" open NerdTree with Command-N
map <C-n> :NERDTreeToggle<CR>

"CSSLint
let g:CSSLint_FileTypeList = ['css', 'less', 'sess']

"SCSSlint
let g:syntastic_scss_checkers = ['scss_lint']

"Highliting Front Matter for Jekyll
let g:vim_markdown_frontmatter=1

"Changin tabs so that they are normal
:set tabstop=4
:set shiftwidth=4
:set expandtab

"Fuzzy Search
set runtimepath^=~/.vim/bundle/ctrlp.vim
