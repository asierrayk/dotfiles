" Markdown
" I never going to work on any Modula-2 file
" Interpret .md extension as a markdown file
au BufRead,BufNewFile *.md set filetype=markdown

set spelllang=es
set spell

map <F12> <Plug>MarkdownPreviewToggle
