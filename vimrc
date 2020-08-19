"==============================================================================
" Basic
"==============================================================================
set nocompatible
"set esckeys

" Text Formatting 
" ---------------
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab                    " Use shiftwidth to guide tab indention

" Backup
" ------
"set backup                     " enables the tilde (~) files

" Searching
" ---------
set showmatch
set hlsearch
set incsearch

" Encryption
" ----------
"set cryptmethod=blowfish2

" Host Python Program
" -------------------

let g:python3_host_prog = expand('~/.pyenv/versions/3.7.4/bin/python')
let g:python_host_prog = expand('~/.pyenv/versions/3.7.4/bin/python')

"==============================================================================
" Plugins (managed by vim-plug)
"==============================================================================

let gitlab = 'https://gitlab.com/'

" bootstrap plug.vim if necessary (see https://github.com/junegunn/vim-plug/wiki/tips)
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

" UI Additions
" ------------
Plug 'KevinGoodsell/vim-csexact'
Plug 'godlygeek/csapprox'
Plug 'w0ng/vim-hybrid'
Plug 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plug '29decibel/codeschool-vim-theme'
Plug 'nanotech/jellybeans.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'roman/golden-ratio'
Plug 'vim-scripts/LargeFile'
Plug 'Pychimp/vim-sol'
Plug 'baskerville/bubblegum'
Plug 'Lokaltog/vim-distinguished'
Plug 'matthewtodd/vim-twilight'
Plug 'jonathanfilip/vim-lucius'
Plug 'reedes/vim-pencil'
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-solarized8'

" Navigation
" ----------
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'majutsushi/tagbar'

" Git Integrations
" ----------------
if executable('git')
    Plug 'tpope/vim-git'
    Plug 'tpope/vim-fugitive'
    Plug 'gregsexton/gitv'
    Plug 'int3/vim-extradite'
endif

Plug 'tpope/vim-eunuch'

" Commands
" --------
Plug 'tpope/vim-surround'

" IDE-ish features
" ----------------
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'yami-beta/asyncomplete-omni.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
if executable('ctags')
    Plug 'prabirshrestha/asyncomplete-tags.vim'
    Plug 'ludovicchabant/vim-gutentags'
endif

" Language Syntax
" ---------------
Plug 'vim-perl/vim-perl'
Plug 'pfdevilliers/Pretty-Vim-Python'
Plug 'vim-ruby/vim-ruby'
Plug 'pangloss/vim-javascript'
Plug 'itspriddle/vim-jquery'
Plug 'guns/vim-clojure-static'
Plug 'kien/rainbow_parentheses.vim'
Plug 'tpope/vim-markdown'
" Choices are (1) 'tpope/vim-markdown', or (2) 'gmarik/vim-markdown' :
" which is a fork of (3) 'hallison/vim-markdown' or (4) 'plasticboy/vim-markdown'
Plug 'mihai-rotaru/vim-asciidoc-ft-syntax'
Plug 'nelstrom/vim-markdown-folding'
Plug 'fatih/vim-go'
Plug 'gerw/vim-latex-suite'
Plug 'vim-scripts/vim-niji'
"Plug 'kovisoft/paredit'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-repeat'
Plug 'plytophogy/vim-virtualenv'
Plug 'lambdalisue/vim-pyenv'
Plug 'alaviss/nim.nvim'
Plug 'broadinstitute/vim-wdl'
Plug 'wlangstroth/vim-racket'
Plug 'udalov/kotlin-vim'
Plug 'kovisoft/slimv'

" Applications
" ------------
Plug 'szw/vim-dict'
Plug 'tpope/vim-fireplace', { 'tag': 'v1.2' }
Plug 'venantius/vim-cljfmt'
Plug 'clojure-vim/async-clj-omni'
"Plug 'clojure-vim/acid.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'Olical/conjure', { 'tag': 'v0.22.0', 'do': 'bin/compile' }
Plug gitlab.'HiPhish/repl.nvim'

call plug#end()                                                " required!

