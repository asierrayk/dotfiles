set t_Co=256
set t_ut=
set background=dark
set mouse=n
set ttymouse=xterm2

set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin()

Plug '~/.vim/plugged/YouCompleteMe'
Plug 'VundleVim/Vundle.vim'
Plug 'davidhalter/jedi-vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/indentpython.vim'
Plug 'scrooloose/syntastic'
Plug 'nvie/vim-flake8'
Plug 'jnurmine/Zenburn'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'hynek/vim-python-pep8-indent'
Plug 'tpope/vim-commentary'
Plug 'jmcantrell/vim-virtualenv'
Plug 'klen/python-mode'
Plug 'christoomey/vim-tmux-navigator'
Plug 'airblade/vim-gitgutter'
Plug 'ervandew/supertab'
Plug 'sjl/gundo.vim'
Plug 'christoomey/vim-tmux-runner'
Plug 'lervag/vimtex'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'szymonmaszke/vimpyter'

" ULTISNIPS
Plug 'SirVer/ultisnips'

" Optional
Plug 'honza/vim-snippets'

" MArkdown
" If you don't have nodejs and yarn
" use pre build
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }


" All of your plugins must be added before the following line
call plug#end()
filetype plugin indent on


set clipboard=unnamed
colors zenburn

" Stop acting like classic vi
set history=1000            " increase history size
set noswapfile              " don't create swapfiles
set nobackup                " don't backup, use git!

" Modify indenting settings
set autoindent              " autoindent always ON.
set expandtab               " expand tabs
set shiftwidth=4            " spaces for autoindenting
set softtabstop=4           " remove a full pseudo-TAB when i press <BS>

" Modify some other settings about files
set encoding=utf-8          " always use unicode (god damnit, windows)
set backspace=indent,eol,start " backspace always works on insert mode
set hidden


set showmode            " always show which more are we in
set laststatus=2        " always show statusbar
set number              " show line numbers
set relativenumber      " show numbers as relative by default
set showmatch           " higlight matching parentheses and brackets

" MOVEMENT
" highlight last inserted text
nnoremap gV `[v`]

" windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

vnoremap <C-h> <C-w>h
vnoremap <C-j> <C-w>j
vnoremap <C-k> <C-w>k
vnoremap <C-l> <C-w>l

map <Space> <leader>

" tabs
nnoremap <leader>tn :tabnew<Space>
nnoremap <leader>tj :tabnext<CR>
nnoremap <leader>tk :tabprev<CR>
nnoremap <leader>l :tabnext<CR>
nnoremap <leader>h :tabprev<CR>
nnoremap <leader>th :tabfirst<CR>
nnoremap <leader>tl :tablast<CR>
nnoremap <leader>tt :tabedit<Space>
nnoremap <leader>td :tabclose<CR>
nnoremap <leader>to :tabonly<CR>

" splits
nnoremap <leader>% :split<CR>
nnoremap <leader>" :vsplit<CR>

" EDITING
" copy paste to/from clipboard
vnoremap <Leader>y "+y
vnoremap <Leader>p "+p
nnoremap <Leader>P "+P
nnoremap <Leader>y "+y
nnoremap <Leader>p "+p

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
nmap <leader>nt :NERDTree<cr>

" open NERDTree automatically when vim starts up
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" close vim if the only window left open is a NERDTree
autocm bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" PYTHON
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |


let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>G :YcmCompleter GoTo<CR>
map <leader>K :YcmCompleter GetDoc<CR>
map <leader>rf :YcmCompleter GoToReferences<CR>

let python_highlight_all=1
syntax on


" PYMODE
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:pymode_motion = 0
let g:pymode_doc = 0
let g:pymode_virtualenv = 1
let g:pymode_run = 0


nnoremap <leader>b Oimport pdb; pdb.set_trace()<Esc>

" let g:pymode_rope_goto_definition_bind="<leader>g"
" let g:pymode_rope_show_doc_bind = '<leader>k'
set nofoldenable
let g:pymode_lint = 1
let g:pymode_lint_on_write = 1
let g:pymode_lint_on_fly = 0
let g:pymode_lint_message = 1
autocmd! FileType python nnoremap <leader>f :PymodeLintAuto<CR>

let g:pymode_rope = 0
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_completion = 0

let g:pymode_rope_rename_bind = '<leader>rn'

" avoid lag json folding
let g:pymode_folding = 0

" JEDI
let g:jedi#popup_on_dot = 0

" GITGUTTER
let g:gitgutter_map_keys = 0

" SNIPPETS
" let g:snipMate = {}
" let g:snipMate.snippet_version = 1
" imap <tab> <Plug>snipMateTrigger

" youcompleteme
let g:ycm_key_list_select_completion   = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
" supertab
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


" JSON Format
autocmd! FileType json nnoremap <leader>f :%!python -m json.tool<CR>


" vim-tmux-runner
let g:VtrStripLeadingWhitespace = 0
let g:VtrClearEmptyLines = 0
let g:VtrAppendNewline = 1
let g:vtr_filetype_runner_overrides = {
        \ 'python': 'python3 {file}'
        \ }

" Markdown
nmap <leader>md <Plug>MarkdownPreviewToggle
