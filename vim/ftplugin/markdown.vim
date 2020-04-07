" Markdown
" I never going to work on any Modula-2 file
" Interpret .md extension as a markdown file
au BufRead,BufNewFile *.md set filetype=markdown

setlocal spelllang=en_us,es
setlocal spell

map <F12> <Plug>MarkdownPreviewToggle