"==============================================================================
" Colors
"==============================================================================
" Apple's Terminal.app has 8-colors
if $COLORTERM == 'gnome-terminal'
   set t_Co=256
   colorscheme railscasts
elseif $XTERM_VERSION == 'XTerm(256)'
    set t_Co=256
    colorscheme mustang
elseif $TERM_PROGRAM == 'iTerm.app'
    set t_Co=256
    colorscheme railscasts
elseif $TERM == 'screen-256color'
    set t_Co=256
    colorscheme railscasts
elseif $TERM == 'xterm-256color'
    set t_Co=256
    colorscheme railscasts
else 
    colorscheme default
endif

syntax on
let g:LargeFile=20 " Files larger than 20MB will not have syntax highlighting

"==============================================================================
" Leader
"==============================================================================
let mapleader = ","

"==============================================================================
" (neovim) Terminal adjustments
"==============================================================================
if has('nvim')
  " see: http://vimcasts.org/episodes/neovim-terminal-mappings/
  tnoremap <Esc> <C-\><C-n> 
  tnoremap <C-v><Esc> <Esc> 
endif

"==============================================================================
" Fonts
"==============================================================================
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set showbreak=↪

"==============================================================================
" Status Bar (vim powerline) Adjustments
"==============================================================================
set ruler
set showmode
"let g:airline_theme='bubblegum'
" airline settings
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_powerline_fonts=0
" unicode symbols
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" always show the status bar
set laststatus=2

"==============================================================================
" NERDtree Adjustments
"==============================================================================
" Make nerdtree look nice
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 30

"==============================================================================
" NERDtree Tabs Adjustments
"==============================================================================
let g:nerdtree_tabs_open_on_gui_startup = 0
nnoremap <F2> :NERDTreeTabsToggle<CR>

"==============================================================================
" Tagbar Adjustments
"==============================================================================
" some source code breakdowns for R scripts (using in conjunction with ctags)
let g:tagbar_type_r = {
    \ 'ctagstype' : 'r',
    \ 'kinds'     : [
        \ 'f:Functions',
        \ 'g:GlobalVariables',
        \ 'v:FunctionVariables',
    \ ]
\ }"
nnoremap <F8> :TagbarToggle<CR>

"==============================================================================
" golden-ratio Adjustments
"==============================================================================
" disable automatic buffer resizes
let g:golden_ratio_autocommand = 0

" golden ratio resize toggle
" --------------------------
nnoremap <F7> :GoldenRatioToggle<CR>

"==============================================================================
" REPL.nvim adjustments
"==============================================================================
let g:repl = {}
let g:repl['python'] = {
    \ 'bin': 'python',
    \ 'args': [],
    \ 'syntax': 'python',
    \ 'title': 'Python REPL'
\ }

let g:repl['scheme'] = {
    \ 'bin': 'rlwrap csi',
    \ 'args': [],
    \ 'syntax': '',
    \ 'title': 'Chicken REPL'
\ }

let g:repl['racket'] = {
    \ 'bin': 'racket -il xrepl',
    \ 'args': [],
    \ 'syntax': '',
    \ 'title': 'Racket REPL'
\ }

let g:repl['clojure'] = {
    \ 'bin': 'LEIN_USE_BOOTCLASSPATH=no lein',
    \ 'args': ['repl'],
    \ 'syntax': '',
    \ 'title': 'Clojure nREPL'
\ }

" Send the text of a motion to the REPL
nmap <leader>rs  <Plug>(ReplSend)
" Send the current line to the REPL
nmap <leader>rss <Plug>(ReplSendLine)
nmap <leader>rs_ <Plug>(ReplSendLine)
" Send the selected text to the REPL
vmap <leader>rs  <Plug>(ReplSend)

"==============================================================================
" Mouse
"==============================================================================
"set mouse=a " work in all modes
"set mouse=n " only work in normal mode (not in visual or insert mode)

"==============================================================================
" Dictionary
"==============================================================================
" generally set on unix systems here
set dictionary+=/usr/share/dict/words

