set nu rnu										" show relative line numbers
set encoding=utf-8 						" set encoding to utf-8
set mouse=a 									" enable mouse
set wrap linebreak 						" break lines instead of words

" Open new splits to bottom or to right instead of above and left
set splitbelow splitright

" Automatically deletes all trailing whitespace and newlines at end of file on save.
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e
autocmd BufWritePre *.[ch] %s/\%$/\r/e
