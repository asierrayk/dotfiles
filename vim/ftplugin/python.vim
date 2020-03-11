set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
set fileformat=unix

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
let python_highlight_all=1

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
let g:pymode_lint_unmodified = 0
let g:pymode_lint_on_fly = 0
let g:pymode_lint_message = 1
let g:pymode_lint_checkers = ['pylint', 'pyflakes', 'pep8', 'mccabe', 'pep257']

"Skip errors and warnings                                *'g:pymode_lint_ignore'*
"E.g. "E501,W002", "E2,W" (Skip all Warnings and Errors that starts with E2) and etc
let g:pymode_lint_ignore = ["D107", "D203", "D212", "D213", "D402", "D413"]

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
let g:pymode_lint_cwindow = 1
" Place error |signs|                                             *'g:pymode_signs'*
let g:pymode_lint_signs = 1

let g:pymode_lint_todo_symbol = 'WW'
let g:pymode_lint_comment_symbol = 'CC'
let g:pymode_lint_visual_symbol = 'RR'
let g:pymode_lint_error_symbol = 'EE'
let g:pymode_lint_info_symbol = 'II'
let g:pymode_lint_pyflakes_symbol = 'FF'


nnoremap <leader>f :PymodeLintAuto<CR>

let g:pymode_rope = 0
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
" avoid lag dict folding
let g:pymode_folding = 0
