setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=79
setlocal expandtab
setlocal autoindent
setlocal fileformat=unix
setlocal wrap
setlocal textwidth=0


map <F12> :PymodeLint<CR>
nnoremap <leader>f :PymodeLintAuto<CR>

nnoremap <leader>i :ImportName<CR>
nnoremap <leader>I :ImportNameHere<CR>

" jimf/vim-pep8-text-width
" let g:pep8_text_width = 150           " Default 79
" let g:pep8_comment_text_width = 72   " Default 72

" python-syntax
let g:python_highlight_all = 1


" JEDI
let g:jedi#completions_enabled = 1
let g:jedi#completions_command = '<C-n>'
let g:jedi#rename_command = '<leader>rn'
" let g:jedi#auto_initialization = 1
" let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#auto_close_doc = 0
let g:jedi#show_call_signatures = 2
let g:jedi#show_call_signatures_delay = 0
" let g:jedi#rename_command = ''
" let g:jedi#usages_command = ''
" let g:jedi#auto_vim_configuration = 1
let g:jedi#documentation_command = 'K'
let g:jedi#goto_stubs_command = ''
let g:jedi#goto_assignments_command = ''
" let g:jedi#goto_command = ''
let g:jedi#use_tabs_not_buffers = 0
" let g:jedi#completions_command = ''
" let g:jedi#popup_select_first = 0
" let g:jedi#use_tabs_not_buffers = 0
" let g:jedi#smart_auto_mappings = 0
" let g:jedi#use_tag_stack = 0
nnoremap <leader>vd <C-w>v :call jedi#goto()<CR>

" PYMODE
" let python_highlight_all=1

" " :help python-mode
" let g:pymode = 0
" let g:pymode_warnings = 1
" let g:pymode_trim_whitespaces = 1
" " let g:pymode_options_max_line_length = 79
" let g:pymode_options_colorcolumn = 0
" let g:pymode_python = 'python3'
" let g:pymode_indent = 1
" let g:pymode_motion = 1
" let g:pymode_doc = 0
" let g:pymode_doc_bind = ''
" let g:pymode_virtualenv = 1
" let g:pymode_run = 1
" let g:pymode_run_bind = '<leader>rr'
" let g:pymode_breakpoint = 1
" let g:pymode_breakpoint_bind = '<leader>b'
" let g:pymode_breakpoint_cmd = ''

" let g:pymode_lint = 0
" let g:pymode_lint_on_write = 0
" let g:pymode_lint_unmodified = 0
" let g:pymode_lint_on_fly = 0
" let g:pymode_lint_message = 0

" let g:pymode_rope = 0
" let g:pymode_rope_lookup_project = 0
" let g:pymode_rope_completion = 0
" let g:pymode_rope_complete_on_dot = 0
" " avoid lag dict folding
" let g:pymode_folding = 0


" ALE 
let g:ale_python_auto_pipenv = 1
let g:ale_completion_enabled = 1

" let b:ale_linters = ['flake8', 'mypy', 'pylint']
let b:ale_linters = ['flake8', 'pylint']
" Fix Python files with autopep8 and yapf.
let b:ale_fixers = ['autopep8', 'yapf', 'isort', 'black']

nnoremap <leader>f :ALEFix<CR>
