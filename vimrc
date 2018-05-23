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

"==============================================================================
" Plugins (managed by Vundle on github)
"==============================================================================
filetype off                                                       " required!

let g:vundle_default_git_proto='git'
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'VundleVim/Vundle.vim'

" UI Additions
" ------------
Plugin 'w0ng/vim-hybrid'
Plugin 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plugin '29decibel/codeschool-vim-theme'
Plugin 'nanotech/jellybeans.vim'
Plugin 'nelstrom/vim-mac-classic-theme'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'roman/golden-ratio'
Plugin 'vim-scripts/LargeFile'
Plugin 'Pychimp/vim-sol'
Plugin 'baskerville/bubblegum'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'matthewtodd/vim-twilight'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'reedes/vim-pencil'
Plugin 'morhetz/gruvbox'
Plugin 'epeli/slimux'
Plugin 'lifepillar/vim-solarized8'

" Navigation
" ----------
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'majutsushi/tagbar'
Plugin 'Valloric/YouCompleteMe'

" Git Integrations
" ----------------
if executable('git')
    Plugin 'tpope/vim-git'
    Plugin 'tpope/vim-fugitive'
    Plugin 'gregsexton/gitv'
    Plugin 'int3/vim-extradite'
endif

Plugin 'tpope/vim-eunuch'

" Commands
" --------
Plugin 'tpope/vim-surround'

" Language Syntax
" ---------------
Plugin 'vim-perl/vim-perl'
Plugin 'pfdevilliers/Pretty-Vim-Python'
Plugin 'vim-ruby/vim-ruby'
Plugin 'pangloss/vim-javascript'
Plugin 'itspriddle/vim-jquery'
Plugin 'guns/vim-clojure-static'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'tpope/vim-markdown'
" Choices are (1) 'tpope/vim-markdown', or (2) 'gmarik/vim-markdown' :
" which is a fork of (3) 'hallison/vim-markdown' or (4) 'plasticboy/vim-markdown'
Plugin 'mihai-rotaru/vim-asciidoc-ft-syntax'
Plugin 'laktek/distraction-free-writing-vim'
Plugin 'nelstrom/vim-markdown-folding'
Plugin 'fatih/vim-go'
Plugin 'gerw/vim-latex-suite'
Plugin 'vim-scripts/vim-niji'
Plugin 'kovisoft/paredit'
Plugin 'plytophogy/vim-virtualenv'
Plugin 'lambdalisue/vim-pyenv'
Plugin 'hylang/vim-hy'
Plugin 'kovisoft/slimv'
Plugin 'zah/nim.vim'
Plugin 'jpalardy/vim-slime'

" Applications
" ------------
Plugin 'szw/vim-dict'
Plugin 'tpope/vim-fireplace'
Plugin 'bhurlow/vim-parinfer'

call vundle#end()                                                " required!
filetype plugin indent on                                        " required!

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
" Fonts
"==============================================================================
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set showbreak=↪

" Need to use powerline patched fonts. See here for details:
" https://github.com/Lokaltog/vim-powerline/wiki/Patched-fonts
if has("unix")
  let os = substitute(system('uname'), "\n", "", "")
  if os == "Darwin"
    set guifont=Monaco\ for\ Powerline:h12
  elseif os == "Linux"
    set guifont=Ubuntu\ Mono\ 12
  endif
endif

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
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

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
" YouCompleteMe Adjustments
"==============================================================================
" needs to use the exact python that vim was originally compiled against
let os = substitute(system('uname'), "\n", "", "")
if os == "Darwin"
    let g:ycm_path_to_python_interpreter = "python"
elseif os == "Linux"
    let g:ycm_path_to_python_interpreter = "/gscuser/idas/.pyenv/versions/2.7.13/bin/python"
endif

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'vim' : ['re![_a-zA-Z]+[_\w]*\.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }

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
let g:paredit_leader = ','

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

let g:slime_target = "vimterminal"
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
let g:slimv_lisp = 'ros run'
let g:silmv_impl = 'sbcl'
let g:swank_block_size = 65536
if $TERM == 'screen-256color'
    let g:slimv_swank_cmd = '! tmux new-window -d -n REPL-SBCL' .
          \ '"ros run -Q --load ~/.vim/bundle/slimv/slime/start-swank.lisp"'
elseif $TERM == 'xterm-256color' && os == "Linux"
    let g:slimv_swank_cmd = '! xterm -e ros run -Q --load ~/.vim/bundle/slimv/slime/start-swank.lisp'
else
    let g:slimv_swank_cmd = "! osascript -e 'tell application \"iterm2\"' " .
          \ "-e 'activate' " .
          \ "-e 'tell current window to set tb to create tab with default profile' " .
          \ "-e 'tell current session of current window to write text " .
          \ "\"cd $PWD; ros run -Q --load ~/.vim/bundle/slimv/slime/start-swank.lisp\"' " .
          \ "-e 'end tell'"
endif
"let g:slimv_swank_cmd = '!osascript -e "tell application \"iTerm\" to do script \"ros run -Q --load ~/.vim/bundle/slimv/slime/start-swank.lisp\""'
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

" asciidoc
" --------
autocmd BufNewFile,BufRead *.asciidoc,*.ad setlocal syntax=asciidoc complete+=k


" confluence
" ----------
autocmd BufNewFile,BufRead *.confluence,*.cwiki setlocal syntax=confluencewiki

" ocaml
" -----
" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line

" scala
" -----
"let g:ensime_server_v2=1

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

" screen send shortcuts
" ---------------------
vmap <C-c><C-c> :ScreenSend<CR>

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

" Based on: From https://github.com/laktek/distraction-free-writing-vim
function! DistractionFreeWriting()
    colorscheme iawriter
    set background=light
    set gfn=Cousine:h16                                   " font to use
    set lines=30 columns=90                               " size of the editable area
    set fuoptions=background:#00f5f6f6                    " bakground color
    set guioptions-=r                                     " remove righ scrollbar
    set laststatus=0                                      " don't show status line
    set noruler                                           " don't show ruler
    set fullscreen                                        " go to fullscreen editing mode
    set linebreak                                         " break the lines on words
endfunction
command! DFW call DistractionFreeWriting()

" The Genome Institute at Washington University Specific
" ------------------------------------------------------

" Enable Perl Syntax Highlighting for special lims-env shebang line
function HandleLimsEnv()
  if getline(1) =~ '^#!\s*\S*\<lims-env\s\+perl'
    set ft=perl
  endif
endfunction
au BufRead * call HandleLimsEnv()

function ShowSchema()
    let currentWord = expand("<cword>")
    exe "!clear && schema -c " . currentWord . " | less"
    unlet currentWord
endfunction
map <C-s> :call ShowSchema()

"==============================================================================
" Macros
"==============================================================================
runtime macros/matchit.vim 

