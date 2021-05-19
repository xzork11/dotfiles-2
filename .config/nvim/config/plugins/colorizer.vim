" For displaying colors
set termguicolors

let g:Hexokinase_highlighters = ['backgroundfull']
let g:Hexokinase_refreshEvents = ['TextChanged', 'InsertLeave', 'BufRead']

autocmd Filetype * :HexokinaseTurnOn