"==============================================================================
" vim-pencil setups
"==============================================================================
let g:pencil#wrapModeDefault = 'hard'

"==============================================================================
" Programming Languages
"==============================================================================

" perl
" -----
autocmd FileType perl setlocal cindent shiftwidth=4
autocmd BufRead *.t setlocal syntax=perl
autocmd BufNewFile,BufRead *.tt2 setlocal syntax=html
let perl_fold = 1
" let perl_fold_blocks = 1

" python 
" ------
autocmd FileType python setlocal smartindent shiftwidth=4 softtabstop=4 formatoptions+=croq cinwords=if,elif,else,for,while,try,except,finally,def,class,with foldmethod=indent foldnestmax=4
let python_highlight_all=1
let python_highlight_exceptions=0
let python_hightlight_builtins=0

" disable autocompletion; we use asyncomplete for completion
" let g:jedi#completions_enabled = 0
" open the go-to function in splits, not another buffer
" let g:jedi#use_splits_not_buffers = "right"

" hylang
" ------
autocmd BufNewFile,BufRead *.hy setlocal ft=hy
autocmd FileType hy setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" ruby
" ----
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" go
" --
autocmd BufNewFile,BufRead *.go setlocal ft=go
autocmd FileType go setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4

" c/c++
" -----
autocmd FileType c setlocal cindent shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType cpp setlocal cindent shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd FileType objc setlocal cindent shiftwidth=4 tabstop=4 softtabstop=4 expandtab
let c_no_curly_error=1

" Objective C
" -----------
autocmd BufNewFile,BufRead *.m,*.h setlocal ft=objc
autocmd FileType objc setlocal cindent tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" Octave/Matlab
" -------------
"autocmd FileType matlab setlocal tabstop=8 softtabstop=2 shiftwidth=2 expandtab

" r
" -------------
autocmd BufNewFile,BufRead *.r,*.R setlocal ft=r
autocmd FileType r setlocal tabstop=4 softtabstop=2 shiftwidth=2 expandtab

" vim
" ---
autocmd FileType vim setlocal expandtab shiftwidth=2 tabstop=8 softtabstop=2

" javascript
" ----------
autocmd FileType javascript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd BufNewFile,BufRead *.json setlocal ft=javascript
let javascript_enable_domhtmlcss=1

" Racket/Scheme/Clojure/Common-Lisp related
" -----------------------------------------
autocmd BufNewFile,BufRead *.clj,*.cljs, setlocal ft=clojure
autocmd BufNewFile,BufRead *.cl,*.lisp, setlocal ft=lisp

let g:niji_dark_colours = [
    \ [ '81', '#5fd7ff'],
    \ [ '99', '#875fff'],
    \ [ '1',  '#dc322f'],
    \ [ '76', '#5fd700'],
    \ [ '3',  '#b58900'],
    \ [ '2',  '#859900'],
    \ [ '6',  '#2aa198'],
    \ [ '4',  '#268bd2'],
    \ ]

if has('nvim')
    let g:slime_target = "neovim"
else
    let g:slime_target = "vimterminal"
endif

nnoremap <F3> :RainbowParenthesesToggle<CR>

" cmake
" -----
autocmd BufNewFile,BufRead CMakeLists.txt setlocal ft=cmake

" css
" ---
autocmd FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" markdown
" --------
autocmd BufNewFile,BufRead *.md setlocal ft=markdown complete+=k
let g:markdown_composer_autostart = 0
let g:markdown_composer_open_browser = 0

" asciidoc
" --------
autocmd BufNewFile,BufRead *.asciidoc,*.ad setlocal syntax=asciidoc complete+=k


" nim
" ---
au BufNewFile,BufRead *.nim set filetype=nim
autocmd FileType nim setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" nim-lang helpful utility
"    Pressing meta+g will then jump to the definition of the word your cursor
"    is on. This uses the nim compiler instead of ctags, so it works on any
"    nimrod file which is compilable without requiring you to maintain a
"    database file.
fun! JumpToDef()
  if exists("*GotoDefinition_" . &filetype)
    call GotoDefinition_{&filetype}()
  else
    exe "norm! \<C-]>"
  endif
