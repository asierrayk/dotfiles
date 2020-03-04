set nocompatible              " be iMproved, required
set t_Co=256
set t_ut=
set background=dark
set mouse=n
set ttymouse=xterm2 
filetype off                  " required

filetype plugin indent on

set clipboard=unnamed

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
set encoding=utf-8          " always use unicode
set backspace=indent,eol,start " backspace always works on insert mode
set hidden

set wildmenu
set noshowmode " required for jedi-vim function signature
set laststatus=2        " always show statusbar
set number              " show line numbers
set relativenumber      " show numbers as relative by default
set showmatch           " higlight matching parentheses and brackets

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*/.venv/*,*/venv/*,*/logs/*

call plug#begin()

Plug 'VundleVim/Vundle.vim'

" Plug '~/.vim/plugged/YouCompleteMe'
" Plug 'Valloric/YouCompleteMe'

" Apparence
Plug 'jnurmine/Zenburn'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'

Plug 'ap/vim-css-color'

" general programming languages
" Plug 'scrooloose/syntastic'

" python specific
Plug 'klen/python-mode'
Plug 'vim-scripts/indentpython.vim'
Plug 'davidhalter/jedi-vim'

" Editing
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-multiple-cursors'
Plug 'ervandew/supertab'
" to camelCase crc, to snake_case crs
Plug 'tpope/vim-abolish'
" Plug 'sjl/gundo.vim'

" snippets engine
Plug 'SirVer/ultisnips'

" snippets
Plug 'honza/vim-snippets'

" deoplete for snippets completion
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

" Search utils
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Latex?
" Plug 'lervag/vimtex'

" Jupyter notebook
" Plug 'szymonmaszke/vimpyter'

" Markdown preview
" If you don't have nodejs and yarn
" use pre build
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" All of your plugins must be added before the following line
call plug#end()


" THEME
colors zenburn



" POSITIONING
noremap <space><space> zz

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
" Tab navigation like Firefox.
nnoremap <C-t> :tabnew %<CR>
inoremap <C-t> <Esc>:tabnew %<CR>

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

" If you like "Y" to work from the cursor to the end of line
map Y y$
" Change text previous to cursor
map S c^

" vim-surround use s
map s ys
map ss yss


" search across porject
map <F1> :vimgrep /<C-R><C-W>/j ./**/*<Left><Left><Left><Left><Left><Left><Left><Left><Left>
" substitute
vnoremap <F2> :s///gc<Left><Left><Left><Left>
nnoremap <F2> :%s///gc<Left><Left><Left><Left>
"refresh
map <F5> :e<CR>

" Markdown
" TODO change to only work with md files
nmap <F12> <Plug>MarkdownPreviewToggle
map <F8> :Gstatus<CR>
map <F9> :Gdiffsplit<CR>
map <F10> :copen<CR>

" toggle gundo
" nnoremap <leader>u :GundoToggle<CR>

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


" JEDI
let g:jedi#completions_enabled = 1
let g:jedi#completions_command = '<C-n>'
let g:jedi#rename_command = '<leader>rn'
" let g:jedi#auto_initialization = 1
let g:jedi#popup_on_dot = 0
" let g:jedi#popup_select_first = 1
let g:jedi#auto_close_doc = 0
let g:jedi#show_call_signatures = 2
let g:jedi#show_call_signatures_delay = 0
" let g:jedi#rename_command = ''
" let g:jedi#usages_command = ''
" let g:jedi#auto_vim_configuration = 1
let g:jedi#documentation_command = 'K'
" let g:jedi#goto_stubs_command = ''
" let g:jedi#goto_assignments_command = ''
" let g:jedi#goto_command = ''
let g:jedi#use_tabs_not_buffers = 0
" let g:jedi#completions_command = ''
" let g:jedi#popup_select_first = 0
" let g:jedi#use_tabs_not_buffers = 0
" let g:jedi#smart_auto_mappings = 0
" let g:jedi#use_tag_stack = 0

" PYMODE
" TODO source python.vim
let python_highlight_all=1
syntax on
set nofoldenable

" :help python-mode
let g:pymode = 1
let g:pymode_warnings = 1
let g:pymode_trim_whitespaces = 1
" let g:pymode_options_max_line_length = 79
let g:pymode_options_colorcolumn = 0
let g:pymode_python = 'python3'
let g:pymode_indent = 1
let g:pymode_motion = 1
let g:pymode_doc = 0
let g:pymode_doc_bind = ''
let g:pymode_virtualenv = 1
let g:pymode_run = 1
let g:pymode_run_bind = '<leader>rr'
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'
let g:pymode_breakpoint_cmd = ''

let g:pymode_lint = 1
let g:pymode_lint_on_write = 0
let g:pymode_lint_unmodified = 1
let g:pymode_lint_on_fly = 0
let g:pymode_lint_message = 1
let g:pymode_lint_checkers = ['pylint', 'pyflakes', 'pep8', 'mccabe', 'pep257']

"Skip errors and warnings                                *'g:pymode_lint_ignore'*
"E.g. "E501,W002", "E2,W" (Skip all Warnings and Errors that starts with E2) and etc
let g:pymode_lint_ignore = "D107,D203,D212,D213,D402,D413"

" Select some error or warnings.                          *'g:pymode_lint_select'*
" By example you disable all warnings starting from 'W', but want to see warning
" 'W0011' and warning 'W430'
" let g:pymode_lint_select = "E501,W0011,W430"

" Sort errors by relevance                                  *'g:pymode_lint_sort'*
" If not empty, errors will be sort by defined relevance
" E.g. let g:pymode_lint_sort = ['E', 'C', 'I']  " Errors first 'E',
" after them 'C' and ...
" >
" let g:pymode_lint_sort = []

" Auto open cwindow (quickfix) if any errors have been found
let g:pymode_lint_cwindow = 0
" Place error |signs|                                             *'g:pymode_signs'*
let g:pymode_lint_signs = 1

let g:pymode_lint_todo_symbol = 'WW'
let g:pymode_lint_comment_symbol = 'CC'
let g:pymode_lint_visual_symbol = 'RR'
let g:pymode_lint_error_symbol = 'EE'
let g:pymode_lint_info_symbol = 'II'
let g:pymode_lint_pyflakes_symbol = 'FF'


autocmd! FileType python nnoremap <leader>f :PymodeLintAuto<CR>

let g:pymode_rope = 0
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
" avoid lag json folding
let g:pymode_folding = 0


" YouCompleteMe
" let g:ycm_python_binary_path = '/usr/bin/python3'
" let g:ycm_autoclose_preview_window_after_completion=0
" nnoremap K :YcmCompleter GetDoc<CR>

" git
let g:gitgutter_map_keys = 0

"- ultisnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsListSnippets = '<c-s>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<c-p>'

" supertab
let g:SuperTabDefaultCompletionType = "context"
" let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0


" JSON Format
autocmd! FileType json nnoremap <leader>f :%!python -m json.tool<CR>


" vim-tmux-runner
let g:VtrStripLeadingWhitespace = 0
let g:VtrClearEmptyLines = 0
let g:VtrAppendNewline = 1
let g:vtr_filetype_runner_overrides = {
        \ 'python': 'python3 {file}'
        \ }

