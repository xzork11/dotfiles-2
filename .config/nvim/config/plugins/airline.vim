let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
let g:airline_extentions = ['whitespace']


" +-----------------------------------------------------------------------------+
" | A | B |                     C                            X | Y | Z |  [...] |
" +-----------------------------------------------------------------------------+

function! AirlineInit()
	let g:airline_section_a = airline#section#create(['mode', 'branch'])
	let g:airline_section_b = airline#section#create(['ffenc'])
	let g:airline_section_c = airline#section#create(['%f'])
	let g:airline_section_x = airline#section#create(['filetype'])
	let g:airline_section_y = airline#section#create(['filetype'])
endfunction
" autocmd VimEnter * call AirlineInit()
