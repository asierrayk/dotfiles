set nocompatible              " This should be the first line
set t_Co=256                  " number of colors
set t_ut=                     " probably needed for tmux compatibility
set background=dark
if has('nvim')
    set mouse=a
else
    set mouse=n
    set ttymouse=xterm2
endif

set visualbell
set t_vb=

filetype plugin indent on
syntax on

set clipboard=unnamed

set history=1000            " increase history size
set noswapfile
set nobackup

" Indentation
set autoindent              " Copy indent from current line when starting a new line
set expandtab               " expand tabs
set shiftwidth=4            " spaces for autoindenting
set softtabstop=4           " remove a full pseudo-TAB when i press <BS>

set encoding=utf-8          " always use unicode
set backspace=indent,eol,start " backspace always works on insert mode
set hidden            " When off a buffer is unloaded when it is abandoned

set wildmenu            " Autocompletion for commands
set noshowmode          " Required for jedi-vim function signature
set laststatus=2        " Always show status bar
set number              " Show line numbers
set norelativenumber      " Show relative line numbers
set showmatch           " Highlight matching parentheses and brackets
set nofoldenable        " When off, all folds are open

set hlsearch            " Highlight search
set incsearch
nnoremap <silent> <esc> :noh<CR><esc>
nnoremap <esc>^[ <esc>^[

" .: Scan the current buffer
" w: Scan buffers from other windows
" b: Scan buffers from the buffer list
" u: Scan buffers that have been unloaded from the buffer list
" t: Tag completion
" i: Scan the current and included files
" kspell: Dictionary only when spell is enabled, :set spell
set complete=.,w,b,u,t,i,kspell
set completeopt=menu
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*/.venv/*,*/venv/*,*/logs/*,*/.mypy_cache/*

" Spell check
set nospell
set spelllang=en_us,es

" Fix last spell error
nnoremap <c-S> [s1z=``
inoremap <c-S> <c-O>[s<c-O>1z=<c-O>``

call plug#begin()

" Plug '~/.vim/plugged/YouCompleteMe'
" Plug 'Valloric/YouCompleteMe'

" Appearance
Plug 'jnurmine/Zenburn'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
" Plug 'edkolev/promptline.vim' TODO check if makes sense to use it
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'

" theme 

" general programming languages
" Plug 'scrooloose/syntastic'
Plug 'dense-analysis/ale'
" Plug 'ludovicchabant/vim-gutentags' TODO check if makes sense to use it

" python specific
" Plug 'python-mode/python-mode'
" Plug 'jimf/vim-pep8-text-width'
Plug 'vim-scripts/indentpython.vim'
Plug 'mgedmin/python-imports.vim'
Plug 'vim-python/python-syntax'

Plug 'davidhalter/jedi-vim'

Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }

" json
Plug 'tpope/vim-jdaddy'

" jenkinsfile
Plug 'thanethomson/vim-jenkinsfile'

" Editing
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
" TODO use this instead of vim-multiple-cursors https://github.com/mg979/vim-visual-multi
Plug 'terryma/vim-multiple-cursors'
" to camelCase crc, to snake_case crs
Plug 'tpope/vim-abolish'
Plug 'sjl/gundo.vim'

" snippets engine
Plug 'SirVer/ultisnips'

" snippets
Plug 'honza/vim-snippets'

" snippets autocomplete deoplete
" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif

" tmux
Plug 'christoomey/vim-tmux-runner'
Plug 'christoomey/vim-tmux-navigator'

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Latex?
" Plug 'lervag/vimtex'

" Markdown preview
" If you don't have nodejs and yarn
" use pre build
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" My own plugins :)
Plug 'asierrayk/vim-toggle'

" All of your plugins must be added before the following line
call plug#end()

" Leader key
map <Space> <leader>

" PYTHON SUPPORT
if has('nvim')
    let g:python3_host_prog = expand('~/.pyenv/versions/neovim3/bin/python')  " Python 3
endif


" pydocstring
let g:pydocstring_formatter = 'sphinx'
nmap <silent> <C-_> <Plug>(pydocstring)


" THEME
colors zenburn

" AIRLINE
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='dark'

" TMUXLINE

" windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

vnoremap <C-h> <C-w>h
vnoremap <C-j> <C-w>j
vnoremap <C-k> <C-w>k
vnoremap <C-l> <C-w>l

" Buffers
nnoremap <A-l> :bn<cr>
nnoremap <A-h> :bp<cr>

" tabs
nnoremap <C-t> :tabnew %<CR>
inoremap <C-t> <Esc>:tabnew %<CR>
nnoremap <A-j> :tabn<CR>
nnoremap <A-k> :tabp<CR>

" splits
nnoremap <leader>" :split<CR>
nnoremap <leader>% :vsplit<CR>

" Fast window resizing with Shift + Arrow key
if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

if bufwinnr(1)
  nnoremap <S-Down> <C-W>+
  nnoremap <S-Up> <C-W>-
  nnoremap <S-Left> <C-W><
  nnoremap <S-Right> <C-W>>
endif

" EDITING
" copy paste to/from clipboard
vnoremap <Leader>y "+y
vnoremap <Leader>p "+p
nnoremap <Leader>P "+P
nnoremap <Leader>y "+y
nnoremap <Leader>p "+p

nnoremap gp "0p
vnoremap gp "0p

" Current file name to clipboard
nnoremap <leader>g :let @+ = expand('%:p')<CR>

" If you like "Y" to work from the cursor to the end of line
map Y y$
" Change text previous to cursor
map S c^

" vim-surround use s
map s ys
map ss yss

" search across project
nnoremap <F1> :vimgrep /<C-R><C-W>/j ./**/*<Left><Left><Left><Left><Left><Left><Left><Left><Left>
nnoremap <leader>/ :vimgrep //j ./**/*<Left><Left><Left><Left><Left><Left><Left><Left><Left>
" substitute
vnoremap <F2> :s///gc<Left><Left><Left><Left>
nnoremap <F2> :%s///gc<Left><Left><Left><Left>

map <F3> :call ToggleQuickfix()<CR>

" Delete lines that fit a pattern
nnoremap <F4> :g//d<Left><Left>

" refresh
map <F5> :e<CR>

let g:SpellLangList= ["en_us", "es", "en_us,es"]
nnoremap <F6> :call ToggleCycleSpellLang()<CR>

map <F7> :Gvdiffsplit!<CR>
map <F8> :Gstatus<CR>

" quickfix loclist navigation
map [q :cprev<CR>
map ]q :cnext<CR>
map [l :prev<CR>
map ]l :lnext<CR>

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :tabnew $MYVIMRC<CR>
nnoremap <leader>ez :tabnew ~/.zshrc<CR>
nnoremap <leader>so :source %<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>et :tabnew ~/.tmux.conf<CR>

" when you forgot to sudo before editing a file that requires root privileges
cmap w!! w !sudo tee % >/dev/null


" NERDTREE
nnoremap <leader>t :NERDTreeToggle<cr>
map <leader>c :NERDTreeFind<cr>

" open NERDTree automatically when vim starts up
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" close vim if the only window left open is a NERDTree
autocm bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" CTRL-P
nnoremap <silent> <c-b> :CtrlPBuffer<cr>
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_map = '<c-p>'

let g:ctrlp_show_hidden = 1

" git
let g:gitgutter_map_keys = 0
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

omap ih <Plug>(GitGutterTextObjectInnerPending)
omap ah <Plug>(GitGutterTextObjectOuterPending)
xmap ih <Plug>(GitGutterTextObjectInnerVisual)
xmap ah <Plug>(GitGutterTextObjectOuterVisual)

nmap <leader>hp <Plug>(GitGutterPreviewHunk)
nmap <leader>hs <Plug>(GitGutterStageHunk)
nmap <leader>hu <Plug>(GitGutterUndoHunk)


"- ultisnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsListSnippets = '<leader>s'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" if has('nvim')
"     let g:deoplete#enable_at_startup = 1
" else
"     let g:deoplete#enable_at_startup = 0
" endif

" vim-tmux-runner
let g:VtrStripLeadingWhitespace = 0
let g:VtrClearEmptyLines = 0
let g:VtrAppendNewline = 1
let g:vtr_filetype_runner_overrides = {
        \ 'python': 'python3 {file}'
        \ }

" vim-multi-cursor
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" ALE
let g:ale_enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" TODO BUG FIX with deoplete and vim-multicursor
" func! Multiple_cursors_before()
"   if deoplete#is_enabled()
"     call deoplete#disable()
"     let g:deoplete_is_enable_before_multi_cursors = 1
"   else
"     let g:deoplete_is_enable_before_multi_cursors = 0
"   endif
" endfunc
" func! Multiple_cursors_after()
"   if g:deoplete_is_enable_before_multi_cursors
"     call deoplete#enable()
"   endif
" endfunc


" vim-pydocstring 
" doq
let g:pydocstring_doq_path='/home/acardoso/.pyenv/shims/doq'