endf

" Jump to tag
nn <M-g> :call JumpToDef()<cr>
ino <M-g> <esc>:call JumpToDef()<cr>i


"==============================================================================
" asyncomplete.vim / Omni-Complete Setup
"==============================================================================

" file completion
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'whitelist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))

" ctags (c programming)
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#tags#get_source_options({
    \ 'name': 'tags',
    \ 'whitelist': ['c'],
    \ 'completor': function('asyncomplete#sources#tags#completor'),
    \ 'config': {
    \    'max_file_size': 50000000,
    \  },
    \ }))

" omni-completion
call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
\ 'name': 'omni',
\ 'whitelist': ['*'],
\ 'blacklist': ['c', 'cpp', 'html'],
\ 'completor': function('asyncomplete#sources#omni#completor')
\  }))

" python
if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

" nim
au User asyncomplete_setup call asyncomplete#register_source({
    \ 'name': 'nim',
    \ 'whitelist': ['nim'],
    \ 'completor': {opt, ctx -> nim#suggest#sug#GetAllCandidates({start, candidates -> asyncomplete#complete(opt['name'], ctx, start, candidates)})}
    \ })

" clojure
au User asyncomplete_setup call asyncomplete#register_source({
    \ 'name': 'async_clj_omni',
    \ 'whitelist': ['clojure'],
    \ 'completor': function('async_clj_omni#sources#complete'),
    \ })

" kotlin
if executable(expand('~/sw/kotlin/lsp/server/bin/kotlin-language-server'))
    au User lsp_setup call lsp#register_server({
        \ 'name': 'kotlin-language-server',
        \ 'cmd': {server_info->[
        \     &shell,
        \     &shellcmdflag,
        \     expand('~/sw/kotlin/lsp/server/bin/kotlin-language-server')
        \ ]},
        \ 'whitelist': ['kotlin']
        \ })
endif

"==============================================================================
" History Niceties
"==============================================================================

" Only do this part when compiled with support for autocommands.
if has("autocmd")
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

endif " has("autocmd") 

"==============================================================================
" Mappings
"==============================================================================

" tab shortcuts
" -------------
nnoremap tt :tabnew<CR>   " <normal mode> tt -- opens a new tab
map <C-h> :tabp<CR>     " CTRL + h -- moves one tab to the left
map <C-l> :tabn<CR>     " CTRL + l -- moves one tab to the right

" OmniComplete -- Ctrl+N -- Remappings
" taken from http://vim.sourceforge.net/tips/tip.php?tip_id=1386
" --------------------------------------------------------------
if version > 700
    set completeopt=longest,menuone
    inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
    inoremap <expr> <c-n> pumvisible() ? "\<lt>c-n>" : "\<lt>c-n>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>"
    inoremap <expr> <m-;> pumvisible() ? "\<lt>c-n>" : "\<lt>c-x>\<lt>c-o>\<lt>c-n>\<lt>c-p>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>"
    inoremap <C-Space> <C-x><C-o>
endif

"==============================================================================
" Functions
"==============================================================================

" helpful setup when letter or document writing
" see http://www.drbunsen.org/writing-in-vim.html
" -----------------------------------------------
function! WordProcessorMode()
    setlocal formatoptions=1
    setlocal noexpandtab
    map j gj
    map k gk
    setlocal spell spelllang=en_us
    set complete+=s
    set formatprg=par
    setlocal wrap
    setlocal linebreak
endfunction
command! WP call WordProcessorMode()

" The Genome Institute at Washington University Specific
" ------------------------------------------------------

" Enable Perl Syntax Highlighting for special lims-env shebang line
function HandleLimsEnv()
  if getline(1) =~ '^#!\s*\S*\<lims-env\s\+perl'
    set ft=perl
  endif
endfunction
au BufRead * call HandleLimsEnv()

"==============================================================================
" Macros
"==============================================================================
runtime macros/matchit.vim 

