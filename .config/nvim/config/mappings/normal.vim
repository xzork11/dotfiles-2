" Open coc-explorer in current working directory
nnoremap <leader>e :CocCommand explorer<CR>

" Go to different split
nnoremap <c-h> <c-w><c-h>
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>

" Resize splits
nnoremap <silent> <C-Up>    :resize +2<CR>
nnoremap <silent> <C-Down>  :resize -2<CR>
nnoremap <silent> <C-Left>  :vertical resize +2<CR>
nnoremap <silent> <C-Right> :vertical resize -2<CR>

" Toggle spellcheck
nnoremap <leader>sc :set spell!<CR>

" Find and edit next <++>
nnoremap <leader><leader> /<++><CR>:nohlsearch<CR>f>a<Backspace><Backspace><Backspace><Backspace>

" Paste the current buffer content instead of next <++>
nnoremap <leader>paste /<++><CR>:nohlsearch<CR>f>a<Backspace><Backspace><Backspace><Backspace><Esc>p

" Using system clipboard
nnoremap <leader>y "+y
nnoremap <leader>p "+p

" Center the search results or bottom of document
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap G Gzz
