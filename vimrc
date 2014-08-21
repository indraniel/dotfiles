"==============================================================================
" Basic
"==============================================================================
set nocompatible
set esckeys

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
set cryptmethod=blowfish

"==============================================================================
" Plugins (managed by Vundle on github)
"==============================================================================
filetype off                                                       " required!

let g:vundle_default_git_proto='git'
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" UI Additions
" ------------
Bundle 'w0ng/vim-hybrid'
Bundle 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Bundle 'altercation/vim-colors-solarized'
Bundle '29decibel/codeschool-vim-theme'
Bundle 'nanotech/jellybeans.vim'
Bundle 'nelstrom/vim-mac-classic-theme'
Bundle 'bling/vim-airline'
Bundle 'roman/golden-ratio'
Bundle 'vim-scripts/LargeFile'
Bundle 'indraniel/vim-github-colorscheme'
Bundle 'Pychimp/vim-sol'
Bundle 'baskerville/bubblegum'
Bundle 'Lokaltog/vim-distinguished'
Bundle 'matthewtodd/vim-twilight'
Bundle 'jonathanfilip/vim-lucius'
Bundle 'reedes/vim-pencil'

" Navigation
" ----------
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'tpope/vim-rails'
Bundle 'vim-perl/vim-perl'

" Git Integrations
" ----------------
if executable('git')
    Bundle 'tpope/vim-git'
    Bundle 'tpope/vim-fugitive'
    Bundle 'gregsexton/gitv'
    Bundle 'int3/vim-extradite'
endif

Bundle 'tpope/vim-eunuch'

" Commands
" --------
Bundle 'tpope/vim-surround'

" Language Syntax
" ---------------
Bundle 'pfdevilliers/Pretty-Vim-Python'
Bundle 'vim-ruby/vim-ruby'
Bundle 'pangloss/vim-javascript'
Bundle 'itspriddle/vim-jquery'
Bundle 'zaiste/VimClojure'
Bundle 'tpope/vim-markdown'
" Choices are (1) 'tpope/vim-markdown', or (2) 'gmarik/vim-markdown' :
" which is a fork of (3) 'hallison/vim-markdown' or (4) 'plasticboy/vim-markdown'
Bundle 'mihai-rotaru/vim-asciidoc-ft-syntax'
Bundle 'laktek/distraction-free-writing-vim'
Bundle 'nelstrom/vim-markdown-folding'
Bundle 'puppetlabs/puppet-syntax-vim'
Bundle 'vim-scripts/confluencewiki.vim'
Bundle 'JuliaLang/julia-vim'
Bundle 'jnwhiteh/vim-golang'
Bundle 'gerw/vim-latex-suite'
Bundle 'msanders/cocoa.vim'
Bundle 'vim-scripts/Vim-R-plugin'

" Applications
" ------------
Bundle 'davidoc/taskpaper.vim'
Bundle 'szw/vim-dict'

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
" airline settings
"let g:airline_theme='bubblegum'
let g:airline_powerline_fonts=0
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_branch_prefix = '⭠'
let g:airline_readonly_symbol = '⭤'
let g:airline_linecolumn_prefix = '⭡'

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
" golden-ratio Adjustments
"==============================================================================
" disable automatic buffer resizes
let g:golden_ratio_autocommand = 0

" golden ratio resize toggle
" --------------------------
nnoremap <F7> :GoldenRatioToggle<CR>

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
map <C-t> :tabnew<CR>   " CTRL + t -- opens a new tab
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

